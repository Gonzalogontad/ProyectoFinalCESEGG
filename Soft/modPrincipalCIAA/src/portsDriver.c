/*=============================================================================
 * Copyright (c) 2019, Gonzalo Gontad <gonzalogontad@gmail.com>
 * All rights reserved.
 * License: MIT (see LICENSE.txt)
 * Date: 2019/09/29
 * Version: v1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "portsDriver.h"
#include "sapi.h"
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Inicializacion del driver de puertos de prueba
// Requiere que se le pase una variable del tipo driverConfig_t
// con los siguientes datos:
// 	selectedUart.uartValue = (por ej:UART_USB);
//	selectedUart.baudRate = (por ej: 115200);
bool_t portsdriverInit(portsConfig_t *ports)
{
	uint8_t i; //variable auxiliar


	//Creacion de colas

	for (i=0; i< PORTS_NUMBER; i++)
	{
		ports->port[i].portAddr = i;
		//Creo la cola para la recepción de un dato válido hacia la aplicación.

		ports->port[i].onRxQueue  = xQueueCreate(IN_QUEUE_LEN, sizeof(rxData_t));

		//Creo una cola donde van a ir los datos que tengo que mandar por UART
		ports->port[i].onTxQueue = xQueueCreate(OUT_QUEUE_LEN, sizeof(txData_t));

		//Verifico la correcta creacion de las colas
		if((ports->port[i].onRxQueue == NULL)||(ports->port[i].onTxQueue == NULL))
		{
			return (false);
		}
	}

	// Creo el timer que dispara la comunicacion con los puertos cada 1ms

	ports->onTxTimeOut = xTimerCreate("Transmit", pdMS_TO_TICKS(1),pdTRUE, (void*) ports, onTxTimeOutCallback);


	//Verifico la correcta creacion del timer
	if (ports->onTxTimeOut==NULL)
	{
		return (false);
	}


	// Inicializo la UART que se ha seleccionado y con el baud rate especificado.
	uartConfig(ports->uartValue, ports->baudRate);

	//Configuro el callback de la recepcion de UART
	uartCallbackSet(ports->uartValue, UART_RECEIVE, onRxCallback,(void*) ports);

	//Inicializo el vector de datos de salida
	portsDataInit (ports->port);

	// Habilitamos todas las interrupciones de la UART seleccionada.
	uartInterrupt(ports->uartValue, true);

	//Inicio el timer
	xTimerStart( ports->onTxTimeOut, 0 );

	// Si todos los elementos fueron creados e inicializados correctamente,
	// indicamos que el driver está listo para ser utilizado.
	return(true);
}


// Callback para la recepción serie a través de la UART USB.
void onRxCallback(void *param)
{
	UBaseType_t uxSavedInterruptStatus;
	BaseType_t xHigherPriorityTaskWoken;
	uint8_t aux;
	static rxData_t receivedData;
	static uint8_t byteNumber=0;

	//Paso por param los datos del puerto
	portsConfig_t* ports = (portsConfig_t*) param;

	//Inicio seccion critica
	uxSavedInterruptStatus = taskENTER_CRITICAL_FROM_ISR();	//

	aux = uartRxRead(ports->uartValue);

	if(aux & 0x80) //Si el primer bit es 1 significa que estoy recibiendo el primer byte
		{
		byteNumber=1;
		receivedData.rxData [0]=aux;
		}
	else
	{
		if(byteNumber==1)
		{
			byteNumber=2;
			receivedData.rxData [1]= aux;
		}
		else
		{
			if(byteNumber==2)
			{
				byteNumber=3;
				receivedData.rxData [2]= aux;
			}
			else{
				byteNumber==0;
				receivedData.rxData [3] = aux;
				aux=(receivedData.rxData[0]>>4)&0x07; //Obtengo el address del puerto que envio el dato
				if (aux<PORTS_NUMBER) //Agregado por error al desconectar
					xQueueSendFromISR( ports->port[aux].onRxQueue, ( void * ) &receivedData, &xHigherPriorityTaskWoken );//Pongo en cola los datos recividos en la cola correspondiente
			}
		}
	}


	taskEXIT_CRITICAL_FROM_ISR(uxSavedInterruptStatus);

	//Chequeo de cambio de contexto
	if (xHigherPriorityTaskWoken)
	{
		/* Actual macro used here is port specific. */
		taskYIELD();
	}

}

//Callback del timer de transmision
//Cada 1ms se llama a esta funcion para enviar los datos a los puertos
void onTxTimeOutCallback(TimerHandle_t xTimer)
{
	// Obtenemos los datos de la UART seleccionada, aprovechando el campo reservado
	// para el Timer ID.
	portsConfig_t *ports= (portsConfig_t *) pvTimerGetTimerID(xTimer);
	gpioToggle( GPIO0 );

	//Configuro el callback de la interrupcion de transmision de UART
	uartCallbackSet(ports->uartValue, UART_TRANSMITER_FREE,onTxCallback, (void*) ports);
	uartSetPendingInterrupt(ports->uartValue);
}

