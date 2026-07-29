/*
 * arm_can.c
 *
 * Minimal CAN receive path for this ESC. The MCC-generated CAN1 driver in this
 * project is transmit-oriented and has no receive FIFO/filter configured, so
 * this module adds one directly against the CAN FD SFRs. It does not modify any
 * generated files.
 *
 * ctrlBoard2 sends a 1-byte standard CAN 2.0 data frame per node (node 1 ->
 * 0x001, node 2 -> 0x002). ARM_CAN_NODE (in arm_can.h) selects which one this
 * ESC accepts; the received data byte is stored in arm_angle.
 */

#include <xc.h>
#include "APL_CAN.h"
#include "mcc_generated_files/system/pins.h"
#include "mcc_generated_files/can/can1.h"
#include "mcc_generated_files/system/pins.h"
#include "system_state.h"
//#include "mcc_generated_files/motorBench/mcapi.h"

#include "mcc_generated_files/motorBench/mcaf_sample_application.h"

extern APPLICATION_DATA app;

volatile uint16_t arm_angle = 0;

void APL_ATA6563DisableToSleep(void)
{
    __builtin_write_RPCON(0x0000); /* unlock PPS */
    CNPUCbits.CNPUC11 = 1; /* enable weak pullup */
    CAN_STBY_SetHigh();
    CAN_STBY_SetDigitalInput();
    RPINR26bits.CAN1RXR = 0;
    RPOR13bits.RP59R = 0;
    __builtin_write_RPCON(0x0800); /* lock PPS */
    //  Sleep(); // Put the device into Sleep mode
}

void APL_ATA6563Enable(void)
{
    __builtin_write_RPCON(0x0000); /* unlock PPS */
    RPINR26bits.CAN1RXR = 0x0034; //RC4->CAN1:CAN1RX;        
    RPOR13bits.RP59R = 0x0015; //RC11->CAN1:CAN1TX;
    __builtin_write_RPCON(0x0800); /* lock PPS */
    CAN_STBY_SetLow();
    CAN_STBY_SetDigitalOutput();
}

void ARM_CAN_Tasks(void)
{
    struct CAN_MSG_OBJ rxCanMsg;

    if (0u != (uint8_t) CAN1_Receive((struct CAN_MSG_OBJ*) &rxCanMsg))
    {
        const uint32_t u32Id = rxCanMsg.msgId;
        
        if (ARM_CAN_RX_ID == u32Id)
        {
            arm_angle = (uint16_t) rxCanMsg.data[0u];
            if (arm_angle >0)
            {   
                MCAPI_VelocityReferenceSet(app.apiData, (int16_t)(255-arm_angle)<<5);
            }
        }
        else
        {
            // do nothing
        }
    }
}
