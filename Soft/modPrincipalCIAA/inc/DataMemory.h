/*
 * DataMemory.h
 *
 *  Created on: 25 ago. 2020
 *      Author: root
 */
#include "sapi.h"
#include "pruebas.h"

#ifndef DATAMEMORY_H_
#define DATAMEMORY_H_



extern uint32_t parametersROM[TESTS_QTY][PARAM_NUM*PORTS_NUMBER];

//Inicializar EEPROM
bool initEeprom(void);

//Cargar parametros desde EEPROM
void loadParameters (uint32_t testNumber);
void loadParametersUnprotected (uint32_t testNumber);

//Obtener el puntero a los paramtros del test en RAM
uint32_t * getParameters (uint32_t testNumber,uint8_t port);

//Guardar los parametros del test en EEPROM
void saveParameters (uint32_t testNumber);

//Cargar Datos WIFI desde EEPROM
void loadWIFIData (char * SSID,char * PASS,char * IP);

//Guardar Datos WIFI en EEPROM
void saveWIFIData (char * SSID,char * PASS,char * IP);



//Actualizar los parametros en los registros de las FSM
//void updateAllParameters (uint8_t testNum);



#endif /* DATAMEMORY_H_ */