//Inicializacion del vector de datos
void portsDataInit (portsData_t *port)
{
	uint8_t i,j;
	txData_t portData;
	for (i=0; i< PORTS_NUMBER; i++)
	{
		portData.txData[0]=(i<<4)|0x80; //Armo el primer byte con el primer bit en uno y el address
		portData.txData[1]=0x00;
		portData.txData[2]=0x00;
		xQueueSend( port[i].onTxQueue, ( void * ) &portData, ( TickType_t ) portMAX_DELAY ); //Pongo en cola el primer dato a enviar
	}
}


//Callback de la interrupcion de transmision por UART
void onTxCallback(void*param)
{
	portsConfig_t *ports = (portsConfig_t *) param; //Datos del puerto de comunicacion UART
	BaseType_t xTaskWokenByReceive = pdFALSE; 		//Variable para evaluar el cambio de contexto al finaliza la interrupcion
	UBaseType_t uxSavedInterruptStatus;
	static txData_t dataToSend[PORTS_NUMBER]; 		//Buffer con los datos a transmitir
	static uint8_t portIndex=0;	//Indice de puerto al que se le esta transmitiendo
	static uint8_t byteIndex=0;	//Indice del byte de cada puerto que se esta transmitiendo
	uint8_t emptyData = 0xff; 	//Byte que se envia dos veces para darle tiempo al esclavo para responder
	uint8_t i;
	static uint8_t transmitEmpty = 0;


	//Leo los datos de todas las colas de puertos para enviarlos (los leo al incio de cada rafaga de datos)
	if (portIndex==0 && byteIndex==0)
	{
		for (i=0;i<PORTS_NUMBER;i++)
			xQueueReceiveFromISR(ports->port[i].onTxQueue,(void*)&dataToSend[i],&xTaskWokenByReceive);

	}

	//Si llegué a la interrupcion es porque hay que enviar datos
	if(transmitEmpty==0) //Transmito datos
	{
		uartTxWrite(ports->uartValue,dataToSend[portIndex].txData[byteIndex]);	//Envio el byte apuntado por portIndex y byteIndex


		if (byteIndex<2)
		{
			byteIndex++;
			uartCallbackSet(ports->uartValue, UART_TRANSMITER_FREE,onTxCallback, (void*) ports);
			uartSetPendingInterrupt(ports->uartValue); //Disparo el envio del siguiente byte
		}
		else
		{
			transmitEmpty=1; //El siguiente dato a transmitir es vacio para dar tiempo al esclavo para responder
		}
	}
	else //Transmito byte vacio
	{
		uartTxWrite(ports->uartValue,emptyData);
		if (transmitEmpty==2) //Si termi
		{
			//Verifico si termine de enviar el frame completo
			if (portIndex<(PORTS_NUMBER-1))
			{
				portIndex++;
				byteIndex=0;
				uartCallbackSet(ports->uartValue, UART_TRANSMITER_FREE,onTxCallback, (void*) ports);
				uartSetPendingInterrupt(ports->uartValue);//Disparo el envio del siguiente byte
			}
			else//Cuando termino deshabilito la interrupción
			{
				portIndex=0;
				byteIndex=0;
				uartCallbackClr(ports->uartValue, UART_TRANSMITER_FREE);
			}

			transmitEmpty=0;
		}
		else
		{
			transmitEmpty++;
			uartCallbackSet(ports->uartValue, UART_TRANSMITER_FREE,onTxCallback, (void*) ports);
			uartSetPendingInterrupt(ports->uartValue);//Disparo el envio del siguiente byte
		}

	}
	//Hago la evaluacion de cambio de cambio de contexto necesario.
	if (xTaskWokenByReceive != pdFALSE)
	{
		taskYIELD ();
	}
}

//Funcion de para transmitir datos a los puertos
bool_t sendDataPort(portsData_t * port,uint16_t DAC, uint8_t digitalOuts,TickType_t timeout)
{
	txData_t portData;
	uint8_t aux;
	if(DAC>1023)
		DAC=1023;
	aux= (uint8_t)(DAC>>7);
	portData.txData[0]=(port->portAddr<<4)|0x80|aux; //Armo el primer byte con el primer bit en uno, el address y la parte alta del dac
	portData.txData[1]=(uint8_t)(DAC & 0x007F); //Armo el segundo byte (parte baja del DAC)
	portData.txData[2]=digitalOuts & 0x0F;
	if (pdTRUE==xQueueSend( port->onTxQueue, ( void * ) &portData, timeout )) //Pongo en cola los datos a enviar
		return true;
	else
		return false;

}

//Funcion para leer datos de los puertos
bool_t receiveDataPort(portsData_t * port,uint16_t *ADC1,uint16_t *ADC2, uint8_t *digitalIn,TickType_t timeout)
{
	rxData_t portData;
	uint8_t aux;
	aux= (uint8_t)(DAC>>7);

	if (pdTRUE==xQueueReceive( port->onRxQueue, ( void * ) &portData, timeout )) //Leo de la cola el dato recibido
	{
		*ADC1 = (((uint16_t)portData.rxData[0] & 0x0F)<<7) | (uint16_t)portData.rxData[1];
		*ADC2 = (((uint16_t)portData.rxData[2] & 0x0F)<<7) | (uint16_t)portData.rxData[3];
		*digitalIn= (portData.rxData[2]>>4) & 0x07;
		return true;
	}
	else
		return false;

}


