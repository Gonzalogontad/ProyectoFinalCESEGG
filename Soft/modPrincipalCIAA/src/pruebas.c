/*
 * pruebas.c
 *
 *  Created on: 24 jun. 2020
 *      Author: root
 */

#include "pruebas.h"
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
#define ADC1Gain 	FSMReg->param [0]
#define ADC2Gain  	FSMReg->param [1]
#define testVoltage FSMReg->param [2]
#define testCurrent FSMReg->param [3]

//Parametros prueba temporizador
#define minShort 	FSMReg->param [0]
#define maxShort  	FSMReg->param [1]
#define minLong 	FSMReg->param [2]
#define maxLong 	FSMReg->param [3]


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

		//Configuro el driver antes de encenderlo
			switch(FSMReg->i){
			case 0://10%
				{
				digitalOuts = 0x06; //0110 Poweroff, loadOn, 10%
				Vout =102; //10%
				break;
				}
			case 1://50%
				{
				digitalOuts = 0x04; //0100 Poweroff, loadOn, 50%
				Vout =510; //50%
				break;
				}
			case 2://100%
				{
				digitalOuts = 0x05; //0101 Poweroff, loadOn, 100%
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
			case 0://10%
				{
				digitalOuts = 0x0E; //1110 Poweron, loadOn, 10%
				Vout =102; //10%
				break;
				}
			case 1://50%
				{
				digitalOuts = 0x0A; //1100 Poweron, loadOn, 50%
				Vout =510; //50%
				break;
				}
			case 2://100%
				{
				digitalOuts = 0x0B; //1101 Poweron, loadOn, 100%
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
		receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);
		FSMReg->adcSamples++;
		FSMReg->ADC_1+=ADC1DataTemp;
		FSMReg->ADC_2+=ADC2DataTemp;
		Iin= ADC1Gain*FSMReg->ADC_1/FSMReg->adcSamples;
		Vin= ADC2Gain*FSMReg->ADC_2/FSMReg->adcSamples;
		if (FSMReg->adcSamples==20)		//una vez tomadas las 20 muestras evaluo el resultado
		{
			switch(FSMReg->i){
			case 0://10%
				{
				if ((Iin < 150 *testCurrent)&&(Iin > 80 *testCurrent)&&			//multiplico los porcentajes por 1000 para no usar flotante
					(Vin < 1100 *testVoltage)&&(Vin > 900 *testVoltage))
					FSMReg->i++;
				else
				{
					FSMReg->i=3;
					FSMReg->pasa=0;
				}
				break;
				}
			case 1://50%
				{
				if ((Iin < 550 *testCurrent)&&(Iin > 450 *testCurrent)&&
					(Vin < 1100 *testVoltage)&&(Vin > 900 *testVoltage))
					FSMReg->i++;
				else
				{
					FSMReg->i=3;
					FSMReg->pasa=0;
				}
				break;
				}
			case 2://100%
				{
				if ((Iin < 1100 *testCurrent)&&(Iin > 900 *testCurrent)&&
					(Vin < 1100 *testVoltage)&&(Vin > 900 *testVoltage))
				{
					FSMReg->i++;
					FSMReg->pasa=1; //Cuando paso todas las pruebas marco como PASA
				}
				else
				{
					FSMReg->i=3;
					FSMReg->pasa=0;
				}
				break;
				}
			default: break;
			}
		}
		if(FSMReg->i==3)
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
		FSMReg->state= WAIT_2S;
		break;
		}

	case WAIT_2S: 	//hago un retardo de 2S, no uso el vTaskDelay porque quiero que se ejecuten
	{						//otras etapas de la misma tarea mientras se hace la espera.
		if (checkTimeout (FSMReg->tickRegister, 2000))
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
		receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);
		//Si en 30 segundos no se encendio el temporizador aborto la prueba
		if (checkTimeout (FSMReg->tickRegister, 30000))
			{
			FSMReg->i=2;
			FSMReg->pasa=0;
			FSMReg->state= STOP;
			break;
			}

		if (digInTemp&0x01)
		{
			if (sumIn0<300) //Si estuvo al menos 300 ms encendido empiezo a contar
				sumIn0++;
			else
			{
				tempTick = xTaskGetTickCount(); //Tomo el estado actual del tick y luego comparo con el valor al inicio
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
		receiveDataPort(&testPort,&ADC1DataTemp,&ADC2DataTemp, &digInTemp,0);
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
				if ((minShort < tempTick)&&(maxShort < tempTick))//Comparo el tiempo medido
					FSMReg->i++;
				else
				{
					FSMReg->i=2;
					FSMReg->pasa=0;
				}
				break;
				}
			case 1://50%
				{
				if ((minLong < tempTick)&&(maxLong < tempTick))//Comparo el tiempo medido
				{
					FSMReg->i++;
					FSMReg->pasa=1; //Cuando paso todas las pruebas marco como PASA
				}
				else
				{
					FSMReg->i=2;
					FSMReg->pasa=0;
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
