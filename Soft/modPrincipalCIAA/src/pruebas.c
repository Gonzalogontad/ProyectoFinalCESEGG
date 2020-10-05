/*
 * pruebas.c
 *
 *  Created on: 24 jun. 2020
 *      Author: root
 */

#include "pruebas.h"
#include "task.h"
#include "DataMemory.h"
//Defines Resultados prueba drivers
#define digitalOuts	FSMReg->result[0]
#define digitalIn  	FSMReg->result[1]
#define Vout 		FSMReg->result[2]
#define Vin 		FSMReg->result[3]
#define Iin 		FSMReg->result[4]

//Defines
#define testPort	FSMReg->port
#define sumIn0		FSMReg->in0Sum
#define sumIn1		FSMReg->in1Sum
#define sumIn2		FSMReg->in2Sum

//Parametros prueba drivers
#define testVoltage FSMReg->param [0]
#define testCurrent FSMReg->param [1]
#define ADC1Gain 	FSMReg->param [2]
#define ADC2Gain  	FSMReg->param [3]

//Parametros prueba temporizador
#define minShort 	FSMReg->param [0]
#define maxShort  	FSMReg->param [1]
#define minLong 	FSMReg->param [2]
#define maxLong 	FSMReg->param [3]

//Parametros calibrador
#define Res1		FSMReg->param [0]
#define Res2 		FSMReg->param [1]
#define ADC1G 		FSMReg->param [2]
#define ADC2G  		FSMReg->param [3]

//static uint32_t parametersROM[TESTS_QTY][PARAM_NUM*PORTS_NUMBER];//Creo una matriz donde van a estar todos los parametros de cada test



bool_t pruebasInit ()
{
	//configuro la comunicacion con los puertos de prueba
	static portsConfig_t ports;
	//static UARTData_t UARTData;
	initEeprom();
	uint8_t i,j;
	ports.uartValue = UART_GPIO;
	ports.baudRate = 460800;
	portsdriverInit(&ports);
	for (i=0;i<TESTS_QTY;i++)
	{
		//for(j = 0; j < (PARAM_NUM * PORTS_NUMBER); j++) {
		//	parametersROM[i][j]=0;
		//}

		//taskENTER_CRITICAL(  );
			loadParametersUnprotected ((uint32_t) i); 	//Cargo los parametros desde la EEPROM

		//taskEXIT_CRITICAL(  );
	}

	//Inicializo el vector de datos y comunicacion de los tests
	for (i=0;i<PORTS_NUMBER;i++)
	{
		FSMRegisters[i].port = ports.port[i]; //Asigno las colas del puerto de pruebas
		FSMRegisters[i].test = 0;
		FSMRegisters[i].state = INIT;
		FSMRegisters[i].testControlQueue = xQueueCreate(CONTROL_QUEUE_LEN,sizeof(testOrder_t)); //Creo la cola por donde llegan las ordenes para la tarea de pruebas


		//Creo la tarea de la prueb y le paso el registro de datos
		xTaskCreate(
			testsTask,                     // Function that implements the task.
			(const char *)"Test",     // Text name for the task.
			configMINIMAL_STACK_SIZE, // Stack size in words, not bytes.
			(void*)&FSMRegisters[i],    // Parameter passed into the task.
			tskIDLE_PRIORITY+1,         // Priority at which the task is created.
			0                           // Pointer to the task created in the system
		);
	}
}


