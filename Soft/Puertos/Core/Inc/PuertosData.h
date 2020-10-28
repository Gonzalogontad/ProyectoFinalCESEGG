/*
 * PuertosData.h
 *
 *  Created on: May 16, 2020
 *      Author: root
 */
#include "stm32f1xx_hal.h"


#ifndef INC_PUERTOSDATA_H_
#define INC_PUERTOSDATA_H_

//Variables y constantes de datos entrantes por UART
#define INPUT_BUFFER_SIZE 3
extern uint8_t bufferUARTin [INPUT_BUFFER_SIZE]; 	//Buffer de entrada de la UART
extern uint8_t receiveIndex; 	//Indice de byte de recepción
extern uint8_t dataFlag; //Flag de datos disponibles
extern uint8_t moduleAddr; 	//Addres del modulo

//Variables y constantes de datos salientes por UART
#define OUTPUT_BUFFER_SIZE 4
extern uint8_t bufferUARTout [OUTPUT_BUFFER_SIZE]; 	//Buffer de salida de la UART
extern uint8_t packedDataOut [2][OUTPUT_BUFFER_SIZE];	//Matriz con los datos empaquetados para enviar de dos posiciones
extern uint8_t packedDataIndex;						//Indice que marca que array de la matriz esta disponible para enviar, el otro esta siendo modificado



//Variables y constantes ADCs y DAC
#define ADC_BUFFER_SIZE 8  //Tamaño del buffer donde se guardan los datos del ADC
#define N ADC_BUFFER_SIZE	//Numero maximo de muestras a promediar

extern uint16_t bufferADC1 [ADC_BUFFER_SIZE];	//Buffer de muestras ADC1
extern uint16_t bufferADC2 [ADC_BUFFER_SIZE];	//Buffer de muestras ADC2
extern uint32_t sumADC1; 	//sumatoria de los ultimos N valores leidos del ADC1
extern uint32_t sumADC2; 	//sumatoria de los ultimos N valores leidos del ADC2
extern uint8_t samp;		//cantidad de muestras en el buffer
extern uint8_t buffFirst;	//Indice del primer elemento del buffer circular
extern uint8_t buffLast;	//Indice del ultimo elemento del buffer circular

extern uint8_t DACData [2]; //Datos a enviar al DAC 8bits en el primer byte y 4 en el segundo
extern uint16_t mcpAddress; //Direccion del MCP en el bus I2C


//Variables y constantes Entradas y salidas digitales
extern uint8_t outData; //Datos de salidas digitales
extern uint8_t inData;  //Datos de entradas digitales
extern uint8_t ModIn0Counter; //Contador para estabilizar entrada digital 0
extern uint8_t ModIn1Counter; //Contador para estabilizar entrada digital 1
extern uint8_t ModIn2Counter; //Contador para estabilizar entrada digital 2

//
#define  HEART_BEAT_PERIOD 500 //Semiperiodo en ms

#endif /* INC_PUERTOSDATA_H_ */
