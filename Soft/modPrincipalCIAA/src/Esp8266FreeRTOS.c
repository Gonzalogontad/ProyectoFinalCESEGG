/*Este modulo de software esta basado en modulo sapi_esp8266 incluido en la libreria sAPI
 *con adaptaciones a la aplicacion y al uso con FreeRTOS.
 */

/* Copyright 2017, Pablo Gomez - Agustin Bassi.
 * Copyright 2016, Marcelo Vieytes.
 * All rights reserved.
 *
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */

/*==================[inlcusiones]============================================*/

#include "Esp8266FreeRTOS.h"
#include "sapi.h"
#include <string.h>
#include "sapi_stdio.h"
#include "webPage.h"
#include "sapi_convert.h"
#include "UARTEspDriver.h"
#include "interpreter.h"
#include "semphr.h"
#include "DataMemory.h"
/*==================[definiciones y macros]==================================*/

#define ESP8266_UART          UART_232
#define ESP8266_BAUD_RATE     115200
#define ESP8266_TMO           10000
#define ESP8266_PAUSE         5000
#define ESP8266_WAIT          1000
#define MAX_COMMAND_LENGHT	   40
#define MAX_HTTP_WEB_LENGHT   2047

// El maximo tiempo que se espera una respuesta del modulo ESP8266
#define WIFI_MAX_DELAY    60000

typedef enum Esp8266State
{
	ESP_INIT,
	ESP_SEND_RESET,
	ESP_WAIT_RESET,
	ESP_SEND_AT,
	ESP_WAIT_AT,
	ESP_SEND_CWJAP_CONS,
	ESP_WAIT_CWJAP_CONS_1,
	ESP_WAIT_CWJAP_CONS_2,
	ESP_SEND_CWMODE_SET,
	ESP_WAIT_CWMODE_SET,
	ESP_SEND_CWJAP_SET,
	ESP_WAIT_CWJAP_SET_1,
	ESP_WAIT_CWJAP_SET_2,
	ESP_WAIT_CWJAP_SET_3,
	ESP_SEND_STA_SET,
	ESP_WAIT_STA_SET,
	ESP_CONNECTED,
	ESP_SEND_START,
	ESP_WAIT_START_1,
	ESP_WAIT_START_2,
	ESP_SEND_SEND,
	ESP_WAIT_SEND,
	ESP_SEND_DATA,
	ESP_WAIT_DATA_1,
	ESP_WAIT_DATA_2,
	ESP_CIPMUX_SEND,
	ESP_WAIT_CIPMUX,
	ESP_SEND_CIPSERVER,
	ESP_WAIT_CIPSERVER,
	ESP_WAIT_GET,
	ESP_SEND_CIPSTATUS,
	ESP_WAIT_CIPSTATUS_3,
	ESP_WAIT_GET_ID,
	ESP_SEND_CIPSEND,
	ESP_WAIT_CIPSEND,
	ESP_SEND_HTTP,
	ESP_WAIT_HTTP,
	ESP_WAIT_CIPSTATUS_OK,
	ESP_WAIT_CIPSTATUS,
	ESP_SEND_CIPCLOSE,
	ESP_WAIT_CIPCLOSE,
	ESP_SEND_CIFSR,
	ESP_WAIT_CIFSR,
	ESP_LOAD_IP,
	ESP_SEND_CWMODE,
	ESP_WAIT_CWMODE,
	ESP_WAIT_IPD,
	ESP_GET_REQUEST_ID,
	ESP_WAIT_COMMA,
	ESP_GET_REQUEST_LENGTH,
	ESP_GET_REQUEST,
	ESP_CIPSTO_SEND,
	ESP_WAIT_CIPSTO,
	ESP_CIPSTATUS_SEND,
} Esp8266Status_t;

/*==================[definiciones de datos internos]=========================*/

