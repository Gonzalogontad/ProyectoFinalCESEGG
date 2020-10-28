/**
  ******************************************************************************
  * File Name          : TIM.c
  * Description        : This file provides code for the configuration
  *                      of the TIM instances.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "tim.h"
#include "adc.h"
#include "PuertosData.h"

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

TIM_HandleTypeDef htim3;

/* TIM3 init function */
void MX_TIM3_Init(void)
{
  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 0;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 4000;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }

}

void HAL_TIM_Base_MspInit(TIM_HandleTypeDef* tim_baseHandle)
{

  if(tim_baseHandle->Instance==TIM3)
  {
  /* USER CODE BEGIN TIM3_MspInit 0 */

  /* USER CODE END TIM3_MspInit 0 */
    /* TIM3 clock enable */
    __HAL_RCC_TIM3_CLK_ENABLE();

    /* TIM3 interrupt Init */
    HAL_NVIC_SetPriority(TIM3_IRQn, 1, 0);
    HAL_NVIC_EnableIRQ(TIM3_IRQn);
  /* USER CODE BEGIN TIM3_MspInit 1 */

  /* USER CODE END TIM3_MspInit 1 */
  }
}

void HAL_TIM_Base_MspDeInit(TIM_HandleTypeDef* tim_baseHandle)
{

  if(tim_baseHandle->Instance==TIM3)
  {
  /* USER CODE BEGIN TIM3_MspDeInit 0 */

  /* USER CODE END TIM3_MspDeInit 0 */
    /* Peripheral clock disable */
    __HAL_RCC_TIM3_CLK_DISABLE();

    /* TIM3 interrupt Deinit */
    HAL_NVIC_DisableIRQ(TIM3_IRQn);
  /* USER CODE BEGIN TIM3_MspDeInit 1 */

  /* USER CODE END TIM3_MspDeInit 1 */
  }
} 

