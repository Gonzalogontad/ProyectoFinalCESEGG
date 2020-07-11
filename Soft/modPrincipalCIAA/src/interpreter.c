/*
 * interpreter.c
 *
 *  Created on: 24 jun. 2020
 *      Author: root
 */

#include "interpreter.h"
#include "portsDriver.h"
#include "string.h"
#include "pruebas.h"
#include "webPage.h"

char *panels [TESTS_QTY];
uint32_t *params;


bool_t interpreterInit()
{

	panels [0] = panel0;
	panels [1] = panel1;
	commandsQueue = xQueueCreate(INTERPRETER_QUEUE_LEN,sizeof(command_t));
	xTaskCreate(
	      interpreter,                     // Function that implements the task.
	      (const char *)"Interprete",     // Text name for the task.
	      configMINIMAL_STACK_SIZE, // Stack size in words, not bytes.
	      (void*)NULL,                          // Parameter passed into the task.
	      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
	      0                           // Pointer to the task created in the system
	   );
	actualPanelNumber=1;
}

void interpreter ()
{
	uint8_t i;
	command_t command;
	uint8_t portNum;
	uint8_t testState;
	actualPageData = pageDataA;
	actualPanel=panel0;
while (true)
{
	if(pdTRUE == xQueueReceive(commandsQueue,&command,250*portTICK_RATE_MS))
	{
		if (actualPanelNumber == command.panelNum)
		{
			switch (command.buttonId[0]){
						case 'b': //si se presiono un boton de la base
						{
							switch (command.buttonId[1]){
										case '0':
										{
											sendToAllTests (actualPanelNumber , STOP); //envio la orden de detener todas las tareas y no continuo hasta que se detuvieron
											if (actualPanelNumber > 1)
												actualPanelNumber--;
											else
												actualPanelNumber = 1;
											actualPanel = panels[actualPanelNumber-1];

											updateAllParameters (actualPanelNumber-1);
											break;
										}
										case '2':
										{
											sendToAllTests (actualPanelNumber , STOP); //envio la orden de detener todas las tareas y no continuo hasta que se detuvieron
											if (actualPanelNumber < TESTS_QTY)
												actualPanelNumber++;
											else
												actualPanelNumber = TESTS_QTY;
											actualPanel = panels[actualPanelNumber-1];
											updateAllParameters (actualPanelNumber-1);

											break;
										}
										case '4':
										{
											sendToAllTests (actualPanelNumber , STOP); //envio la orden de detener todas las tareas y no continuo hasta que se detuvieron
											break;
										}
										default:
											break;
							}
							break;
						}
						case 'p':
						{
							switch (command.buttonId[1]){
										case '1':	//en la fila uno estan los botones de STAR/STOP
										{
											portNum = command.buttonId[2]-'0';
											testState = getTestsState (portNum);
											if((testState == INIT)||(testState == STOP))
												setTestOrder (portNum, actualPanelNumber, START);
											else
												setTestOrder (portNum, actualPanelNumber, STOP);
											break;
										}
										case '7':	//en la fina 7 estan los botones de guardar
										{
											sendToAllTests (actualPanelNumber , STOP); //envio la orden de detener todas las tareas y no continuo hasta que se detuvieron
											params = getParameters ((uint32_t) actualPanelNumber-1,command.buttonId[2]-'0');
											for (i=0;i<4;i++)
											{

												params[i]= command.parameters[i];

											}
											saveParameters ((uint32_t) actualPanelNumber-1);
											break;
										}
										default:
											break;
							}
							break;
						}
						default:
							break;
						}
		}
	}
	refreshPageData();
}
}

void sendCommand(command_t command)
{
	xQueueSend(commandsQueue,&command,0);

}

void refreshPageData(){
	char*pageData;
	if (actualPageData == pageDataA)
	{
		pageData = pageDataB;
	}
	else
		{
		pageData = pageDataA;
		}
	uint8_t i,j;
	uint8_t aux;
	char auxStrig[60];
	stdioSprintf(pageData, "{\"panel\":%d,\"data\":[",actualPanelNumber);
	for (j=0;j<8;j++)
	{
		//strcpy(auxStrig,"");
		for (i=0;i<PORTS_NUMBER;i++)
		{
			switch (j){
				case 0:{
					stdioSprintf(auxStrig,"%d,",FSMRegisters[i].state);
					break;
				}
				case 1:
				{
					if ((FSMRegisters[i].state==STOP)||(FSMRegisters[i].state==INIT))
						aux = MARCHA;
					else
						aux = PARADA;

					stdioSprintf(auxStrig,"%d,",aux);
				break;
				}
				case 2:
				{
					stdioSprintf(auxStrig,"%d,",FSMRegisters[i].pasa);
					break;
				}
				case 3:
				{
					stdioSprintf(auxStrig,"%d,",FSMRegisters[i].param[0]);
					break;
				}
				case 4:
				{
					stdioSprintf(auxStrig,"%d,",FSMRegisters[i].param[1]);
					break;
				}
				case 5:
				{
					stdioSprintf(auxStrig,"%d,",FSMRegisters[i].param[2]);
					break;
				}
				case 6:
				{
					stdioSprintf(auxStrig,"%d,",FSMRegisters[i].param[3]);
					break;
				}
				case 7:
				{
					aux = GUARDAR;
					stdioSprintf(auxStrig,"%d,",aux);
				break;
				}
			}
			strcat (pageData,auxStrig);
		}
	}
	pageData[strlen(pageData)-1]=0; //borro la ultima coma
	strcat (pageData,"]}");

	actualPageData = pageData; //Unicamente cambio el puntero a los datos que se van a mandar cuando ya esta completa la informacion

}