//Nombres de los estados en forma de strings para imprimir por pantalla.
static const char Esp8266StatusToString[][MAX_COMMAND_LENGHT] =
{ "ESP_INIT", "ESP_SEND_AT", "ESP_WAIT_AT", "ESP_SEND_CWJAP_CONS",
		"ESP_WAIT_CWJAP_CONS_1", "ESP_WAIT_CWJAP_CONS_2", "ESP_SEND_CWMODE_SET",
		"ESP_WAIT_CWMODE_SET", "ESP_SEND_CWJAP_SET", "ESP_WAIT_CWJAP_SET_1",
		"ESP_WAIT_CWJAP_SET_2", "ESP_WAIT_CWJAP_SET_3", "ESP_CONNECTED",
		"ESP_SEND_START", "ESP_WAIT_START_1", "ESP_WAIT_START_2",
		"ESP_SEND_SEND", "ESP_WAIT_SEND", "ESP_SEND_DATA", "ESP_WAIT_DATA_1",
		"ESP_WAIT_DATA_2", "ESP_CIPMUX_SEND", "ESP_WAIT_CIPMUX",
		"ESP_SEND_CIPSERVER", "ESP_WAIT_CIPSERVER", "ESP_WAIT_GET",
		"ESP_SEND_CIPSTATUS", "ESP_WAIT_CIPSTATUS_3", "ESP_WAIT_GET_ID",
		"ESP_SEND_CIPSEND", "ESP_WAIT_CIPSEND", "ESP_SEND_HTTP",
		"ESP_WAIT_HTTP", "ESP_WAIT_CIPSTATUS_OK", "ESP_WAIT_CIPSTATUS",
		"ESP_SEND_CIPCLOSE", "ESP_WAIT_CIPCLOSE", "ESP_SEND_CIFSR",
		"ESP_WAIT_CIFSR", "ESP_LOAD_IP", "ESP_SEND_CWMODE", "ESP_WAIT_CWMODE",
		"ESP_WAIT_IPD", "ESP_GET_REQUEST_ID", "ESP_WAIT_COMMA",
		"ESP_GET_REQUEST_LENGTH", "ESP_GET_REQUEST", };
// Respuestas del ESP8266
static const char Response_OK[] = "OK";
static const char Response_CWJAP_OK[] = "+CWJAP:";
static const char Response_CWJAP_1[] = "WIFI CONNECTED";
static const char Response_CWJAP_2[] = "WIFI GOT IP";
static const char Response_SEND_OK[] = "SEND OK";
static const char Response_STATUS_3[] = "STATUS:3";
static const char Response_CIPSTATUS[] = "+CIPSTATUS:";
static const char Response_CIPCLOSE[] = "CLOSED";
static const char Response_CIFSR[] = "+CIFSR:STAIP,\"";
static const char Response_IPD[] = "+IPD,";
static const char Response_COMMA[] = ",";

// Memoria asociada a las conexiones
static uint8_t CurrentConnectionId;
static uint8_t CurrentReqLength;
static char WifiName[30] = "";
static char WifiPass[30] = "";
static char WifiIp[20] = "";
// Punteros a la pagina web a mostrar
static char * PointerOfHttpWebPage;
char * requestAnswer;
// Variables utilizadas en la maquina de estados.
static const char * Esp8266ResponseToWait;
static delay_t Esp8266Delay;
static uint8_t Esp8266Status = ESP_INIT;
static UARTData_t UARTEsp;
static char rawRequest[256]; //string donde guardo el request
//Para el debug uso la UART USB que usa la terminal
#ifdef DEBUG
static uartMap_t Esp8266DebugUart = UART_USB;
#endif

SemaphoreHandle_t wifiConnectSem;

/*==================[definiciones de datos externos]=========================*/

/*==================[declaraciones de funciones internas]====================*/

static bool_t IsWaitedResponse(void);
static void SetEsp8622Status(uint8_t statusToSend);
static void ExcecuteHttpServerFsm(void);

/*==================[declaraciones de funciones externas]====================*/

/**
 * Funcion para obtener la direccion IP del modulo Esp8266
 * @return devuelve un puntero al arreglo local donde esta alojado el dato.
 */
char * gesp8266GetIpAddress()
{
	return WifiIp;
}

/**
 * Funcion para obtener el nombre de la red del modulo Esp8266
 * @return devuelve un puntero al arreglo local donde esta alojado el dato.
 */
char * gesp8266GetWifiName()
{
	return WifiName;
}

/**
 * Funcion para obtener la contrasenia de la red del modulo Esp8266
 * @return devuelve un puntero al arreglo local donde esta alojado el dato.
 */
char * gesp8266GetWifiPass()
{
	return WifiPass;
}

/**
 * Devuelve al usuario el indice de la conexion establecida
 * @return un entero correspondiente a
 */
uint8_t gesp8266GetConnectionId()
{
	return CurrentConnectionId - '0';
}

/**
 * Configura la conexion para que el modulo Esp8266 sea un servidor HTTP.
 * Realiza llamadas no bloqueantes a la maquina de estados que maneja la conexion.
 * La variable parametersReceived sirve para cargar por unica vez los datos de la red
 * @param wifiName puntero con el nombre de la red Wifi
 * @param wifiPass puntero con la contrasenia de la red Wifi
 * @param debugUart es la uart por donde va a reportar los datos. Este parametro es opcional, poner 0 sino se necesita.
 * @param debugBaudRate es la velocidad de la uart de debug. Poner en 0 si no se necesita.
 * @return TRUE si se configuro correctamente como servidor HTTP, FALSE caso contrario.
 */
