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
#include "userTasks.h"
#include "portsDriver.h"
#include "UARTEspDriver.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/

int main( void )
{

	static portsConfig_t ports;
	static UARTData_t UARTData;

	ports.uartValue = UART_GPIO;
	ports.baudRate = 460800;



	UARTData.uartValue = UART_USB;
	UARTData.baudRate = 115200;



   boardInit();

   gpioInit( GPIO0, GPIO_OUTPUT );

   portsdriverInit(&ports);
   UARTEspInit(&UARTData);

   // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      myTask,                     // Function that implements the task.
      (const char *)"myTask",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      (void*)&ports.port[0],                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );

   // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      myTask2,                     // Function that implements the task.
      (const char *)"myTask",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      (void*)&UARTData,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );


   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}


