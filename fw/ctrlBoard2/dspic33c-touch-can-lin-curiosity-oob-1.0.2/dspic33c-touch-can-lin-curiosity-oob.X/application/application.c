

/*
� [2024] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.? 
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
    THIS SOFTWARE.
*/

#include "application.h"
#include "../bsp/pot.h"
//#include "../mcc_generated_files/uart/uart1.h"
#include "../mcc_generated_files/timer/tmr1.h"
#include "../mcc_generated_files/spi_client/spi1.h"
#include "../mcc_generated_files/can/can1.h"
#include <stdio.h>

// variables

static unsigned int tick_cnt = 0;
static uint8_t spi_rx_buffer[2];
static uint8_t spi_rx_count = 0;


static void Process_Potentiometer_Tasks(void);
static void Process_SPI_Tasks(void);
static void Send_CAN_Message(uint32_t msgId, uint8_t data);
static void Timer1_Callback(void);


void Application_Initialze(void)
{
    POT_Initialize();
    SPI1_Initialize();
    SPI1_Open(CLIENT_CONFIG);
    CAN1_Initialize();
    CAN1_OperationModeSet(CAN_NORMAL_2_0_MODE);
    TMR1_TimeoutCallbackRegister(Timer1_Callback);
}

void Application_Tasks(void)
{
    Process_Potentiometer_Tasks();
    Process_SPI_Tasks();

    if (tick_cnt >= 1000) // 1 second has passed
    {
        tick_cnt = 0; // Reset the tick counter
        printf("SPI RX Buffer: Byte0: 0x%02X, Byte1: 0x%02X\n", spi_rx_buffer[0], spi_rx_buffer[1]);    
    }
    
}


static void Process_Potentiometer_Tasks(void)
{
    float __attribute__((unused)) potVoltage;
    potVoltage = POT_VoltageGet();
}

static void Process_SPI_Tasks(void)
{
    // Read 2-byte SPI messages from Raspberry Pi
    if(SPI1_IsRxReady())
    {
        spi_rx_buffer[spi_rx_count] = SPI1_ByteRead();
        printf("SPI byte received: 0x%02X (count: %d)\n", spi_rx_buffer[spi_rx_count], spi_rx_count);
        spi_rx_count++;
        
        // Check if we have received a complete 2-byte message
        if(spi_rx_count >= 2)
        {
            uint16_t spi_data = (spi_rx_buffer[0] << 8) | spi_rx_buffer[1];
            printf("Received 2-byte SPI message: 0x%04X (Byte0: 0x%02X, Byte1: 0x%02X)\n", 
                   spi_data, spi_rx_buffer[0], spi_rx_buffer[1]);
            
            // Send SPI byte 1 to CAN node 1 (ID 0x001)
            printf("Sending CAN message for Byte0: 0x%02X to Node 0x001\n", spi_rx_buffer[0]);
            Send_CAN_Message(0x001, spi_rx_buffer[0]);
            
            // Send SPI byte 2 to CAN node 2 (ID 0x002)
            printf("Sending CAN message for Byte1: 0x%02X to Node 0x002\n", spi_rx_buffer[1]);
            Send_CAN_Message(0x002, spi_rx_buffer[1]);
            
            // Reset for next message
            spi_rx_count = 0;
        }
    }
}

static void Send_CAN_Message(uint32_t msgId, uint8_t data)
{
    struct CAN_MSG_OBJ canMessage;
    uint8_t messageData[8] = {0};
    
    // Prepare CAN message
    canMessage.msgId = msgId;
    canMessage.field.idType = CAN_FRAME_STD;        // Standard ID
    canMessage.field.frameType = CAN_FRAME_DATA;    // Data Frame
    canMessage.field.dlc = DLC_1;                   // Data Length Code = 1 byte
    canMessage.field.formatType = CAN_2_0_FORMAT;   // CAN 2.0 format
    canMessage.field.brs = 0;                       // No BRS
    
    messageData[0] = data;
    canMessage.data = messageData;
    
    // Transmit using CAN1 interface
    if(CAN1.Transmit != NULL)
    {
        enum CAN_TX_MSG_REQUEST_STATUS txStatus = CAN1.Transmit(0, &canMessage);
        
        if(txStatus == CAN_TX_MSG_REQUEST_SUCCESS)
        {
            printf("CAN message sent to Node 0x%03X with data: 0x%02X\n", msgId, data);
        }
        else
        {
            printf("CAN message transmission failed for Node 0x%03X\n", msgId);
        }
    }
    else
    {
        printf("CAN1 Transmit not configured. Please enable CAN1 Transmit in MCC.\n");
    }
}

static void Timer1_Callback(void)
{
    // Add Timer1 timeout handling code here
    tick_cnt++;
    
}