bool_t gesp8266InitHttpServer(char * wifiName, char * wifiPass, char * wifiIp)
{
	static bool_t parametersReceived = FALSE;

	if ((!parametersReceived) || checkWifiChange())
	{
		strcpy(WifiName, wifiName);
		strcpy(WifiPass, wifiPass);
		strcpy(WifiIp, wifiIp);
		SetEsp8622Status(ESP_INIT);
		parametersReceived = TRUE;
		resetWifiFlag();
	}
	ExcecuteHttpServerFsm();

	return (Esp8266Status == ESP_WAIT_IPD); //si llego al estado ESP_WAIT_IPD es porque el modulo ya esta configurado.
											//Cuando vuelva a ejecutar la maquina de estados se va a esperar algun Request.
}

/**
 * Funcion para determinar si hay alguna peticion HTTP realizada desde una
 * pagina web, realizada por algun cliente.
 * Ademas realiza llamadas no bloqueantes a la maquina de estados del
 * modulo que administra las conexiones y peticiones de clientes.
 * @return TRUE si se recibio una peticion, FALSE caso contrario.
 */
bool_t gesp8266ReadHttpServer()
{
	ExcecuteHttpServerFsm();
	return (Esp8266Status == ESP_SEND_CIPSEND); //si la FSM llego al estado ESP_SEND_CIPSEND significa que ya llego una peticion
}

/**
 * Funcion para enviar una pagina web actualizada en respuesta a la
 * peticion del cliente.
 * Corrobora quue haya una peticion real del usuario antes de enviar datos.
 * Si hay una peticion, carga en los punteros correspondientes toda la
 * pagina web que se le enviara al cliente.
 * Un detalle importante es que tanto el header como el end de la web son
 * constantes, ya que se supone que no cambian a lo largo del programa.
 * Lo que si cambiara es el body HTTP que es el que contiene la informacion
 * actualizada del estado del sistema.
 * @param webHttpHeader puntero al header http (debe ser parte de la aplicacion de usuario).
 * @param webHttpBody puntero al body http (debe ser parte de la aplicacion de usuario).
 * @param webHttpEnd puntero al end http (debe ser parte de la aplicacion de usuario).
 * @return TRUE si pudo mandar la web correctamente, FALSE caso contrario.
 */
bool_t gesp8266WriteHttpServer(const char * answer)
{
	//antes de enviar se asegura que haya datos pendientes para enviar
	if (Esp8266Status == ESP_SEND_CIPSEND)
	{
		PointerOfHttpWebPage = answer;

	}
	ExcecuteHttpServerFsm();

	return (Esp8266Status == ESP_SEND_CIPCLOSE);
}

/*==================[definiciones de funciones internas]=====================*/

/**
 * Funcion principal del modulo Wifi Esp8266 para funcionar como servidor HTTP.
 * Desde aca se manejan los comandos a enviar, los tiempos a esperar y
 * las respuestas a recibir.
 * Automaticamente cambia de estados en funcion de los eventos que ocurran.
 */
