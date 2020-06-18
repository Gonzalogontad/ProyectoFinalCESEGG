/*=============================================================================
 * Author: Gonzalo Gontad <gonzalogontad@gmail.com>
 * Date: 2020/06/14
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "userTasks.h"
#include "portsDriver.h"
#include "UARTEspDriver.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/

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
	portsData_t *port = (portsData_t*) taskParmPtr;
	txData_t portData;
	uint16_t DAC=0;
	uint8_t digitalOuts=0;
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

      sendDataPort(port, DAC, digitalOuts,(TickType_t) portMAX_DELAY);
      DAC++;
      if (digitalOuts==0)
    	  digitalOuts=0x0F;
      else
    	  digitalOuts=0x00;
      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}


void myTask2( void* taskParmPtr )
{
	UARTData_t *UARTData = (UARTData_t *) taskParmPtr;
	uint8_t data='A';

   gpioWrite( LED, ON );

   // Send the task to the locked state for 1 s (delay)
   vTaskDelay( 1000 / portTICK_RATE_MS );

    // ----- Task repeat for ever -------------------------
   while(TRUE) {

		sendEspByte(UARTData,data,(TickType_t) portMAX_DELAY);
		receiveEspByte(UARTData,&data,(TickType_t) portMAX_DELAY);

   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

