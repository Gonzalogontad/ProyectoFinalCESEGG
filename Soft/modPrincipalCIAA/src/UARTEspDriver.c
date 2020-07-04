/*=============================================================================
 * Copyright (c) 2019, Gonzalo Gontad <gonzalogontad@gmail.com>
 * All rights reserved.
 * License: MIT (see LICENSE.txt)
 * Date: 2019/09/29
 * Version: v1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "UARTEspDriver.h"
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
bool_t UARTEspInit(UARTData_t *UARTData)
{
	uint8_t i; //variable auxiliar


		// Creo la cola de recepcion

		UARTData->onRxQueue = xQueueCreate(ESP_IN_QUEUE_LEN, sizeof(uint8_t));

		//	Creo una cola de transmision
		UARTData->onTxQueue = xQueueCreate(ESP_OUT_QUEUE_LEN, sizeof(uint8_t));

		//Verifico la correcta creacion de las colas
		if((UARTData->onRxQueue == NULL)||(UARTData->onTxQueue == NULL))
		{
			return (false);
		}

	// Inicializo la UART que se ha seleccionado y con el baud rate especificado.
	uartConfig(UARTData->uartValue, UARTData->baudRate);

	//Configuro el callback de la recepcion de UART
	uartCallbackSet(UARTData->uartValue, UART_RECEIVE, EspRxCallback,(void*) UARTData);

	//Configuro el callback de la transmision de UART
//	uartCallbackSet(UARTData->uartValue, UART_TRANSMITER_FREE,EspTxCallback, (void*) UARTData);

	// Habilitamos todas las interrupciones de la UART seleccionada.
	uartInterrupt(UARTData->uartValue, true);

	// Si todos los elementos fueron creados e inicializados correctamente,
	// indicamos que el driver está listo para ser utilizado.
	return(true);
}


// Callback para la recepción serie
void EspRxCallback(void *param)
{
	UBaseType_t uxSavedInterruptStatus;
	BaseType_t xHigherPriorityTaskWoken;
	uint8_t receivedData;

	//Paso por param los datos del puerto
	UARTData_t* UARTData = (UARTData_t*) param;

	//Inicio seccion critica
	uxSavedInterruptStatus = taskENTER_CRITICAL_FROM_ISR();	//

	receivedData = uartRxRead(UARTData->uartValue);

	xQueueSendFromISR( UARTData->onRxQueue, ( void * ) &receivedData, &xHigherPriorityTaskWoken );//Pongo en cola los datos recividos en la cola correspondiente


	taskEXIT_CRITICAL_FROM_ISR(uxSavedInterruptStatus);

	//Chequeo de cambio de contexto
	if (xHigherPriorityTaskWoken)
	{
		/* Actual macro used here is port specific. */
		taskYIELD();
	}

}



void EspTxCallback(void*param)
{
	UARTData_t* UARTData = (UARTData_t*) param;

	BaseType_t xTaskWokenByReceive = pdFALSE; //Variable para evaluar el cambio de contexto al finaliza la interrupcion
	UBaseType_t uxSavedInterruptStatus;

	uint8_t dataToSend;

	//Si llegue a la interrupcion es porque alguien la disparo o porque todavia quedan datos en la cola para transmitir
	xQueueReceiveFromISR(UARTData->onTxQueue,(void*)&dataToSend,&xTaskWokenByReceive);

	uartTxWrite(UARTData->uartValue,dataToSend);

	if(pdTRUE == xQueueIsQueueEmptyFromISR( UARTData->onTxQueue ))	//Si no hay mas datos en cola deshabilito la interrupción
	{
		uartCallbackClr(UARTData->uartValue, UART_TRANSMITER_FREE); //Deshabilito la interrupcion de TX
	}


	//Hago la evaluacion de cambio de contexto necesario.
	if (xTaskWokenByReceive != pdFALSE)
	{
		taskYIELD ();
	}
}


bool_t sendEspByte(UARTData_t* UARTData,uint8_t byteToSend,TickType_t timeout)
{
	uint8_t aux;
	if (pdTRUE==xQueueSend( UARTData->onTxQueue, ( void * ) &byteToSend, timeout )) //Pongo en cola los datos a enviar
	{
		//Configuro el callback de la transmision de UART
		uartCallbackSet(UARTData->uartValue, UART_TRANSMITER_FREE,EspTxCallback, (void*) UARTData);
		uartSetPendingInterrupt(UARTData->uartValue);
		return true;
	}
	else
		return false;

}

bool_t sendEspString(UARTData_t* UARTData,char* string)
{
	uint32_t i;
	i=0;
	while (string[i])
	{
		if (false == sendEspByte(UARTData,(uint8_t)string[i],portTICK_RATE_MS * 100))
			return false;
		else
			i++;
	}

}

bool_t receiveEspByte(UARTData_t* UARTData,uint8_t *receivedByte,TickType_t timeout)
{


	if (pdTRUE==xQueueReceive( UARTData->onRxQueue, ( void * ) receivedByte, timeout )) //Leo de la cola el dato recibido
	{
		return true;
	}
	else
		return false;

}

/*=====[Implementations of private functions]================================*/