static void ExcecuteHttpServerFsm(void)
{
	uint16_t lenghtOfHttpLines;
	static uint16_t i;
	static uint8_t byteReceived, auxIndex;

	UARTEsp.uartValue = ESP8266_UART;
	UARTEsp.baudRate = ESP8266_BAUD_RATE;

	switch (Esp8266Status)
	{

	case ESP_INIT:
		if (UARTEspInit(&UARTEsp) == false)
		{
			#ifdef DEBUG
						stdioPrintf(Esp8266DebugUart, "Error al incializar UART ESP");
			#endif
		}
		delayConfig(&Esp8266Delay, ESP8266_PAUSE);
		SetEsp8622Status(ESP_SEND_RESET);

		break;

	case ESP_SEND_RESET:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+RST\r\n");
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_RESET);
		}
		break;

	case ESP_WAIT_RESET:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		//Si no recibe OK vuelve a enviar AT
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_RESET);
		}
		break;

	case ESP_SEND_AT:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT\r\n");	//AT para ver si esta vivo
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_AT);
		}
		break;

	case ESP_WAIT_AT:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CWMODE_SET);
		}
		//Si no recibe OK vuelve a enviar AT
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;
////////
	case ESP_SEND_CWMODE:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CWMODE=3\r\n");	//
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_CWMODE);
		}
		break;

	case ESP_WAIT_CWMODE:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CWJAP_CONS);
		}
		//Si no recibe OK vuelve a enviar AT
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CWMODE);
		}
		break;

	case ESP_SEND_CWJAP_CONS:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CWJAP?\r\n");
			Esp8266ResponseToWait = Response_CWJAP_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_CWJAP_CONS_1);
		}
		break;

	case ESP_WAIT_CWJAP_CONS_1:
		if (IsWaitedResponse())
		{
			Esp8266ResponseToWait = Response_OK;
			SetEsp8622Status(ESP_WAIT_CWJAP_CONS_2);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CWMODE_SET);
		}
		break;

	case ESP_WAIT_CWJAP_CONS_2:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CWMODE_SET);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;

	case ESP_SEND_CWMODE_SET:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CWMODE=3\r\n");
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_CWMODE_SET);
		}
		break;

	case ESP_WAIT_CWMODE_SET:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CWJAP_SET);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;

	case ESP_SEND_CWJAP_SET:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CWJAP=\"%s\",\"%s\"\r\n", WifiName,
					WifiPass);
			Esp8266ResponseToWait = Response_CWJAP_1;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_CWJAP_SET_1);
		}
		break;

	case ESP_WAIT_CWJAP_SET_1:
		if (IsWaitedResponse())
		{
			Esp8266ResponseToWait = Response_CWJAP_2;
			SetEsp8622Status(ESP_WAIT_CWJAP_SET_2);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;

	case ESP_WAIT_CWJAP_SET_2:
		if (IsWaitedResponse())
		{
			Esp8266ResponseToWait = Response_OK;
			SetEsp8622Status(ESP_WAIT_CWJAP_SET_3);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;

	case ESP_WAIT_CWJAP_SET_3:
		if (IsWaitedResponse())
			SetEsp8622Status(ESP_SEND_STA_SET);
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;

	case ESP_SEND_STA_SET:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CIPSTA=\"%s\"\r\n", WifiIp);
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_STA_SET);
		}
		break;

	case ESP_WAIT_STA_SET:
		if (IsWaitedResponse())
		{
			SetEsp8622Status(ESP_CIPMUX_SEND);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;

////****

	case ESP_CIPMUX_SEND:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CIPMUX=1\r\n");
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_CIPMUX);
			auxIndex = 0;
		}
		break;

	case ESP_WAIT_CIPMUX:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_CIPSTO_SEND);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			// cierra todas las posibles conexioes
			stdioPrintf(ESP8266_UART, "AT+CIPCLOSE=%d\r\n", auxIndex);
			if (++auxIndex >= 4)
			{
				SetEsp8622Status(ESP_CIPMUX_SEND);
			}
		}
		break;

		//*************************

	case ESP_CIPSTO_SEND:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CIPSTO?\r\n");
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_CIPSTO);
			auxIndex = 0;
		}
		break;

	case ESP_WAIT_CIPSTO:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CIPSERVER);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			// cierra todas las posibles conexioes
			if (++auxIndex >= 4)
			{
				SetEsp8622Status(ESP_CIPMUX_SEND);
			}
		}
		break;

	case ESP_SEND_CIPSERVER:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CIPSERVER=1,80\r\n");
			Esp8266ResponseToWait = Response_OK;
			delayConfig(&Esp8266Delay, ESP8266_TMO);
			SetEsp8622Status(ESP_WAIT_CIPSERVER);
		}
		break;

	case ESP_WAIT_CIPSERVER:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CIFSR);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_AT);
		}
		break;

	case ESP_SEND_CIFSR:
		vTaskDelay(10);
		if (delayRead(&Esp8266Delay))
		{
			stdioPrintf(ESP8266_UART, "AT+CIFSR\r\n");
			Esp8266ResponseToWait = Response_CIFSR;
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_WAIT_CIFSR);
		}
		break;

	case ESP_WAIT_CIFSR:
		if (IsWaitedResponse())
		{
			SetEsp8622Status(ESP_LOAD_IP);
			auxIndex = 0;
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CIFSR);
		}
		break;

		//Recibe byte a byte la direccion IP y la almacena en WifiIp
	case ESP_LOAD_IP:
		if (receiveEspByte(&UARTEsp, &byteReceived, 10))
		{
			if (byteReceived != '"')
			{
				WifiIp[auxIndex] = byteReceived;
				auxIndex++;
			}
			else
			{
				WifiIp[auxIndex] = '\0';
				Esp8266ResponseToWait = Response_IPD;
				SetEsp8622Status(ESP_WAIT_IPD);
			}
		}
		break;

		// En este estado el modulo ya esta configurado como servidor HTTP
		// entonces cada vez que pasa el delay ESP8266_PAUSE mediante
		// el compando CIP_STATUS le pregunta al moduloWifi si hay una nueva peticion

	case ESP_WAIT_IPD:
		if (IsWaitedResponse())
		{	//Espero a que llegue "+IPD,";
			SetEsp8622Status(ESP_GET_REQUEST_ID);
		}
		if (delayRead(&Esp8266Delay))
		{	//espero un timeout
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_WAIT_IPD);
		}
		break;

	case ESP_GET_REQUEST_ID:
		if (receiveEspByte(&UARTEsp, &byteReceived, 10))
		{	//leo el byte que corresponde al ID
			CurrentConnectionId = byteReceived;
			Esp8266ResponseToWait = Response_COMMA;
			SetEsp8622Status(ESP_WAIT_COMMA);
			gpioWrite(LED3, true);
		}
		break;
	case ESP_WAIT_COMMA:
		if (IsWaitedResponse())
		{
			SetEsp8622Status(ESP_GET_REQUEST_LENGTH);
		}
		if (delayRead(&Esp8266Delay))
		{			//espero un tiempo
			Esp8266ResponseToWait = Response_IPD;
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_WAIT_IPD);
		}
		break;

	case ESP_GET_REQUEST_LENGTH:
		if (receiveEspByte(&UARTEsp, &byteReceived, 10))
		{	//leo un byte de la UART y me fijo si ya empieza la Request
			if (byteReceived != ':' && byteReceived >= '0'
					&& byteReceived <= '9')
			{
				CurrentReqLength = (CurrentReqLength * 10)
						+ (byteReceived - '0'); //guardo el valor de la longituda de la request.
				SetEsp8622Status(ESP_GET_REQUEST_LENGTH);
			}
			else
			{
				if (CurrentReqLength > 255)
					CurrentReqLength = 255; //limito el tamano del request a 256 bytes
				i = 0; //reinicio el indice del request
				SetEsp8622Status(ESP_GET_REQUEST);
			}
		}
		break;

	case ESP_GET_REQUEST:

		if (receiveEspByte(&UARTEsp, &byteReceived, 10))
		{	//leo los bytes de la Request
			if (byteReceived != 0x0D && byteReceived != 0x0A) //si es distinto de CR o LF (enter)
			{
				rawRequest[i] = byteReceived;
				i++;
				SetEsp8622Status(ESP_GET_REQUEST);
			}
			else
			{
				rawRequest[i] = 0;
				requestCallback(rawRequest, i); //envio al callback del request la request completa (GET + algo) y el tamaño de la request
				SetEsp8622Status(ESP_SEND_CIPSEND);
			}
		}
		break;

		//En este estado le dice al modulo cuantos bytes va a mandar
		// El comando esta compuesto por el comando CIPSEND, mas el ID
		// de la conexion abierta, mas la cantidad en ASCII de los bytes
		// que tiene la pagina web (o al menos los bytes de la primer linea).
	case ESP_SEND_CIPSEND:
		lenghtOfHttpLines = (strlen(PointerOfHttpWebPage));
		// Si se pasa del maximo largo permitido lo avisa en la web
		if (lenghtOfHttpLines >= MAX_HTTP_WEB_LENGHT)
		{
			stdioSprintf(PointerOfHttpWebPage,
					"ERROR: La longitud de datos HTTP supera el maximo permitido de %d bytes.",
					MAX_HTTP_WEB_LENGHT);
			lenghtOfHttpLines = (strlen(PointerOfHttpWebPage));
		}
		stdioPrintf(ESP8266_UART, "AT+CIPSEND=%c,%d\r\n", CurrentConnectionId,
				lenghtOfHttpLines);
		delayConfig(&Esp8266Delay, ESP8266_PAUSE);
		SetEsp8622Status(ESP_WAIT_CIPSEND);
		Esp8266ResponseToWait = Response_OK;
		break;

	case ESP_WAIT_CIPSEND:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_HTTP);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			Esp8266ResponseToWait = Response_IPD;
			SetEsp8622Status(ESP_WAIT_IPD);
		}
		break;

	case ESP_SEND_HTTP:
		stdioPrintf(ESP8266_UART, "%s", PointerOfHttpWebPage);
		SetEsp8622Status(ESP_WAIT_HTTP);
		Esp8266ResponseToWait = Response_SEND_OK;
		break;

	case ESP_WAIT_HTTP:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CIPCLOSE);
			gpioWrite(LED3, false);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_SEND_CIPSEND);
		}
		break;

	case ESP_SEND_CIPCLOSE:
		stdioPrintf(ESP8266_UART, "AT+CIPCLOSE=%c\r\n", CurrentConnectionId);
		Esp8266ResponseToWait = Response_CIPCLOSE;
		delayConfig(&Esp8266Delay, 100);
		SetEsp8622Status(ESP_WAIT_CIPCLOSE);

		break;

	case ESP_WAIT_CIPCLOSE:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, 1);
			Esp8266ResponseToWait = Response_IPD;
			SetEsp8622Status(ESP_WAIT_IPD);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			Esp8266ResponseToWait = Response_IPD;
			SetEsp8622Status(ESP_WAIT_IPD);
		}
		break;

		//*************************

	case ESP_CIPSTATUS_SEND:
		stdioPrintf(ESP8266_UART, "AT+CIPSTATUS\r\n");
		Esp8266ResponseToWait = Response_OK;
		delayConfig(&Esp8266Delay, ESP8266_TMO);
		SetEsp8622Status(ESP_WAIT_CIPSTATUS);
		auxIndex = 0;
		break;

	case ESP_WAIT_CIPSTATUS:
		if (IsWaitedResponse())
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			SetEsp8622Status(ESP_WAIT_IPD);
		}
		if (delayRead(&Esp8266Delay))
		{
			delayConfig(&Esp8266Delay, ESP8266_PAUSE);
			// cierra todas las posibles conexioes
			if (++auxIndex >= 4)
			{
				SetEsp8622Status(ESP_WAIT_IPD);
			}
		}
		break;

	}

}

