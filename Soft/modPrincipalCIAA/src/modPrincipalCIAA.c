/*=============================================================================
 * Author: Gonzalo Gontad <gonzalogontad@gmail.com>
 * Date: 2020/06/14
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "modPrincipalCIAA.h"
#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "timers.h"
#include "task.h"
#include "sapi.h"
#include "portsDriver.h"
//#include "UARTEspDriver.h"
#include "pruebas.h"
#include "interpreter.h"
#include "Esp8266FreeRTOS.h"
#include "terminal.h"
#include "DataMemory.h"
/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/

int main( void )
{

   boardInit();

   //gpioInit( GPIO0, GPIO_OUTPUT );
   //gpioInit( T_COL1, GPIO_OUTPUT );
   //gpioWrite( T_COL1, ON ); //Habilito el modulo wifi


   //Creo las tareas de test y al mismo tiempo inicializo los puertos de pruebas
   interpreterInit();	//Configuro y creo la tarea del interprete
   pruebasInit ();		//Configuro y creo las tareas de las pruebas (una por cada puerto)
   espServerInit();		//Configuro y creo la tarea del servidor
   terminalInit();		//Configuro y creo la tarea de la terminal de configuarcion


   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}



