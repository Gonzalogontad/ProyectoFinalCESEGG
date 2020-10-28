/*
 * DataMemory.c
 *
 *  Created on: 25 ago. 2020
 *      Author: Gonzalo Gontad
 */
 
#include "DataMemory.h"
#include "FreeRTOS.h"
#include "semphr.h"

uint32_t parametersROM[TESTS_QTY][PARAM_NUM*PORTS_NUMBER];//Creo una matriz donde van a estar todos los parametros de cada test
SemaphoreHandle_t EEPROMSemaphore; //Semaforo para el uso de la EEPROM


//Funcion de inicializacion de la EEPROM
bool initEeprom(void)
{
	bool ret = true;
	Chip_EEPROM_Init(LPC_EEPROM); //inicializar la eeprom
	Chip_EEPROM_SetAutoProg(LPC_EEPROM,EEPROM_AUTOPROG_AFT_1WORDWRITTEN); //Habilito autoprogramacion


	EEPROMSemaphore = xSemaphoreCreateMutex(); //Creo un semaforo para evitar problemas en el uso compartido entre tareas

	if( EEPROMSemaphore == NULL )
	{
	   ret = false;
	}
	return ret;
}

//Cargar parametros de las pruebas desde EEPROM (Protegido con semaforo)
void loadParameters (uint32_t testNumber)
{
	xSemaphoreTake( EEPROMSemaphore, portMAX_DELAY);//Espero a que el recurso este disponible

	uint32_t* ptr = &parametersROM[testNumber][0];	//Obtengo el puntero a donde debo guardar los parametros
	uint32_t i = 0;
	uint32_t *pEepromMem = (uint32_t*)EEPROM_ADDRESS(testNumber+3,0); //inicio en la pagina 3 porque las tres primeras son del servidor
	for(i = 0; i < PARAM_NUM * PORTS_NUMBER; i++) {
		ptr[i] = pEepromMem[i]; //Leo de EEPROM y guardo en RAM
	}

	xSemaphoreGive( EEPROMSemaphore );//Libero el recurso
}

//Cargar parametros desde EEPROM sin proteger
void loadParametersUnprotected (uint32_t testNumber)
{
	uint32_t* ptr = &parametersROM[testNumber][0];
	uint32_t i = 0;
	uint32_t *pEepromMem = (uint32_t*)EEPROM_ADDRESS(testNumber+3,0); //inicio en la pagina 3 porque las tres primeras son del servidor
	for(i = 0; i < PARAM_NUM * PORTS_NUMBER; i++) {
		ptr[i] = pEepromMem[i];	//Leo de EEPROM y guardo en RAM
	}

}

//Obtener el puntero a los paramtros del test en RAM
uint32_t * getParameters (uint32_t testNumber,uint8_t port)
{
	return (&parametersROM[testNumber][port*PARAM_NUM]);
}

//Guardar los parametros del test en EEPROM
void saveParameters (uint32_t testNumber)
{
	xSemaphoreTake( EEPROMSemaphore, portMAX_DELAY);//Espero a que el recurso este disponible

	uint32_t* ptr = &parametersROM[testNumber][0];
	uint8_t i = 0;
	uint32_t *pEepromMem = (uint32_t*)EEPROM_ADDRESS(testNumber+3,0);//las primeras 3 posiciones son del servidor
	uint32_t size =PARAM_NUM * PORTS_NUMBER;
	if(size > EEPROM_PAGE_SIZE )
	   size = EEPROM_PAGE_SIZE;

	for(i = 0; i < size; i++) {
	   pEepromMem[i] = ptr[i];

	   Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
	  }
	xSemaphoreGive( EEPROMSemaphore );//Libero el recurso
}

//Cargar Datos WIFI desde EEPROM
void loadWIFIData (char * SSID,char * PASS,char * IP)
{
	xSemaphoreTake( EEPROMSemaphore, portMAX_DELAY);//Espero a que el recurso este disponible

	//Cargo la SSID
	uint32_t *pEepromMem = (uint32_t*)EEPROM_ADDRESS(0,0); //En la pagina 0 esta la SSID
	uint32_t i = 0;
	while ((pEepromMem[i]!='\0')&&(i<32)){		//Leo desde ROM hasta que llego al fin de cadena
		SSID[i] = pEepromMem[i];
		i++;
		}
	SSID[i]='\0';//pongo el fin de cadena
	//Cargo la contraseña
	pEepromMem = (uint32_t*)EEPROM_ADDRESS(1,0); //En la pagina 1 esta el password
	i = 0;
	while ((pEepromMem[i]!='\0')&&(i<63)){		//Leo desde ROM hasta que llego al fin de cadena
		PASS[i] = pEepromMem[i];
		i++;
		}
	PASS[i]='\0';//pongo el fin de cadena
	//Cargo el IP
	pEepromMem = (uint32_t*)EEPROM_ADDRESS(2,0); //En la pagina 2 esta el IP
	i = 0;
	while ((pEepromMem[i]!='\0')&&(i<15)){		//Leo desde ROM hasta que llego al fin de cadena
		IP[i] = pEepromMem[i];
		i++;
		}
	IP[i]='\0';//pongo el fin de cadena
	xSemaphoreGive( EEPROMSemaphore );//Libero el recurso
}


//Guardar Datos WIFI en EEPROM
void saveWIFIData (char * SSID,char * PASS,char * IP)
{
	xSemaphoreTake( EEPROMSemaphore, portMAX_DELAY);//Espero a que el recurso este disponible

	//Guardo en ROM la SSID
	uint32_t *pEepromMem = (uint32_t*)EEPROM_ADDRESS(0,0);	//En la pagina 0 esta la SSID
	uint32_t i = 0;
	while ((SSID[i]!='\0')&&(i<32)){		//Guardo en ROM hasta que llego al fin de cadena
		pEepromMem[i] = SSID[i];
		Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
		i++;
		}
	pEepromMem[i]='\0';//pongo el fin de cadena
	Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
	//Guardo en ROM la SSID
	pEepromMem = (uint32_t*)EEPROM_ADDRESS(1,0);	//En la pagina 1 esta el password
	i = 0;
	while ((PASS[i]!='\0')&&(i<63)){		//Guardo en ROM hasta que llego al fin de cadena
		pEepromMem[i] = PASS[i];
		Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
		i++;
		}
	pEepromMem[i]='\0';//pongo el fin de cadena
	Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
	//Guardo en ROM la SSID
	pEepromMem = (uint32_t*)EEPROM_ADDRESS(2,0);	//En la pagina 2 esta el IP
	i = 0;
	while ((IP[i]!='\0')&&(i<15)){		//Guardo en ROM hasta que llego al fin de cadena
		pEepromMem[i] = IP[i];
		Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
		i++;
		}
	pEepromMem[i]='\0';//pongo el fin de cadena
	Chip_EEPROM_WaitForIntStatus(LPC_EEPROM, EEPROM_INT_ENDOFPROG);
	xSemaphoreGive( EEPROMSemaphore );//Libero el recurso
}