void testsTask( void* taskParmPtr )
{
	testState_t *test = (testState_t*) taskParmPtr;

// Send the task to the locked state for 1 s (delay)
   vTaskDelay( 1000 / portTICK_RATE_MS );
   test->state= INIT;
   testOrder_t order;
  // ----- Task repeat for ever -------------------------
   while(TRUE) {
	   if (gpioRead(TEC1)==0)
	   {
		   test->test=1;
	   	   test->state= START;
	   }
	   if (gpioRead(TEC2)==0)
	   {
		   test->test=2;
	   	   test->state= START;
	   }
	   //Si llega alguna instruccion por cola la ejecuto
	   if (pdTRUE == xQueueReceive(test->testControlQueue, &order,0))
	   {
		   test->test=order.test;
	   	   test->state= order.state;

	   }

	   //test->param = &parametersROM[test->test-1][(test->port.portAddr)*PARAM_NUM]; //busco el punto donde estan los parametros del test actual en este puerto

	   //Checkeo si hay datos del puerto y ejecuto la FSM de la pueba
	   if (uxQueueMessagesWaiting(test->port.onRxQueue))
	   {
		 switch(test->test){
			 case 1:
				 FSMPruebaDrivers(test);
				 break;
			 case 2:
				 FSMPruebaTemporizadores(test);
				 break;
			 case 3:
				 FSMCalibracion(test);
				 break;

		 }
	   }

   }
}


bool_t setTestOrder (uint8_t portNum, uint8_t testNum, uint8_t testState )
{
	testOrder_t order;
	order.state = testState;
	order.test = testNum;

	if (pdTRUE == xQueueSend(FSMRegisters[portNum].testControlQueue, &order,0))
		return true;
	else
		return false;

}

bool_t sendToAllTests ( uint8_t testNum, uint8_t testState )
{
	bool_t ret;
	testOrder_t order;
	uint8_t portNum;
	order.state = testState;
	order.test = testNum;
	ret= true;
	for (portNum = 0;portNum<PORTS_NUMBER;portNum++)
	{
		if (pdTRUE != xQueueSend(FSMRegisters[portNum].testControlQueue, &order,0))
			ret =false;
	}
	portNum = 0;
	while (portNum <(PORTS_NUMBER-1))
	{
		if (FSMRegisters[portNum].state==STOP)
			portNum++;
		else
			taskYIELD();
	}

return ret;
}

uint8_t getTestsState (uint8_t portNum)
{
	return FSMRegisters[portNum].state;
}

//Salidas digitales
//0= dimrelay0
//1= dimrelay1
//2= Carga
//3= Power

//Entradas analogicas
//0 = Corriente * 1.25
//1 = Tension /160