/**
 * Determina si la respuesta que envio el modulo Esp8266 al
 * sistema embebido sea correcta.
 * Dentro de esta funcion va leyendo datos de la UART asociada
 * al modulo Esp8266 hasta encontrar el patron de datos necesario.
 * @return TRUE si es la respuesta esperada, FALSE caso contrario.
 */
static bool_t IsWaitedResponse(void)
{
	static uint8_t index = 0;
	uint8_t byteReceived;
	bool_t moduleResponse = FALSE;

	if (receiveEspByte(&UARTEsp, &byteReceived, 10))
	{

		#ifdef DEBUG
				stdioPrintf(Esp8266DebugUart, "%c", byteReceived);
		#endif

		if (byteReceived == Esp8266ResponseToWait[index])
		{
			index++;
			if (Esp8266ResponseToWait[index] == '\0')
			{
				index = 0;
				moduleResponse = TRUE;
				#ifdef DEBUG
								stdioPrintf(Esp8266DebugUart, "\n\r", byteReceived);
				#endif
			}
		}
		else
		{
			index = 0;
		}
	}
	return moduleResponse;
}

/**
 * Setea el estado global del modulo Esp8266.
 * @param status Estado a setear.
 */
static void SetEsp8622Status(Esp8266Status_t status)
{
	Esp8266Status = status;
}

