/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "adc.h"
#include "i2c.h"
#include "tim.h"
#include "usart.h"
#include "gpio.h"
#include "PuertosData.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
	uint8_t mcpData [2]; //Datos para la interfaz I2C
	uint32_t heartBeatTimeout = 0;
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC1_Init();
  MX_ADC2_Init();
  MX_I2C1_Init();
  MX_TIM3_Init();
  MX_USART1_UART_Init();
  /* USER CODE BEGIN 2 */

  //Leo el address del modulo
  if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_12)) //
	moduleAddr = moduleAddr | 0x00000001;
  else
	moduleAddr = moduleAddr & 0xFFFFFFFE;

  if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_13))
	moduleAddr = moduleAddr | 0x00000002;
  else
	moduleAddr = moduleAddr & 0xFFFFFFFD;

  if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_14))
	moduleAddr = moduleAddr | 0x00000004;
  else
	moduleAddr = moduleAddr & 0xFFFFFFFB;

  heartBeatTimeout= HAL_GetTick() + HEART_BEAT_PERIOD;

  HAL_ADC_Start(&hadc1); // start the adc1
  HAL_ADC_Start(&hadc2); // start the adc2

  HAL_TIM_Base_Start_IT(&htim3);

  //Disparo la recepcion por interrupcion de la UART
  	if(HAL_UART_Receive_IT(&huart1, (uint8_t*) &bufferUARTin[receiveIndex], 1) != HAL_OK)
  	  {
  	    Error_Handler();
  	  }
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
  //En un loop infinito si hay datos para el DAC y las salidas digitales las actualizo
	  if (dataFlag == 1)
	  {
		mcpData [0] = DACData[0];	//Tomo los datos a enviar al dac
		mcpData [1] = DACData[1];
		dataFlag = 0;
		HAL_I2C_Master_Transmit_IT(&hi2c1, mcpAddress, mcpData, (uint16_t) 2); //Los envio al DAC

		//Actualizo el estado de las salidas digitales
		if (outData & 0x01)
			HAL_GPIO_WritePin(GPIOA,GPIO_PIN_2,GPIO_PIN_SET);
		else
			HAL_GPIO_WritePin(GPIOA,GPIO_PIN_2,GPIO_PIN_RESET);
		if (outData & 0x02)
			HAL_GPIO_WritePin(GPIOA,GPIO_PIN_3,GPIO_PIN_SET);
		else
			HAL_GPIO_WritePin(GPIOA,GPIO_PIN_3,GPIO_PIN_RESET);
		if (outData & 0x04)
			HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_SET);
		else
			HAL_GPIO_WritePin(GPIOA,GPIO_PIN_4,GPIO_PIN_RESET);
		if (outData & 0x08)
			HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_SET);
		else
			HAL_GPIO_WritePin(GPIOB,GPIO_PIN_0,GPIO_PIN_RESET);
	  }


	  if (HAL_GetTick()>=heartBeatTimeout)	//Cada un segundo hago destella el LED de la placa para indicar que esta vivo y actualizo el addres del puerto.
		  {
		  heartBeatTimeout = heartBeatTimeout+HEART_BEAT_PERIOD;

		  HAL_GPIO_TogglePin(GPIOC,GPIO_PIN_13); //Heartbeat

		  //Lectura de entradas digitales
		  if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_12)) //
			moduleAddr = moduleAddr | 0x00000001; //Si pasaro 10 bits en 1 pongo en 1 el primer bit
		  else
			moduleAddr = moduleAddr & 0xFFFFFFFE;	//Si pasaro 10 bits en 0 pongo en 0 el primer bit

		  if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_13)) //
			moduleAddr = moduleAddr | 0x00000002; //Si pasaro 10 bits en 1 pongo en 1 el segundo bit
		  else
			moduleAddr = moduleAddr & 0xFFFFFFFD; //Si pasaro 10 bits en 0 pongo en 0 el segundo bit

		  if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_14)) //
			moduleAddr = moduleAddr | 0x00000004; //Si pasaro 10 bits en 1 pongo en 1 el tercer bit
		  else
			moduleAddr = moduleAddr & 0xFFFFFFFB; //Si pasaro 10 bits en 0 pongo en 0 el tercer bit
		  }

	  /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI_DIV2;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL16;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV4;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC;
  PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV2;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