void FSMPruebaDrivers(testState_t *FSMReg)
{
	//uint16_t i = 0; 		//Variable auxiliar para lazos

	int16_t ADC1DataTemp;	//Variables auxiliar par los valores del ADC
	int16_t ADC2DataTemp;
	uint8_t digInTemp;
	uint16_t DACValue;		//Valor a escribir en el DAC
	volatile uint32_t tempTick;		//Guardo los valores del Tick counter para medir tiempos
	//char uartBuff[10];
	static uint8_t ADC_V[10];
	static uint8_t ADC_I[10];



	receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);
	/*------Maquina de estados------*/

	switch (FSMReg->state)
	{
	case INIT:
	{	//inicialización
		//Le quito la alimentación al driver.
		//digitalOuts = 0;
		digitalOuts = 0x05; //0110 Poweroff, loadOn, 10%
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		//FSMReg->pasa=3;
		FSMReg->pasa=INIT;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}
	case START:
		{
			FSMReg->pasa=MARCHA-1;
		//Configuro el driver antes de encenderlo
			switch(FSMReg->i){
			case 0://Prueba al 10%
				{
				digitalOuts = 0x05; //0110 Poweroff, loadOn, 10%
				Vout =102; //10%
				break;
				}
			case 1://Prueba al 50%
				{
				digitalOuts = 0x04; //0100 Poweroff, loadOn, 50%
				Vout =510; //50%
				break;
				}
			case 2://Prueba al 100%
				{
				digitalOuts = 0x06; //0101 Poweroff, loadOn, 100%
				Vout =1023; //100%
				break;
				}
			default: break;
			}

		FSMReg->adcSamples=0;
		FSMReg->ADC_1=0;
		FSMReg->ADC_2=0;

		sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0);
		FSMReg->tickRegister=xTaskGetTickCount();//guardo el tick para la demora
		FSMReg->state= WAIT_5S;
		break;
		}

	case WAIT_5S: 	//hago un retardo de 5S, no uso el vTaskDelay porque quiero que se ejecuten
	{						//otras etapas de la misma tarea mientras se hace la espera.
		tempTick = xTaskGetTickCount(); //Tomo el estado actual del tick y luego comparo con el valor al inicio
		if (tempTick >= FSMReg->tickRegister) //chequeo que el Tick counter no se haya reiniciado
		{
			if ((tempTick - FSMReg->tickRegister)
					> (5000 * ((uint32_t) portTICK_PERIOD_MS))) //si pasaron 5000ms
			{
				//condicion de salida
				FSMReg->state= POWER_ON;
			}
		}
		else //el Tick counter se reinicio
		{
			if ((tempTick + (0xFFFF - FSMReg->tickRegister))
					> (5000 * ((uint32_t) portTICK_PERIOD_MS))) //si pasaron 5000ms
			{
				//condicion de salida
				FSMReg->state= POWER_ON;

			}
		}

		break;
	}
	case POWER_ON:
		{

		//Configuro el driver antes de encenderlo
			switch(FSMReg->i){
			case 0://Prueba al 10%
				{
				digitalOuts = 0x0D; //1110 Poweron, loadOn, 10%
				//digitalOuts = 0x0F; //1111 Poweron, loadOn, 10%
				Vout =102; //10%
				break;
				}
			case 1://Prueba al 50%
				{
				digitalOuts = 0x0C; //1100 Poweron, loadOn, 50%
				//digitalOuts = 0x0D; //1110 Poweron, loadOn, 10%
				Vout =510; //50%
				break;
				}
			case 2://Prueba al 100%
				{
				digitalOuts = 0x0E; //1101 Poweron, loadOn, 100%
				//digitalOuts = 0x0C; //1101 Poweron, loadOn, 100%
				Vout =1023; //100%
				break;
				}
			default: break;
			}
		sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0);
		FSMReg->tickRegister=xTaskGetTickCount();//guardo el tick para la demora
		FSMReg->state= WAIT_5S2;
		break;
		}
	case WAIT_5S2: 	//hago un retardo de 5S, no uso el vTaskDelay porque quiero que se ejecuten
	{						//otras etapas de la misma tarea mientras se hace la espera.
		tempTick = xTaskGetTickCount(); //Tomo el estado actual del tick y luego comparo con el valor al inicio
		if (tempTick >= FSMReg->tickRegister) //chequeo que el Tick counter no se haya reiniciado
		{
			if ((tempTick - FSMReg->tickRegister)
					> (5000 * ((uint32_t) portTICK_PERIOD_MS))) //si pasaron 5000ms
			{
				//condicion de salida
				FSMReg->state= MEASURE;
			}
		}
		else //el Tick counter se reinicio
		{
			if ((tempTick + (0xFFFF - FSMReg->tickRegister))
					> (5000 * ((uint32_t) portTICK_PERIOD_MS))) //si pasaron 5000ms
			{
				//condicion de salida
				FSMReg->state= MEASURE;
				xQueueReset( FSMReg->port.onRxQueue ); //Reinicio la cola para no leer datos viejos

			}
		}


		break;
	}
	case MEASURE:
		{
		//receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);
		FSMReg->adcSamples++;
		FSMReg->ADC_1+=ADC1DataTemp;
		FSMReg->ADC_2+=ADC2DataTemp;

		if (FSMReg->adcSamples==20)		//una vez tomadas las 20 muestras evaluo el resultado
		{
			//Iin= (ADC1Gain*FSMReg->ADC_1)/FSMReg->adcSamples;
			//Vin= (ADC2Gain*FSMReg->ADC_2)/FSMReg->adcSamples;
			Iin= ((ADC1Gain*FSMReg->ADC_1)/FSMReg->adcSamples)+(ADC_OFFSET*ADC1Gain);
			Vin= ((ADC2Gain*FSMReg->ADC_2)/FSMReg->adcSamples)+(ADC_OFFSET*ADC2Gain);

			FSMReg->adcSamples=0;
			FSMReg->ADC_1=0;
			FSMReg->ADC_2=0;
			switch(FSMReg->i){
			case 0://10%														//multiplico los porcentajes por 1000 para no usar flotante
				{
				if ((Iin < 150 *testCurrent)&&(Iin > 50 *testCurrent)&&			//Entre 8% y 15% de la corriente
					(Vin < 1100 *testVoltage)&&(Vin > 700 *testVoltage))		//Entre 70% y 110% de la tension
					FSMReg->i++;
				else
				{
					FSMReg->i=3;
					//FSMReg->pasa=0;
					FSMReg->pasa= NO_PASA;
				}
				break;
				}
			case 1://50%
				{
				if ((Iin < 550 *testCurrent)&&(Iin > 450 *testCurrent)&&		//Entre 45% y 55% de la corriente
					(Vin < 1100 *testVoltage)&&(Vin > 900 *testVoltage))		//Entre 90% y 110% de la tension
					FSMReg->i++;
				else
				{
					FSMReg->i=3;
					//FSMReg->pasa=0;
					FSMReg->pasa= NO_PASA;
				}
				break;
				}
			case 2://100%
				{
				if ((Iin < 1100 *testCurrent)&&(Iin > 900 *testCurrent)&&		//Entre 9% y 110% de la corriente
					(Vin < 1100 *testVoltage)&&(Vin > 900 *testVoltage))		//Entre 90% y 110% de la tension
				{
					FSMReg->i++;
					//FSMReg->pasa=1; //Cuando paso todas las pruebas marco como PASA
					FSMReg->pasa = PASA;
				}
				else
				{
					FSMReg->i=3;
					//FSMReg->pasa=0;
					FSMReg->pasa= NO_PASA;
				}
				break;
				}
			default: break;
			}
		//}
		if(FSMReg->i==3)
		{
			FSMReg->state= STOP;
		}
		else
			FSMReg->state= POWER_ON;
		}//cambio
		break;
	}

	case STOP:
	{	//inicialización
		//Le quito la alimentación al driver.
		//digitalOuts = 0;
		digitalOuts = 0x05; //0110 Poweroff, loadOn, 10%
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}

	default: //no deberia llegar nunca aca
	{	//inicialización
		//Le quito la alimentación al driver.
		digitalOuts = 0;
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}
	}
	return;
}

