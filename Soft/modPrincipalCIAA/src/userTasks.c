/*=============================================================================
 * Author: Gonzalo Gontad <gonzalogontad@gmail.com>
 * Date: 2020/06/14
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "userTasks.h"
#include "portsDriver.h"
#include "UARTEspDriver.h"
#include "Esp8266FreeRTOS.h"
#include "pruebas.h"
//#include "webPage.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/
// Se deben definir los datos del nombre de la red y la contrasenia.
#define WIFI_NAME         "Casa-Marmol"
#define WIFI_PASS         "miscolegas"
// El maximo tiempo que se espera una respuesta del modulo ESP8266
#define WIFI_MAX_DELAY    60000

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task implementation
void myTask( void* taskParmPtr )
{
	// ----- Task setup -----------------------------------

   gpioWrite( LED, ON );

   // Send the task to the locked state for 1 s (delay)
   vTaskDelay( 1000 / portTICK_RATE_MS );

   gpioWrite( LED, OFF ); 

   // Periodic task every 500 ms
   portTickType xPeriodicity =  500 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      gpioToggle( LED );

      //sendDataPort(port, DAC, digitalOuts,(TickType_t) portMAX_DELAY);
     // DAC++;
      //if (digitalOuts==0)
    	//  digitalOuts=0x0F;
      //else
    	//  digitalOuts=0x00;
      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}





void myTask3( void* taskParmPtr )
{
	bool_t error;
	uint8_t counter = 0;
	delay_t wifiDelay;
	uint8_t i=0;

   // Send the task to the locked state for 1 s (delay)
   vTaskDelay( 1000 / portTICK_RATE_MS );

   // Envia un mensaje de bienvenida.
   stdioPrintf(UART_USB, "\n\rBienvenido al servidor HTTP Esp8266 con EDU CIAA");
   stdioPrintf(UART_USB, "\n\rLa configuracion puede tardar hasta 1 minuto.");

   error = FALSE;
   // Configura un delay para salir de la configuracion en caso de error.
   delayConfig(&wifiDelay, WIFI_MAX_DELAY);

   // Mientras no termine la configuracion o mientras no pase el tiempo maximo, ejecuta la configuracion.
   // A la configuracion se le pasa nombre y contrasenia de RED
   while (!gesp8266ConfigHttpServer(WIFI_NAME, WIFI_PASS) && !error) {
      if (delayRead(&wifiDelay)) {
         error = TRUE;
      }
   }

   // Avisa al usuario como salio la configuracion
   if (!error) {
      stdioPrintf(UART_USB, "\n\rServidor HTTP configurado. IP: %s", gesp8266GetIpAddress());
      // Enciende LEDG indicando que el modulo esta configurado.
      gpioWrite(LEDG, TRUE);
   } else {
      stdioPrintf(UART_USB, "\n\rError al configurar servidor HTTP.");
      // Enciende LEDR indicando que el modulo esta en error.
      gpioWrite(LEDR, TRUE);
   }

   /* ------------- REPETIR POR SIEMPRE ------------- */
   while(1) {
      // Si llego una peticion al servidor http
      if (gesp8266ReadHttpServer()) {

         // Los datos a enviar a la web deben estar en formato HTML. Notar que
         // BEGIN_USER_LINE y END_USER_LINE solo formatean la cadena a enviar con tags HTML.
    	 //stdioSprintf(HttpWebPageBody, "%s VALOR CONTADOR: %d - VALOR ADC: %d %s", BEGIN_USER_LINE, counter, 3+counter*2, END_USER_LINE);

         error = FALSE;
         // Configura un delay para salir de la configuracion en caso de error.
         delayConfig(&wifiDelay, WIFI_MAX_DELAY);


         // Mientras no termine el envio o mientras no pase el tiempo maximo, ejecuta el envio.
       //  while (!gesp8266WriteHttpServer(HttpWebPage) && !error)

       while (!gesp8266WriteHttpServer(requestAnswer) )
         {

            if (delayRead(&wifiDelay))
            {
               error = TRUE;
            }

         }
		 // Avisa al usuario como fue el envio
		 if (!error) {
			stdioPrintf(UART_USB, "\n\rPeticion respondida al cliente HTTP %d.", gesp8266GetConnectionId());
			gpioToggle(LEDG);
		 }
		 else {
			stdioPrintf(UART_USB, "\n\rPeticion no respondida al cliente HTTP %d.", gesp8266GetConnectionId());
			gpioToggle(LEDR);
		 }

		 counter++;
      }

   }
}



/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