//Funcion que separa la request completa (*rawReq) en 3 strings y los devuelve por los punteros que apuntan
//a la seccion correspondiente de rawReq
//**methode: apunta a la parte de rawReq que es el metodo de la HTTP Request
//**request: apunta a la parte de rawReq que es la solicitud limpia de la HTTP Request
//**version: apunta a la parte de rawReq que la version del HTTP de la HTTP Request
//

void requestSeparate(char *rawReq, char **methode, char **request,
		char **HTTPVersion)
{
	uint16_t i = 0;
	char *aux;
	*methode = rawReq;
	*HTTPVersion = strstr(rawReq, "HTTP/");	//busco el inicio del string de la version HTTP
	while (rawReq[i] != ' ')
		i++;
	rawReq[i] = 0; //pongo fin de cadena entre GET y la request propiamente dicha para separar el
				   //string en 3 strings (methode, request y HTTPVersion)
	*request = &rawReq[i + 1]; //la request empieza un caracter despues del espacio que viene despues del GE

	aux = *HTTPVersion - sizeof(char); //poner el /0 antes de la posicion apuntada por HTTPVersion
	*aux = 0;

}

void requestCallback(char *rawReq, uint8_t reqLength)
{



	uint16_t i = 0;
	static char *methode; //puntero al metodo de la request
	static char *request; //puntero al comienzo de la reqeuest
	static char *HTTPVersion; //puntero al string de la version HTTP
	static char *auxpointer1;
	static char *auxpointer2;
	char auxString[10];
	uint32_t panel;
	uint32_t buttonId;
	command_t auxCommand; //Variable para guardar comandos que van a ser enviados al interprete

	//separo la request completa en 3 bloques (metodo, request limpia y version de HTTP)
	requestSeparate(rawReq, &methode, &request, &HTTPVersion);

	if (!strcmp(methode, "GET"))
	{
		if (!strcmp(request, "/"))
			requestAnswer = HttpWebPage;
		else
		{
			if (strstr(request, "/data"))
			{
				requestAnswer = actualPageData;
			}
			else if (strstr(request, "/button"))
			{
				requestAnswer = ok;
			}
			else if (strstr(request, "/panel"))
			{
				requestAnswer = actualPanel;
			}
			else if (strstr(request, "/body"))
			{
				requestAnswer = HttpBody;
			}
			else if (strstr(request, "/save"))
			{
				requestAnswer = actualPageData;
			}
			else
				requestAnswer = requestError;
		}
	}
	else if (!strcmp(methode, "POST"))
	{
		if (strstr(request, "/button$"))
		{
			//reemplazo los "$" por fin de cadena
			auxpointer1 = strstr(request, "$"); //llego al primer signo $
			auxpointer1[0] = ' ';
			auxpointer2 = strstr(request, "$");
			auxCommand.panelNum = (uint8_t) (auxpointer1[1] - '0'); //capturo el numero de panel
			i = 1;
			while ((i < 4) && (auxpointer2[i] != 0)) //
			{
				gpioToggle(LED1);
				auxCommand.buttonId[i - 1] = auxpointer2[i];
				i++;
			}
			sendCommand(auxCommand);
			requestAnswer = ok;
		}
		else
		{
			if (strstr(request, "/save$"))
			{
				auxpointer1 = strstr(request, "$"); //llego al primer signo $
				auxpointer1[0] = ' ';
				auxpointer2 = strstr(request, "$");
				auxCommand.panelNum = (uint8_t) (auxpointer1[1] - '0'); //capturo el numero de panel
				i = 1;
				while ((i < 4) && (auxpointer2[i] != 0)) //el modulo envia un espacio entre la uri y la version HTML
				{
					auxCommand.buttonId[i - 1] = auxpointer2[i];
					i++;
				}

				//Capturo los parametros a guardar y los convierto a entero
				auxpointer1 = strstr(request, "["); //busco el primer parametro
				for (i = 0; i < 4; i++)
				{
					if (i == 3)
						auxpointer2 = strstr(auxpointer1, "]"); //para el cuarto parametro busco un ]
					else
						auxpointer2 = strstr(auxpointer1, ","); //busco una coma y la reemplazo por 0
					auxpointer2[0] = 0;
					auxCommand.parameters[i] = stringToInt(&auxpointer1[1]);
					auxpointer2[0] = ' ';
					auxpointer1 = auxpointer2;
				}
				sendCommand(auxCommand);

				requestAnswer = actualPageData;
			}
			else
				requestAnswer = requestError;
		}
	}
	else
	{
		requestAnswer = requestError;
	}
	#ifdef DEBUG
		stdioPrintf(UART_USB, "\n La request tiene una longitud de: %d \n",CurrentReqLength);
		stdioPrintf(UART_USB, "\n La request completa es: %s \n", rawReq);
		stdioPrintf(UART_USB, "\n La request limpia es: %s \n", request);
		stdioPrintf(UART_USB, "\n El metodo es: %s \n", methode);
		stdioPrintf(UART_USB, "\n La version de HTTP es: %s \n", HTTPVersion);
	#endif

	return;
}

