/*Este modulo de software esta basado en modulo sapi_esp8266 incluido en la libreria sAPI
 *con adaptaciones a la aplicacion y al uso con FreeRTOS.
 */

/* Copyright 2016, Marcelo Vieytes.
 * Copyright 2017, Pablo Gomez, Agustin Bassi.
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

/* Date: 2017-14-11 */

#ifndef _ESP8266_FreeRTOS_
#define _ESP8266_FreeRTOS_

/*==================[inclusions]=============================================*/

#include "sapi.h"

/*==================[cplusplus]==============================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*==================[macros]=================================================*/

#define gesp8266ConfigHttpServer gesp8266InitHttpServer
//#define DEBUG

/*==================[typedef]================================================*/

/*==================[external data declaration]==============================*/
extern char * requestAnswer;
/*==================[external functions declaration]=========================*/

bool_t gesp8266InitHttpServer(char *, char * ,char * );
bool_t gesp8266ReadHttpServer();
bool_t gesp8266WriteHttpServer(const char * HttpWebPage);

char * gesp8266GetIpAddress();
char * gesp8266GetWifiName();
char * gesp8266GetWifiPass();
uint8_t gesp8266GetConnectionId();
void requestCallback(char *, uint8_t );
void requestSeparate(char *, char **,char **,char **);
uint32_t stringToInt (char *str);
void espServerInit();
bool_t setWifiFlag ();
bool_t resetWifiFlag ();
bool_t checkWifiChange();
void server( void* taskParmPtr );
/*==================[cplusplus]==============================================*/

#ifdef __cplusplus
}
#endif

/*==================[end of file]============================================*/
#endif /* #ifndef _SAPI_ESP8266_ */
