/*
 * PuertosData.c
 *
 *  Created on: 17 may. 2020
 *      Author: root
 */
#include "PuertosData.h"

//Variables de datos entrantes por UART
uint8_t bufferUARTin [INPUT_BUFFER_SIZE]; 	//Buffer de entrada de la UART
uint8_t receiveIndex =0; 	//Indice de byte de recepción
uint8_t dataFlag = 0; //Flag de datos disponibles
uint8_t moduleAddr; 	//Addres del modulo

//Variables de datos salientes por UART

uint8_t bufferUARTout [OUTPUT_BUFFER_SIZE]; 	//Buffer de salida de la UART
uint8_t packedDataOut [2][OUTPUT_BUFFER_SIZE];	//Matriz con los datos empaquetados para enviar de dos posiciones
uint8_t packedDataIndex;						//Indice que marca que array de la matriz esta disponible para enviar, el otro esta siendo modificado


//Variables ADCs y DAC
uint16_t bufferADC1 [ADC_BUFFER_SIZE];	//Buffer de muestras ADC1
uint16_t bufferADC2 [ADC_BUFFER_SIZE];	//Buffer de muestras ADC2
uint32_t sumADC1; 	//sumatoria de los ultimos N valores leidos del ADC1
uint32_t sumADC2; 	//sumatoria de los ultimos N valores leidos del ADC2
uint8_t samp;		//cantidad de muestras en el buffer
uint8_t buffFirst = 0;	//Indice del primer elemento del buffer circular
uint8_t buffLast = 0;	//Indice del ultimo elemento del buffer circular

uint8_t DACData [2]; //Datos a enviar al DAC 8bits en el primer byte y 4 en el segundo
uint16_t mcpAddress= 0xC0; //Direccion del MCP en el bus I2C


//Variables Entradas y salidas digitales
uint8_t outData; //Datos de salidas digitales
uint8_t inData;  //Datos de entradas digitales
uint8_t ModIn0Counter; //Contador para estabilizar entrada digital 0
uint8_t ModIn1Counter; //Contador para estabilizar entrada digital 1
uint8_t ModIn2Counter; //Contador para estabilizar entrada digital 2