//Funcion para activar el flag para reconectar wifi
bool_t setWifiFlag()
{
	bool_t ret = false;
	if (xSemaphoreGive(wifiConnectSem))
	{
		bool_t ret = true;
	}
	return ret;
}

//Funcion para desactivar el flag para reconectar wifi
bool_t resetWifiFlag()
{
	bool_t ret = false;
	if (xSemaphoreTake(wifiConnectSem, 0))
	{
		bool_t ret = true;
	}
	return ret;
}

//Funcion para ver si hay que reconectar la red con nueva configuracion
bool_t checkWifiChange()
{
	bool_t ret = false;
	if (uxSemaphoreGetCount(wifiConnectSem))
	{
		ret = true;
	}
	return ret;
}

void espServerInit()
{
	wifiConnectSem = xSemaphoreCreateBinary(); //Creo el semaforo que actua de flag para reconnectar la red WIFI
	//Creo la tarea del servidor
	xTaskCreate(server,                    // Function that implements the task.
			(const char *) "myTask3",     // Text name for the task.
			configMINIMAL_STACK_SIZE * 2, // Stack size in words, not bytes.
			(void*) NULL,                     // Parameter passed into the task.
			tskIDLE_PRIORITY + 2,      // Priority at which the task is created.
			0                       // Pointer to the task created in the system
			);
}

