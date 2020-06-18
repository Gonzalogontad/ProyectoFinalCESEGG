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
//#include "uartIRQ.h"

/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Inicializacion de parte de transmision del driver
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
		// Creamos la cola para señalizar la recepción de un dato válido hacia la aplicación.

		ports->port[i].onRxQueue  = xQueueCreate(IN_QUEUE_LEN, sizeof(rxData_t));

		//	Creo una cola donde van a ir los datos que tengo que mandar por UART
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
			byteNumber==0;
			receivedData.rxData [2] = aux;
			aux=(receivedData.rxData[0]>>4)&0x07; //Obtengo el address del puerto que envio el dato
			xQueueSendFromISR( ports->port[aux].onRxQueue, ( void * ) &receivedData, &xHigherPriorityTaskWoken );//Pongo en cola los datos recividos en la cola correspondiente
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
void onTxTimeOutCallback(TimerHandle_t xTimer)
{
	// Obtenemos los datos de la UART seleccionada, aprovechando el campo reservado
	// para el Timer ID.
	portsConfig_t *ports= (portsConfig_t *) pvTimerGetTimerID(xTimer);
	gpioToggle( GPIO0 );

	//Configuro el callback de la transmision de UART
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



void onTxCallback(void*param)
{
	portsConfig_t *ports = (portsConfig_t *) param;
	BaseType_t xTaskWokenByReceive = pdFALSE; //Variable para evaluar el cambio de contexto al finaliza la interrupcion
	UBaseType_t uxSavedInterruptStatus;
	static txData_t dataToSend[PORTS_NUMBER];
	static uint8_t portIndex=0;
	static uint8_t byteIndex=0;
	uint8_t i;
	uint8_t emptyData = 0xff; //Byte que se envia dos veces para darle tiempo al esclavo para responder
	static uint8_t transmitEmpty = 0;



	if (portIndex==0 && byteIndex==0)
	{
		for (i=0;i<PORTS_NUMBER;i++)
			xQueueReceiveFromISR(ports->port[i].onTxQueue,(void*)&dataToSend[i],&xTaskWokenByReceive);

	}

	//Si llegué a la interrupcion es porque hay que enviar datos
	if(transmitEmpty==0)
	{
		uartTxWrite(ports->uartValue,dataToSend[portIndex].txData[byteIndex]);
		//Luego verifico si termine de enviar el frame completo y deshabilito la interrupcion
		if (byteIndex<2)
		{
			byteIndex++;
			uartCallbackSet(ports->uartValue, UART_TRANSMITER_FREE,onTxCallback, (void*) ports);
			uartSetPendingInterrupt(ports->uartValue); //Disparo el envio del siguiente byte
		}
		else
		{
			transmitEmpty=1;//
			if (portIndex<(PORTS_NUMBER-1))
			{
				portIndex++;
				byteIndex=0;
				uartCallbackSet(ports->uartValue, UART_TRANSMITER_FREE,onTxCallback, (void*) ports);
				uartSetPendingInterrupt(ports->uartValue);//Disparo el envio del siguiente byte
			}
			else
			{
				portIndex=0;
				byteIndex=0;
				uartCallbackClr(ports->uartValue, UART_TRANSMITER_FREE); //Deshabilito la interrupcion de TX
			}
		}
	}
	else
	{
		uartTxWrite(ports->uartValue,emptyData);
		if (transmitEmpty==2)
			transmitEmpty=0;
		else
			transmitEmpty++;

	}


	//Hago la evaluacion de cambio de cambio de contexto necesario.
	if (xTaskWokenByReceive != pdFALSE)
	{
		taskYIELD ();
	}
}


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


bool_t receiveDataPort(portsData_t * port,uint16_t *ADC1,uint16_t *ADC2, uint8_t *digitalIn,TickType_t timeout)
{
	rxData_t portData;
	uint8_t aux;
	aux= (uint8_t)(DAC>>7);

	if (pdTRUE==xQueueReceive( port->onRxQueue, ( void * ) &portData, timeout )) //Leo de la cola el dato recibido
	{
		*ADC1 = (((uint16_t)portData.rxData[0] & 0x0F)<<7) | (uint16_t)portData.rxData[1];
		*ADC1 = (((uint16_t)portData.rxData[2] & 0x0F)<<7) | (uint16_t)portData.rxData[3];
		*digitalIn= (portData.rxData[2]>>4) & 0x07;
		return true;
	}
	else
		return false;

}


//	packetTX(driverConfig_t* selectedUart, char *txBlock) transmite el bloque
//	txBlock por la UART indicada por selectedUart
/*
int packetTX(driverConfig_t* selectedUart, char *txBlock)
{
	xQueueSend(selectedUart->onTxQueue, &txBlock, portMAX_DELAY); 	// Envio a la cola de transmision el blocke a transmitir
	taskENTER_CRITICAL();				// No permito que se modifique txcounter
	if (selectedUart->txCounter == 0) 	// Si se esta enviando algo no llamo a la interrupcion para no interrumpir el delay
		txInterruptEnable(selectedUart);
	taskEXIT_CRITICAL();
	uartSetPendingInterrupt(selectedUart->uartValue);
}

*/
// 	waitPacket() se queda esperando un paquete de la UART seleccionada y
//	devuelve un puntero al bloque de memoria
/*
char* waitPacket(driverConfig_t* selectedUart)
{
	char*rxBlock;
	xQueueReceive(selectedUart->onRxQueue,(void *)&rxBlock,portMAX_DELAY);// Espero a que venga un bloque por la cola
	return rxBlock;
}
*/
/*=====[Implementations of private functions]================================*/


