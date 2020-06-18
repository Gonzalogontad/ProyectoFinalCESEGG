/*=============================================================================
 * Copyright (c) 2020, Gonzalo Gontad <gonzalogontad@gmail.com>
 * All rights reserved.
 * License: mit (see LICENSE.txt)
 * Date: 2020/06/14
 * Version: v1.0
 *===========================================================================*/

/*=====[Avoid multiple inclusion - begin]====================================*/

#ifndef PORTS_DRIVER_H_
#define PORTS_DRIVER_H_

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

#define PORTS_NUMBER 6 //Cantidad de puertos instalados
#define IN_QUEUE_LEN 30 //30 muestras en cola de entrada
#define OUT_QUEUE_LEN 30 //30 muestras en cola de saluda


/*=====[Public function-like macros]=========================================*/

/*=====[Definitions of public data types]====================================*/

typedef struct
{
	uint8_t portAddr; //Address del puerto (numero de puerto)
	QueueHandle_t onTxQueue; //cola de transmision (por esta cola llegan los datos empaquetados para salir)
	QueueHandle_t onRxQueue; //cola de recepcion (por esta cola llegan los datos validados para el port, pero sin separar)
} portsData_t;

typedef struct
{
uartMap_t uartValue; //Numero de UART a utilizar
uint32_t baudRate; //velocidad de transmision
TimerHandle_t onTxTimeOut; //Timer para el timeout de la transmision
portsData_t port [PORTS_NUMBER]; //Datos de entrada y salida de cada puerto
} portsConfig_t;


typedef struct
{
	uint8_t txData[3];
} txData_t;

typedef struct
{
	uint8_t rxData[4];
} rxData_t;

/*=====[Prototypes (declarations) of public functions]=======================*/

//bool_t	portsInit	(uartMap_t,uint32_t , driverConfig_t*);
bool_t portsdriverInit(portsConfig_t *ports);
void onTxTimeOutCallback(TimerHandle_t xTimer);
void portsDataInit (portsData_t *port);
void onTxCallback(void*param);
bool_t sendDataPort(portsData_t * port,uint16_t DAC, uint8_t digitalOuts,TickType_t timeout);
bool_t receiveDataPort(portsData_t * port,uint16_t *ADC1,uint16_t *ADC2, uint8_t *digitalIn,TickType_t timeout);
void onRxCallback(void *param);
//char*	getBuffer 	(driverConfig_t* selectedUart);
//void 	putBuffer	(driverConfig_t* selectedUart, char *blockToFree);
//int 	packetTX 	(driverConfig_t* selectedUart,char *txBlock);
//char* 	waitPacket	(driverConfig_t* );

/*=====[Prototypes (declarations) of public interrupt functions]=============*/

/*=====[C++ - end]===========================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion - end]======================================*/

#endif /* MYPROJECTS_RTOS2_TP1_INC_DRIVER_H_ */
