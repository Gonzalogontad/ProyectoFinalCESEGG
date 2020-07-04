/*
 * pruebas.h
 *
 *  Created on: 24 jun. 2020
 *      Author: root
 */
#include "portsDriver.h"
#ifndef INC_PRUEBAS_H_
#define INC_PRUEBAS_H_
#define PARAM_NUM 	5 //numero de parametros de entrada
#define RESULT_NUM 	5 //numero de resultados
typedef struct
{
uint8_t test; //Test en curso
uint8_t state; //estado de la maquina de estados
portsData_t port;//Puerto
uint8_t i;// numero de iteracion
uint8_t adcSamples; //numero de samples de ADC
uint32_t param[PARAM_NUM];	//parametros de la prueba ( entrada)
uint32_t result[RESULT_NUM]; //resultados de la prueba (salida)
uint32_t tickRegister;		//Guardo los valores del Tick counter para medir tiempos
uint16_t ADC_1; //Suma de muestras
uint16_t ADC_2; //Suma de muestras

uint8_t  in0Sum; // Suma 1 cuando in0 esta en 1 y resta 1 cuando in0 esta en 0
uint8_t  in1Sum;
uint8_t  in2Sum;
uint8_t pasa;//indicador de pasa o no pasa
} testState_t;

enum estados {
	INIT,
	START,
	WAIT_5S,
	POWER_ON,
	WAIT_5S2,
	MEASURE,
	STOP,
	WAIT_2S,
	WAIT_2S2,
	TRIGGER,
	WAIT_ON,
	WAIT_OFF,
	CHECK_TIME

};

void FSMPruebaDrivers(testState_t *FSMReg);
void FSMPruebaTemporizadores(testState_t *FSMReg);
bool_t checkTimeout (uint32_t initialTick, uint32_t timeoutMS);

#endif /* PROYECTOS_CESE_PROYECTOFINALGG_PROYECTOFINALCESEGG_SOFT_MODPRINCIPALCIAA_INC_PRUEBAS_H_ */