void FSMPruebaTemporizadores(testState_t *FSMReg){
	/*------Maquina de estados------*/
	volatile uint32_t tempTick;		//Guardo los valores del Tick counter para medir tiempos
	int16_t ADC1DataTemp;	//Variables auxiliar par los valores del ADC
	int16_t ADC2DataTemp;
	uint8_t digInTemp;
	uint16_t DACValue;		//Valor a escribir en el DAC
	uint32_t aux;
	receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);

	switch (FSMReg->state)
	{
	case INIT:
	{	//inicialización
		//Le quito la alimentación al driver.
		digitalOuts = 0;
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		FSMReg->pasa=3;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}
	case START:
		{

		//Alimento el temporizador
		digitalOuts = 0x08;

		sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0);
		FSMReg->tickRegister=xTaskGetTickCount();//guardo el tick para la demora
		FSMReg->state= WAIT_SHORT_SETUP;
		break;
		}
	case WAIT_SHORT_SETUP:
	case WAIT_LONG_SETUP: 	//hago un retardo de 20S, no uso el vTaskDelay porque quiero que se ejecuten
	{						//otras etapas de la misma tarea mientras se hace la espera.
		if (checkTimeout (FSMReg->tickRegister, 20000))
			{
			//Paso al sig. estado
			FSMReg->state= TRIGGER;
			}

		break;
	}

	case TRIGGER:
		{

		//disparo el temporizador, si es de tres cables el disparo se hace manual
		digitalOuts = 0x09;
		sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0);
		FSMReg->tickRegister=xTaskGetTickCount();//guardo el tick para la demora
		FSMReg->state= WAIT_2S2;
		break;
		}
	case WAIT_2S2: 	//hago un retardo de 2S, no uso el vTaskDelay porque quiero que se ejecuten
	{						//otras etapas de la misma tarea mientras se hace la espera.

		if (checkTimeout (FSMReg->tickRegister, 2000))
			{
			//Paso al sig. estado
			digitalOuts = 0x08; //Termino el pulso de disparo
			sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0);
			sumIn0=0;
			FSMReg->tickRegister = xTaskGetTickCount(); //Leo el tick para hacer un timeout si no se enciende el temporizador
			FSMReg->state= WAIT_ON;
			}

		break;
	}

	case WAIT_ON:
		{
		//receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);

		//Si en 30 segundos no se encendio el temporizador aborto la prueba
		if (checkTimeout (FSMReg->tickRegister, 30000))
			{
			FSMReg->i=2;
			FSMReg->pasa=NO_PASA;
			FSMReg->state= STOP;
			break;
			}

		if (digInTemp&0x01)
		{
			if (sumIn0<300) //Si estuvo al menos 300 ms encendido empiezo a contar
			{
				sumIn0++;
			}
			else
			{
				tempTick = xTaskGetTickCount(); //Tomo el estado actual del tick y luego comparo con el valor al inicio
				FSMReg->tickRegister = xTaskGetTickCount(); //Leo el tick para hacer un timeout si no se apaga el temporizador
				digitalIn=0x01;
				FSMReg->state= WAIT_OFF;
			}

		}
		else
		{
			tempTick = xTaskGetTickCount();
			if (sumIn0>0)
				sumIn0--;
		}
		break;
		}

	case WAIT_OFF:
		{
		//receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);

		if (FSMReg->i==SHORT_TIME)
			aux=1000*maxShort;
		if (FSMReg->i==LONG_TIME)
			aux=1000*maxLong;

		if (checkTimeout (FSMReg->tickRegister, aux))
			{
			FSMReg->i=2;
			FSMReg->pasa=NO_PASA;
			FSMReg->state= STOP;
			break;
			}

		if (digInTemp&0x01)
		{
			if (sumIn0<1000)
				sumIn0++;
		}
		else
			if (sumIn0>0)
				sumIn0--;
			else
			{
				FSMReg->state= CHECK_TIME;
				digitalIn=0x00;
			}
		break;
		}

	case CHECK_TIME:
		{
		tempTick = xTaskGetTickCount();
		if (tempTick >FSMReg->tickRegister)
			tempTick = (tempTick-FSMReg->tickRegister)/ (1000* portTICK_PERIOD_MS);
		else
			tempTick = (tempTick + (0xFFFF - FSMReg->tickRegister))/ (1000* portTICK_PERIOD_MS);



		switch(FSMReg->i){
			case 0://Tiempo corto
				{
				if ((minShort < tempTick)&&(maxShort > tempTick))//Comparo el tiempo medido
				{
					FSMReg->i++;
					FSMReg->state= WAIT_LONG_SETUP;
				}
				else
				{
					FSMReg->i=2;
					FSMReg->pasa=NO_PASA;
				}
				break;
				}
			case 1://tiempo largo
				{
				if ((minLong < tempTick)&&(maxLong > tempTick))//Comparo el tiempo medido
				{
					FSMReg->i++;
					FSMReg->pasa=PASA; //Cuando paso todas las pruebas marco como PASA
				}
				else
				{
					FSMReg->i=2;
					FSMReg->pasa=NO_PASA;
				}
				break;
				}
			default: break;
			}

		if(FSMReg->i==2)
		{
			FSMReg->state= STOP;
		}

		break;
	}

	case STOP:
	{	//inicialización
		//Le quito la alimentación al driver.
		digitalOuts = 0;
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break;
		}

		break;
	}

	default: //no deberia llegar nunca aca
	{	//inicialización
		//Le quito la alimentación al driver.
		digitalOuts = 0;
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}
	}
	return;
}



