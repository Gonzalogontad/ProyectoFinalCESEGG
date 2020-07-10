/*
 * interpreter.h
 *
 *  Created on: 4 jul. 2020
 *      Author: root
 */

#ifndef INTERPRETER_H_
#define INTERPRETER_H_

#include "FreeRTOS.h"
#include "queue.h"
#include "sapi.h"


#define INTERPRETER_QUEUE_LEN 5
enum panels {
	DEF = 0,
	DRIVER_TEST = 1,
	TIMER_TEST = 2,
	};
typedef struct
{
	uint8_t panelNum; //Numero de panel al que corresponde el comando
	char buttonId[4]; //numero equivalente al boton presionado
	uint32_t parameters [4]; //Vector con los cuatro parametros si corresponden.
} command_t;

uint8_t actualPanelNumber; //Panel sobre el que se esta trabajando (equivale a la prueba que se esta ejecutando)

QueueHandle_t commandsQueue;

bool_t interpreterInit();
void sendCommand(command_t command);
void interpreter ();
void refreshPageData(char*);

#endif /*INTERPRETER_H_ */
