/*
 * pruebas.h
 *
 *  Created on: 24 jun. 2020
 *      Author: root
 */

#ifndef INC_PRUEBAS_H_
#define INC_PRUEBAS_H_
#include "portsDriver.h"
#define PARAM_NUM 	5 //numero de parametros de entrada
#define RESULT_NUM 	5 //numero de resultados
#define CONTROL_QUEUE_LEN 10
#define TESTS_QTY 2
typedef struct
{
uint8_t test; //Test en curso
uint8_t state; //estado de la maquina de estados
uint32_t result[RESULT_NUM]; //resultados de la prueba (salida)
uint8_t pasa;//indicador de pasa o no pasa
uint32_t param[PARAM_NUM];	//parametros de la prueba ( entrada)
QueueHandle_t testControlQueue; //Cola mediante la cual el interprete de la interfaz de usuario controla la prueba
portsData_t port;//Puerto

//Variables para calculos intermedios
uint8_t i;// numero de iteracion
uint8_t adcSamples; //numero de samples de ADC
uint32_t tickRegister;		//Guardo los valores del Tick counter para medir tiempos
uint16_t ADC_1; //Suma de muestras
uint16_t ADC_2; //Suma de muestras
uint8_t  in0Sum; // Suma 1 cuando in0 esta en 1 y resta 1 cuando in0 esta en 0
uint8_t  in1Sum;
uint8_t  in2Sum;

} testState_t;


//Orden a enviar a las tareas de prueba mediante la cola de instrucciones
typedef struct
{
uint8_t test; //Test a controlar
uint8_t state; //Estado a forzar
} testOrder_t;

//Creo un vecto donde se van a ubicar todos los datos de ejecucion y cominicacion de las tareas de pruebas
//En el vector hay un registro para cada tarea
testState_t FSMRegisters[PORTS_NUMBER];


enum estados {
	INIT,
	TEST_DRIVERS,
	TEST_TIMERS,
	START,
	WAIT_5S,
	POWER_ON,
	WAIT_5S2,
	MEASURE,
	WAIT_2S,
	WAIT_2S2,
	TRIGGER,
	WAIT_OFF,
	CHECK_TIME,



	//Verde
	MARCHA = 21,
	GUARDAR,
	PASA,


	//rojo
	PARADA=31,
	PARAR_TODO,
	STOP,
	NO_PASA,
	WAIT_ON

};

bool_t pruebasInit ();
void testsTask( void* taskParmPtr );
bool_t setTestOrder (uint8_t portNum, uint8_t testNum, uint8_t testState );
uint8_t getTestsState (uint8_t portNum);
bool_t sendToAllTests ( uint8_t testNum, uint8_t testState );
void FSMPruebaDrivers(testState_t *FSMReg);
void FSMPruebaTemporizadores(testState_t *FSMReg);
bool_t checkTimeout (uint32_t initialTick, uint32_t timeoutMS);

#endif /* PROYECTOS_CESE_PROYECTOFINALGG_PROYECTOFINALCESEGG_SOFT_MODPRINCIPALCIAA_INC_PRUEBAS_H_ */