uint32_t stringToInt(char *str)
{
	uint32_t i;
	uint32_t result;
	result = 0;
	for (i = 0; i < (strlen(str)); i++)
	{
		if ((str[i] <= '9') && (str[i] >= '0'))
		{
			result = result * 10;
			result = result + (str[i] - '0');
		}
	}
	return result;
}

//Tarea del servidor WIFI
void server(void* taskParmPtr)
{
	bool_t error;
	uint8_t counter = 0;
	delay_t wifiDelay;
	uint8_t i = 0;
	char SSID[33];
	char PASS[64];
	char IP[16];

	// Send the task to the locked state for 1 s (delay)
	vTaskDelay(1000 / portTICK_RATE_MS);
#ifdef DEBUG
	// Envia un mensaje de bienvenida.
	stdioPrintf(UART_USB,
			"\n\rBienvenido al servidor HTTP Esp8266 con EDU CIAA");
	stdioPrintf(UART_USB,
			"\n\rLa configuracion puede tardar hasta 1 minuto.\n\r\n\r");
#endif
	error = FALSE;
	// Configura un delay para salir de la configuracion en caso de error.
	delayConfig(&wifiDelay, WIFI_MAX_DELAY);

	// Mientras no termine la configuracion o mientras no pase el tiempo maximo, ejecuta la configuracion.
	// A la configuracion se le pasa nombre y contrasenia de RED

	loadWIFIData(SSID, PASS, IP); //Cargo los datos de la red desde EEPROM
	while (!gesp8266ConfigHttpServer(SSID, PASS, IP) && !error)
	{
		//vTaskDelay(1);
		if (delayRead(&wifiDelay))
		{
			error = TRUE;
		}
	}

	// Avisa al usuario como salio la configuracion
	if (!error)
	{
		stdioPrintf(UART_USB, "\n\rServidor HTTP configurado. IP: %s",gesp8266GetIpAddress());
		// Enciende LEDG indicando que el modulo esta configurado.
		gpioWrite(LEDG, TRUE);
	}
	else
	{
		stdioPrintf(UART_USB, "\n\rError al configurar servidor HTTP.");
		// Enciende LEDR indicando que el modulo esta en error.
		gpioWrite(LEDR, TRUE);
	}

	/* ------------- REPETIR POR SIEMPRE ------------- */
	while (1)
	{
		// Si llego una peticion al servidor http
		if (gesp8266ReadHttpServer())
		{
			error = FALSE;
			// Configura un delay para salir de la configuracion en caso de error.
			delayConfig(&wifiDelay, WIFI_MAX_DELAY);

			// Mientras no termine el envio o mientras no pase el tiempo maximo, ejecuta el envio.
			while (!gesp8266WriteHttpServer(requestAnswer) && !error)
			{
				if (delayRead(&wifiDelay))
				{
					error = TRUE;
				}
			}
	#ifdef DEBUG
			// Avisa al usuario como fue el envio
			if (!error)
			{
				stdioPrintf(UART_USB,"\n\rPeticion respondida al cliente HTTP %d.",gesp8266GetConnectionId());
			}
			else
			{
				stdioPrintf(UART_USB,"\n\rPeticion no respondida al cliente HTTP %d.",gesp8266GetConnectionId());
			}
	#endif
			counter++;
		}
		if (checkWifiChange())
		{
			stdioPrintf(UART_USB,"\n\rLa configuracion puede tardar hasta 1 minuto.\n\r\n\r");

			error = FALSE;
			// Configura un delay para salir de la configuracion en caso de error.
			delayConfig(&wifiDelay, WIFI_MAX_DELAY);

			// Mientras no termine la configuracion o mientras no pase el tiempo maximo, ejecuta la configuracion.
			// A la configuracion se le pasa nombre y contrasenia de RED

			loadWIFIData(SSID, PASS, IP); //Cargo los datos de la red desde EEPROM
			while (!gesp8266ConfigHttpServer(SSID, PASS, IP) && !error)
			{
				//vTaskDelay(1);
				if (delayRead(&wifiDelay))
				{
					error = TRUE;
				}
			}

			// Avisa al usuario como salio la configuracion
			if (!error)
			{
				stdioPrintf(UART_USB, "\n\rServidor HTTP configurado. IP: %s",gesp8266GetIpAddress());
				// Enciende LEDG indicando que el modulo esta configurado.
				gpioWrite(LEDG, TRUE);
			}
			else
			{
				stdioPrintf(UART_USB, "\n\rError al configurar servidor HTTP.");
				// Enciende LEDR indicando que el modulo esta en error.
				gpioWrite(LEDR, TRUE);
			}
		}

	}
}

/*==================[fin del archivo]========================================*/
