/**
  ******************************************************************************
  * File Name          : USART.c
  * Description        : This file provides code for the configuration
  *                      of the USART instances.
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
#include "usart.h"
#include "PuertosData.h"

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

UART_HandleTypeDef huart1;

/* USART1 init function */

void MX_USART1_UART_Init(void)
{

  huart1.Instance = USART1;
  huart1.Init.BaudRate = 460800;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }

}

void HAL_UART_MspInit(UART_HandleTypeDef* uartHandle)
{

  GPIO_InitTypeDef GPIO_InitStruct = {0};
  if(uartHandle->Instance==USART1)
  {
  /* USER CODE BEGIN USART1_MspInit 0 */

  /* USER CODE END USART1_MspInit 0 */
    /* USART1 clock enable */
    __HAL_RCC_USART1_CLK_ENABLE();
  
    __HAL_RCC_GPIOA_CLK_ENABLE();
    /**USART1 GPIO Configuration    
    PA9     ------> USART1_TX
    PA10     ------> USART1_RX 
    */
    GPIO_InitStruct.Pin = GPIO_PIN_9;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = GPIO_PIN_10;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    /* USART1 interrupt Init */
    HAL_NVIC_SetPriority(USART1_IRQn, 0, 0);
    HAL_NVIC_EnableIRQ(USART1_IRQn);
  /* USER CODE BEGIN USART1_MspInit 1 */

  /* USER CODE END USART1_MspInit 1 */
  }
}

void HAL_UART_MspDeInit(UART_HandleTypeDef* uartHandle)
{

  if(uartHandle->Instance==USART1)
  {
  /* USER CODE BEGIN USART1_MspDeInit 0 */

  /* USER CODE END USART1_MspDeInit 0 */
    /* Peripheral clock disable */
    __HAL_RCC_USART1_CLK_DISABLE();
  
    /**USART1 GPIO Configuration    
    PA9     ------> USART1_TX
    PA10     ------> USART1_RX 
    */
    HAL_GPIO_DeInit(GPIOA, GPIO_PIN_9|GPIO_PIN_10);

    /* USART1 interrupt Deinit */
    HAL_NVIC_DisableIRQ(USART1_IRQn);
  /* USER CODE BEGIN USART1_MspDeInit 1 */

  /* USER CODE END USART1_MspDeInit 1 */
  }
} 

/* USER CODE BEGIN 1 */
//Callbacks de interrupciones de UART

//Callback de recepcion

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *UartHandle)
{
	uint8_t auxByte;
	//Si el primer bit es 1 significa que llego el primer byte
	if (bufferUARTin[receiveIndex]& 0x80)
	{
		if (((auxByte=bufferUARTin[receiveIndex]>>4)&0x07)==moduleAddr)	//Checkeo address del dato, si es el propio envio los datos de ADCs y entradas
		{
			receiveIndex = 1;	//Incremento el indice

			//Mientras se ejecuta la interrupcion no pueden ocurrir cambios en la variable packedDataIndex ni en PackedDataOut
			//porque es la interrupcion de mayor prioridad. Sin embargo si pueden ocurrir durante la transmision de los datos.
			//Por lo tanto copio la informacion a enviar para evitar cambios durante la transmision
			for (auxByte=0; auxByte < OUTPUT_BUFFER_SIZE; auxByte++)
				{
				bufferUARTout[auxByte] = packedDataOut [packedDataIndex][auxByte];
				}
			//Transmito la informacion por la UART
			if(HAL_UART_Transmit_IT(&huart1, bufferUARTout, OUTPUT_BUFFER_SIZE)!= HAL_OK)
			  {
				 Error_Handler();
			  }
		}
		else receiveIndex = 0; //Si el dato no corresponde a este address reinicio el Indice
	}
	//Si el primer bit es 0 significa que llego el 2 o 3 byte puede o no ser para el address actual
	else
	{
		if (receiveIndex == 1)
		{
			//P=Paridad
			//Byte 1	= 1+AAA+P+DDD
			//Byte 2	= 0+DDDDDDD
			//Byte 3	= 0+HHHOOOO
			//cambiar el orden segun Hamming
		DACData[1] = bufferUARTin[1]<<2; // Elimino los primeros bits MSB y lleno con Cero los LSB para completar los 12 bits
		DACData[0] = ((bufferUARTin[0]&0x07)<<1)|(bufferUARTin[1]>>6); //Armo el segundo byte porque la parte alta llegan 3 bits en el primer byte y 1 bit en el siguiente
		receiveIndex = 2;
		}
		else
			if (receiveIndex == 2)
			{
				outData=bufferUARTin[2]|((bufferUARTin[0] & 0x08)<<4);
				dataFlag = 1; //Indico que hay datos para enviar al DAC y a las salidas digitales
				receiveIndex = 0;
			}
	}

	//Espero a que llegue otro dato por UART y lo guardo en el buffer
	if(HAL_UART_Receive_IT(&huart1, (uint8_t*) &bufferUARTin[receiveIndex], 1) != HAL_OK)
	  {
	    Error_Handler();
	  }


}
/* USER CODE END 1 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
