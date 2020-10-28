/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f1xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define ModuleHeartBeat_Pin GPIO_PIN_13
#define ModuleHeartBeat_GPIO_Port GPIOC
#define ModuleOut0_Pin GPIO_PIN_2
#define ModuleOut0_GPIO_Port GPIOA
#define ModuleOut1_Pin GPIO_PIN_3
#define ModuleOut1_GPIO_Port GPIOA
#define ModuleOut2_Pin GPIO_PIN_4
#define ModuleOut2_GPIO_Port GPIOA
#define ModuleIn0_Pin GPIO_PIN_5
#define ModuleIn0_GPIO_Port GPIOA
#define ModuleIn1_Pin GPIO_PIN_6
#define ModuleIn1_GPIO_Port GPIOA
#define ModuleIn2_Pin GPIO_PIN_7
#define ModuleIn2_GPIO_Port GPIOA
#define ModuelAddr0_Pin GPIO_PIN_12
#define ModuelAddr0_GPIO_Port GPIOB
#define ModuelAddr1_Pin GPIO_PIN_13
#define ModuelAddr1_GPIO_Port GPIOB
#define ModuelAddr2_Pin GPIO_PIN_14
#define ModuelAddr2_GPIO_Port GPIOB
#define ModuelAddr3_Pin GPIO_PIN_15
#define ModuelAddr3_GPIO_Port GPIOB
#define DAC_SCL_Pin GPIO_PIN_6
#define DAC_SCL_GPIO_Port GPIOB
#define DAC_SDA_Pin GPIO_PIN_7
#define DAC_SDA_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
