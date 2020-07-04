/*=============================================================================
 * Copyright (c) 2020, Gonzalo Gontad <gonzalogontad@gmail.com>
 * All rights reserved.
 * License: mit (see LICENSE.txt)
 * Date: 2020/06/14
 * Version: v1.0
 *===========================================================================*/

/*=====[Avoid multiple inclusion - begin]====================================*/

#ifndef UART_ESP_DRIVER_H_
#define UART_ESP_DRIVER_H_

/*=====[Inclusions of public function dependencies]==========================*/

#include "FreeRTOS.h"
#include "queue.h"
#include "task.h"
#include "string.h"
#include "sapi.h"
#include "timers.h"

/*=====[C++ - begin]=========================================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*=====[Definition macros of public constants]===============================*/


#define ESP_IN_QUEUE_LEN 300 //30 muestras en cola de entrada
#define ESP_OUT_QUEUE_LEN 30 //30 muestras en cola de saluda


/*=====[Public function-like macros]=========================================*/

/*=====[Definitions of public data types]====================================*/



typedef struct
{
uartMap_t uartValue; //Numero de UART a utilizar
uint32_t baudRate; //velocidad de transmision
QueueHandle_t onTxQueue; //cola de transmision
QueueHandle_t onRxQueue; //cola de recepcion
} UARTData_t;


/*=====[Prototypes (declarations) of public functions]=======================*/


bool_t UARTEspInit(UARTData_t *UARTData);
void EspTxCallback(void*param);
void EspRxCallback(void *param);
bool_t sendEspByte(UARTData_t* UARTData,uint8_t byteToSend,TickType_t timeout);
bool_t sendEspString(UARTData_t* UARTData,char* string);
bool_t receiveEspByte(UARTData_t* UARTData,uint8_t *receivedByte,TickType_t timeout);


/*=====[Prototypes (declarations) of public interrupt functions]=============*/

/*=====[C++ - end]===========================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion - end]======================================*/

#endif /* MYPROJECTS_RTOS2_TP1_INC_DRIVER_H_ */
