/*
 * terminal.c
 *
 *  Created on: 19 ago. 2020
 *      Author: root
 */

#include "UARTEspDriver.h"
#include "terminal.h"
#include "DataMemory.h"
#include "Esp8266FreeRTOS.h"
UARTData_t UARTTerminal;


void commandsFSM(uint32_t commandData);
void terminal( void* taskParmPtr );
char SSID[33];
char PASS[64];
char IP[16];

void terminalInit()
{
	UARTTerminal.uartValue=UART_USB;
	UARTTerminal.baudRate=115200;

	if(UARTEspInit(&UARTTerminal)==false)
	{
		stdioPrintf(UARTTerminal.uartValue, "Error al incializar UART TERMINAL");
	}
	//Heart Bit
   xTaskCreate(
      terminal,                     // Function that implements the task.
      (const char *)"myTask",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      (void*)NULL,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );
}

void terminal( void* taskParmPtr )
{
	// ----- Task setup -----------------------------------
	uint8_t byteReceived;
	uint32_t commandData = 0;

   gpioWrite( LED, ON );

   // Send the task to the locked state for 1 s (delay)
   vTaskDelay( 1000 / portTICK_RATE_MS );

   //gpioWrite( LED, OFF );
   //gpioToggle( LED );
   // Periodic task every 500 ms
   //portTickType xPeriodicity =  500 / portTICK_RATE_MS;
   //portTickType xLastWakeTime = xTaskGetTickCount();
   loadWIFIData (SSID,PASS,IP); //Cargo los datos de la red desde EEPROM
   stdioPrintf(UARTTerminal.uartValue, "Por favor ingrese un comando");
   // ----- Task repeat for ever -------------------------
   while(TRUE) {
	   gpioToggle( LED );
	   if (receiveEspByte(&UARTTerminal,&byteReceived,1000 / portTICK_RATE_MS ))
	   {
		   if ((byteReceived=='\n')||(byteReceived=='\r'))
		   {
			   commandData=0;
		   }
		   else
		   {
			   commandData=(commandData<<8)|(uint32_t)byteReceived;//Tomo el byte y lo agrego a commandData para ver si es un comando
			   commandsFSM(commandData); //Ejecuto el comando
		   }
	   }

   }
}



void commandsFSM(uint32_t commandData)
{
	//char param[64];
	switch (commandData)
	{
	case ('S'<<24|'S'<<16|'I'<<8|'D'):{
		if (scanParameter (SSID,32)){
			stdioPrintf(UARTTerminal.uartValue, "\n Ejecute el comando RECN para guardar los cambios \n");
		}
		stdioPrintf(UARTTerminal.uartValue, "\n La SSID es : %s \n",SSID);

	}
	break;
	case ('P'<<24|'A'<<16|'S'<<8|'S'):{
		if (scanParameter (PASS,32)){
			stdioPrintf(UARTTerminal.uartValue, "\n Ejecute el comando RECN para guardar los cambios \n");
		}
		stdioPrintf(UARTTerminal.uartValue, "\n El password es : %s \n",PASS);  //Comentar en la version final para ocultar el password

	}
	break;
	case ('W'<<24|'I'<<16|'I'<<8|'P'):{
		if (scanParameter (IP,32)){
			stdioPrintf(UARTTerminal.uartValue, "\n Ejecute el comando RECN para guardar los cambios \n");
		}
		stdioPrintf(UARTTerminal.uartValue, "\n La direccion IP es : %s \n",IP);

	}
	break;
	case ('R'<<24|'E'<<16|'C'<<8|'N'):{
		saveWIFIData (SSID,PASS,IP);
		stdioPrintf(UARTTerminal.uartValue, "\n Configuracion de red guardada");
		setWifiFlag ();

	}
	break;
	default:
		stdioPrintf(UARTTerminal.uartValue, "\n Default \n");
		break;
	}


}



bool_t scanParameter (char *param, uint8_t length)
{
	uint8_t byteReceived;
	uint8_t i,j;
	bool_t timeOut;
	bool_t endOfString;
	bool_t commandError;
	bool_t ret;
	char data[64];
	timeOut 	= false;
	endOfString = false;
	commandError= false;
	i=0;

	if (receiveEspByte(&UARTTerminal,&byteReceived,1000 / portTICK_RATE_MS )){
		if (byteReceived!=' ')	//el primer caracter en llegar luego de un comando debe ser un espacio, sino hay un error
			commandError= true;}
	else
		timeOut=true;

	while ((!timeOut)&&(!endOfString)&&(!commandError))
	{
		if (receiveEspByte(&UARTTerminal,&byteReceived,1000 / portTICK_RATE_MS )){
				if ((byteReceived=='\n')||(byteReceived=='\r'))	//Si es enter
				{
					endOfString = true;
					byteReceived = '\0'; //indico el fin de cadena
				}
				else
					if (i>length)
						commandError= true;
		}
		else
			timeOut=true;
		if((!commandError)&&(!timeOut))
		{
			data[i]=byteReceived;
			i++;
		}
	}
	if((!commandError)&&(!timeOut))
	{
		for(j=0;j<i;j++)
			param[j]=data[j];
		ret = true;
	}
	else
		ret = false;

return ret;

}