//Maquina de estados del panel de calibracion

void FSMCalibracion(testState_t *FSMReg)
{
	//uint16_t i = 0; 		//Variable auxiliar para lazos

	uint16_t ADC1DataTemp;	//Variables auxiliar par los valores del ADC
	uint16_t ADC2DataTemp;
	uint8_t digInTemp;
	uint16_t DACValue;		//Valor a escribir en el DAC
	volatile uint32_t tempTick;		//Guardo los valores del Tick counter para medir tiempos
	//char uartBuff[10];
	static uint8_t ADC_V[10];
	static uint8_t ADC_I[10];


	receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);

	/*------Maquina de estados------*/

	switch (FSMReg->state)
	{
	case INIT:
	{	//inicialización
		//Le quito la alimentación al driver.
		digitalOuts = 0;
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		FSMReg->pasa=3;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}
	case START:
		{

		//digitalOuts = 0x05; //0101 Power off+out on+10%
		digitalOuts = 0x04; //0100 Poweroff, loadOn, 50%
		//digitalOuts = 0x06; //0101 Poweroff, loadOn, 100%

		Vout =0; //0%

		FSMReg->adcSamples=0;
		FSMReg->ADC_1=0;
		FSMReg->ADC_2=0;

		sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0);
		FSMReg->tickRegister=xTaskGetTickCount();//guardo el tick para la demora
		FSMReg->state= WAIT_2S;
		break;
		}

	case WAIT_2S: 	//hago un retardo de 5S
	{
		if (checkTimeout (FSMReg->tickRegister, 2000)){
			FSMReg->state= CHANGE_VOUT;}
		break;
	}
	case CHANGE_VOUT:
		{
		switch (FSMReg->i){
		case 0:
		case 1:
			{
			digitalOuts = 0x0D; //1000 Poweron, loadOn, 10%
			break;
			}
		case 2:
			{
			digitalOuts = 0x0C; //1100 Poweron, loadOn, 50%
			break;
			}
		case 3:
			{
			digitalOuts = 0x0E; //1101 Poweron, loadOn, 100%
			break;
			}



		case 4:
		case 5:
		case 6:
		case 7:


		case 8:
		case 9:
		case 10:
			{
			digitalOuts = 0x0D; //1000 Poweron, loadOn, 10%
			break;
			}

		default:
			{
			digitalOuts = 0x00; //1101 Poweroff
			break;
			}
		}


		Vout =FSMReg->i*102; //i*10%
		FSMReg->adcSamples=0;
		FSMReg->ADC_1=0;
		FSMReg->ADC_2=0;

		sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0);
		FSMReg->tickRegister=xTaskGetTickCount();//guardo el tick para la demora
		//FSMReg->state= WAIT_5S;
		FSMReg->state= MEASURE;

		break;
		}
	case WAIT_5S: 	//hago un retardo de 5S
	{

		if (checkTimeout (FSMReg->tickRegister, 5000)){
			FSMReg->state= MEASURE;
			FSMReg->tickRegister=xTaskGetTickCount();//guardo el tick para el tiempo de medicion
		}
		break;
	}
	case MEASURE:
		{
		//receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);
		FSMReg->adcSamples++;
		FSMReg->ADC_1+=ADC1DataTemp;
		FSMReg->ADC_2+=ADC2DataTemp;
		if (FSMReg->adcSamples == 100){
			//Res1= ADC1G*FSMReg->ADC_1/FSMReg->adcSamples;
			//Res2= ADC2G*FSMReg->ADC_2/FSMReg->adcSamples;
			Res1= (ADC1G*FSMReg->ADC_1/FSMReg->adcSamples)+(ADC_OFFSET*ADC1G);
			Res2= (ADC2G*FSMReg->ADC_2/FSMReg->adcSamples)+(ADC_OFFSET*ADC2G);
			FSMReg->adcSamples=0;
			FSMReg->ADC_1=0;
			FSMReg->ADC_2=0;

			}
		if (checkTimeout (FSMReg->tickRegister, 10000)){

			FSMReg->i++;
			FSMReg->state= CHANGE_VOUT;

		}
		if (FSMReg->i==11)
			FSMReg->i=0;

		break;

	}

	case STOP:
	{	//inicialización
		//Le quito la alimentación al driver.
		digitalOuts = 0;
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}

	default: //no deberia llegar nunca aca
	{	//inicialización
		//Le quito la alimentación al driver.
		//digitalOuts = 0;
		digitalOuts = 0x05; //0101 Power off+out on+10%
		digitalIn = 0;
		Vout = 0;
		Vin = 0;
		Iin = 0;
		FSMReg->i=0;
		if(false == sendDataPort(&testPort,(uint16_t) Vout, (uint8_t) digitalOuts, 0))
		{
			break; //no continuo hasta que se manden los valores iniciales
		}

		break;
	}
	}
	return;
}



