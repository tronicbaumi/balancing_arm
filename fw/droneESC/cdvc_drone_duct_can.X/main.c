/*
� [2026] Microchip Technology Inc. and its subsidiaries.

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
#include "mcc_generated_files/motorBench/mcaf_main.h"
#include "mcc_generated_files/system/system.h"
#include "mcc_generated_files/can/can1.h"
#include "mcc_generated_files/motorBench/mcaf_sample_application.h"

//#include "arm_can.h"
#include "APL_CAN.h"
#include "system/pins.h"
#include <xc.h>

extern APPLICATION_DATA app;

struct CAN_MSG_OBJ sCanTramsmitBuffer;
volatile uint8_t au8Array[8U];

volatile uint16_t u16Ticker;
volatile uint32_t u32StartupTicks;

void MCAPI_AdcIsrProlog(void)
{
    u16Ticker++;
    u32StartupTicks++;
}

/*
    Main application
 */

int main(void)
{
    SYSTEM_Initialize();
    MCAF_MainInit();

    APL_ATA6563Enable();

    bool motorStarted = false;
    
    app.hardwareUiEnabled = 0;

    while (1)
    {
        MCAF_MainLoop();
        ARM_CAN_Tasks(); /* update arm_angle from received CAN messages */

        /* Start motor 5 s after power-up (20 kHz ISR -> 100 000 ticks = 5 s). */
        if (!motorStarted && u32StartupTicks >= 100000UL)
        {
            MCAPI_VelocityReferenceSet(app.apiData, 2000);
            MCAPI_MotorStart(app.apiData);
            motorStarted = true;
        }

        if (u16Ticker > 200U) // every 10ms
        {
//            u16Ticker = 0;
//            _TRISC11 =0;
//            _LATC11 ^=1;
//            CAN_STBY_SetLow();
//            CAN_STBY_SetDigitalOutput();
            
            
            /* setup transmission information */
//            sCanTramsmitBuffer.msgId = 0x555u;
//            sCanTramsmitBuffer.field.dlc = DLC_8;
//            sCanTramsmitBuffer.field.brs = CAN_NON_BRS_MODE;
//            sCanTramsmitBuffer.field.formatType = CAN_2_0_FORMAT;
//            sCanTramsmitBuffer.field.frameType = CAN_FRAME_DATA;
//            sCanTramsmitBuffer.field.idType = CAN_FRAME_STD;
//            sCanTramsmitBuffer.data = (uint8_t*) & au8Array;
//
//            CAN1_Transmit(CAN1_TXQ, (struct CAN_MSG_OBJ*) &sCanTramsmitBuffer);
        }
    }
}