/* USER CODE BEGIN 1 */
//Callback interrupcion de Timer
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	//uint32_t adc_val1;
	//uint32_t adc_val2;
	uint32_t aux;
	uint8_t dataUpdateIndex;

	  //HAL_GPIO_TogglePin(GPIOC,GPIO_PIN_13);


	  sumADC1=sumADC1-bufferADC1[buffLast];
	  sumADC2=sumADC2-bufferADC2[buffLast];

	  //HAL_GPIO_WritePin(GPIOC,GPIO_PIN_13,GPIO_PIN_SET);
	  HAL_ADC_Start(&hadc2); // start the adc2
	  HAL_ADC_Start(&hadc1); // start the adc1
	  HAL_ADC_PollForConversion(&hadc2, 1); // poll for conversion
	  HAL_ADC_PollForConversion(&hadc1, 1); // poll for conversion
	  bufferADC2[buffLast]= HAL_ADC_GetValue(&hadc2); // get the adc value
	  bufferADC1[buffLast] = HAL_ADC_GetValue(&hadc1); // get the adc value

	  //HAL_GPIO_WritePin(GPIOC,GPIO_PIN_13,GPIO_PIN_RESET);

	  //HAL_ADC_Stop(&hadc1); // stop adc
	  //HAL_ADC_Stop(&hadc2); // stop adc

	  sumADC1=sumADC1+bufferADC1[buffLast];
	  sumADC2=sumADC2+bufferADC2[buffLast];

	  buffLast ++;
	  if(buffLast== ADC_BUFFER_SIZE)
		  buffLast = 0;



	  //Lectura de entradas digitales
	  if (HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_5)) //
	  	  {
		  if(ModIn0Counter<10)
			  ModIn0Counter++;
		  else
			  inData = inData | 0x00000001; //Si pasaro 10 bits en 1 pongo en 1 el primer bit

	  	  }
	  else
	  	  {
		  if(ModIn0Counter>0)
			  ModIn0Counter--;
		  else
			  inData = inData & 0xFFFFFFFE;	//Si pasaro 10 bits en 0 pongo en 0 el primer bit
	  	  }

	  if (HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_6)) //
	  	  {
		  if(ModIn1Counter<10)
			  ModIn1Counter++;
		  else
			  inData = inData | 0x00000002; //Si pasaro 10 bits en 1 pongo en 1 el segundo bit

	  	  }
	  else
	  	  {
		  if(ModIn1Counter>0)
			  ModIn1Counter--;
		  else
			  inData = inData & 0xFFFFFFFD; //Si pasaro 10 bits en 0 pongo en 0 el segundo bit
	  	  }

	  if (HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_7)) //
	  	  {
		  if(ModIn2Counter<10)
			  ModIn2Counter++;
		  else
			  inData = inData | 0x00000004; //Si pasaro 10 bits en 1 pongo en 1 el tercer bit

	  	  }
	  else
	  	  {
		  if(ModIn2Counter>0)
			  ModIn2Counter--;
		  else
			  inData = inData & 0xFFFFFFFB; //Si pasaro 10 bits en 0 pongo en 0 el tercer bit
	  	  }

	  //HAL_GPIO_WritePin(GPIOC,GPIO_PIN_13,GPIO_PIN_SET);

	  //Veo que array esta disponible para cargar informacion
	  if (packedDataIndex==0)
		  dataUpdateIndex=1;
	  else dataUpdateIndex =0;



	  //Byte 1 = 1+AAA+A1A1A1A1(parte alta)
	  //Byte 2 = 0+A1A1A1A1A1A1A1 (parte baja)
	  //Byte 3 = 0+III+A2A2A2A2(parte alta)
	  //Byte 4 = 0+A2A2A2A2A2A2A2

	  //Cargo la informacion
	  aux = (sumADC1>>4); //Me quedo con los 11 bits mas significativos
	  packedDataOut[dataUpdateIndex][1] = (uint8_t)(aux & 0x0000007F); //obtengo la parte baja del promedio
	  //aux = (sumADC1>>7);
	  aux = (aux>>7);
	  packedDataOut[dataUpdateIndex][0] = (uint8_t)(aux & 0x0000000F); //obtengo la parte alta del promedio
	  aux = (moduleAddr<<4)|(0x00000080);
	  packedDataOut[dataUpdateIndex][0] = packedDataOut[dataUpdateIndex][0]|((uint8_t)(aux)); //Agrego el addres y el start bit

	  aux = (sumADC2>>4); //Me quedo con los 11 bits mas significativos
	  packedDataOut[dataUpdateIndex][3] = (uint8_t)(aux & 0x0000007F); //obtengo la parte baja del promedio
	  //aux = (sumADC2>>7);
	  aux = (aux>>7);
	  packedDataOut[dataUpdateIndex][2] = (uint8_t)(aux & 0x0000000F); //obtengo la parte alta del promedio
	  aux = (inData<<4)&(0x0000007F); //pongo en cero el primer bit del tercer byte
	  packedDataOut[dataUpdateIndex][2] = packedDataOut[dataUpdateIndex][2]|((uint8_t)(aux)); //Agrego el addres y el start bit

	  //
	  //if((packedDataOut[0][3]==packedDataOut[0][2])||packedDataOut[1][3]==packedDataOut[1][2])
	  //{

	  //}

	  //Cambio el indice del array disponible para enviar
	  if (packedDataIndex==0)
		  packedDataIndex=1;
	  else packedDataIndex = 0;





	  //bufferUARTout[3] = bufferUARTout[2];
	  //HAL_GPIO_TogglePin(GPIOC,GPIO_PIN_13);
	  //HAL_GPIO_WritePin(GPIOC,GPIO_PIN_13,GPIO_PIN_RESET);

}
/*void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	uint32_t adc_val1;
	uint32_t adc_val2;
	  HAL_GPIO_TogglePin(GPIOC,GPIO_PIN_13);
	  HAL_ADC_Start(&hadc1); // start the adc1
	  HAL_ADC_Start(&hadc2); // start the adc2
	  HAL_ADC_PollForConversion(&hadc1, 100); // poll for conversion
	  HAL_ADC_PollForConversion(&hadc2, 100); // poll for conversion
	  adc_val1 = HAL_ADC_GetValue(&hadc1); // get the adc value
	  adc_val2 = HAL_ADC_GetValue(&hadc2); // get the adc value
	  HAL_ADC_Stop(&hadc1); // stop adc
	  HAL_ADC_Stop(&hadc2); // stop adc
	  bufferUARTout[0] = (uint8_t)(adc_val1 >> 4);
	  bufferUARTout[1] = bufferUARTout[0];
	  bufferUARTout[2] = (uint8_t)(adc_val2 >> 4);
	  bufferUARTout[3] = bufferUARTout[2];
	  HAL_GPIO_TogglePin(GPIOC,GPIO_PIN_13);

}*/

/* USER CODE END 1 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