//Esta funcion devuelve true si ya paso el tiempo inciado por timeoutMS desde
// el instante indicado por initialTick, que debe ser una captura del tick del sistema opertivo
bool_t checkTimeout (uint32_t initialTick, uint32_t timeoutMS)
{
	uint32_t actualTick;
	bool_t ret;
	actualTick = xTaskGetTickCount();
	ret= false;
	if (actualTick >= initialTick) //chequeo que el Tick counter no se haya reiniciado
	{
		if ((actualTick - initialTick)> (timeoutMS * ((uint32_t) portTICK_PERIOD_MS)))
				ret=true;
	}
	else //el Tick counter se reinicio
	{
		if ((actualTick + (0xFFFF - initialTick))> (timeoutMS * ((uint32_t) portTICK_PERIOD_MS)))
			ret=true;
	}
	return ret;
}

/*  Movido a DataMemory.c

void initEeprom(void)
{
	Chip_EEPROM_Init(LPC_EEPROM); //inicializar la eeprom
	Chip_EEPROM_SetAutoProg(LPC_EEPROM,EEPROM_AUTOPROG_AFT_1WORDWRITTEN); //Habilito autoprogramacion
}

//Cargar parametros desde EEPROM
void loadParameters (uint32_t testNumber)
{
	uint32_t* ptr = &parametersROM[testNumber][0];
	uint32_t i = 0;
	uint32_t *pEepromMem = (uint32_t*)EEPROM_ADDRESS(testNumber+3,0); //inicio en la pagina 3 porque las tres primeras son del servidor
	for(i = 0; i < PARAM_NUM * PORTS_NUMBER; i++) {
		ptr[i] = pEepromMem[i];
	}
}

//Obtener el puntero a los paramtros del test en RAM
uint32_t * getParameters (uint32_t testNumber,uint8_t port)
{
	return (&parametersROM[testNumber][port*PARAM_NUM]);
}

//Guardar los parametros del test en EEPROM
void saveParameters (uint32_t testNumber)
{
	//uint32_t* ptr = &parametersROM[testNumber-1][0];
	uint32_t* ptr = &parametersROM[testNumber][0];
	uint8_t i = 0;
	uint32_t *pEepromMem = (uint32_t*)EEPROM_ADDRESS(testNumber+3,0);//las primeras 3 posiciones son del servidor
	uint32_t size =PARAM_NUM * PORTS_NUMBER;
	if(size > EEPROM_PAGE_SIZE )
	   size = EEPROM_PAGE_SIZE;

	  //for(i = 0; i < size/4; i++) {
	for(i = 0; i < size; i++) {
	   pEepromMem[i] = ptr[i];

	   Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
	  }
}

*/


//Actualizar los parametros en los registros de las FSM
void updateAllParameters (uint8_t testNum){
	uint8_t i;

	for (i=0;i<PORTS_NUMBER;i++)
		FSMRegisters[i].param = &parametersROM[testNum][i*PARAM_NUM]; //busco el punto donde estan los parametros del test actual en este puerto
}













