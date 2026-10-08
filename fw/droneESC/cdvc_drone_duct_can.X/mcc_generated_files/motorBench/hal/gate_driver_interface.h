/**
 *   gate_driver_interface.h
 *
 *  This module provides an abstracted interface to the gate driver library.
 *
 *  Component: HAL
 */

/* *********************************************************************
 *
 * Motor Control Application Framework
 * R9/RC31 (commit 132024, build on 2026 Feb 13)
 *
 * (c) 2017 - 2023 Microchip Technology Inc. and its subsidiaries. You may use
 * this software and any derivatives exclusively with Microchip products.
 *
 * This software and any accompanying information is for suggestion only.
 * It does not modify Microchip's standard warranty for its products.
 * You agree that you are solely responsible for testing the software and
 * determining its suitability.  Microchip has no obligation to modify,
 * test, certify, or support the software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
 * INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
 * AND FITNESS FOR A PARTICULAR PURPOSE, OR ITS INTERACTION WITH
 * MICROCHIP PRODUCTS, COMBINATION WITH ANY OTHER PRODUCTS, OR USE IN ANY
 * APPLICATION.
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL,
 * PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF
 * ANY KIND WHATSOEVER RELATED TO THE USE OF THIS SOFTWARE, THE
 * motorBench(R) DEVELOPMENT SUITE TOOL, PARAMETERS AND GENERATED CODE,
 * HOWEVER CAUSED, BY END USERS, WHETHER MICROCHIP'S CUSTOMERS OR
 * CUSTOMER'S CUSTOMERS, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGES OR THE DAMAGES ARE FORESEEABLE. TO THE
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL
 * CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT
 * OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS
 * SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF
 * THESE TERMS.
 *
 * *****************************************************************************/
 
#ifndef MCAF_GDI_H 
#define MCAF_GDI_H 

#include <stdint.h>
#include <stdbool.h>
#include "system/pins.h"
#include "mcp802x/MCP802X_task.h"
#include "board_service_types.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Indicates if there is an active gate driver fault
 * @return true if gate driver has an active fault
 */
inline static bool HAL_GateDriver_FaultIsActive(void)
{
    return !MCP802X_FAULT_GetValue();
}

/**
 * Reads out the fault flags from the gate driver and saves only non-zero copies 
 * of it in pgatedriver->faultFlags. This non-blocking function can be called 
 * as frequently as desired.
 * @param pgatedriver gate driver data
 */
inline static void HAL_GateDriver_ReadFaultFlags(volatile MCAF_GATE_DRIVER_T * pgatedriver)
{
    const uint16_t flags = MCP802X_u16GetLastMcpFaults();
    if (flags > 0)
    {
        pgatedriver->faultFlags = flags;
    }
}

/**
 * Handles communication to gate driver. It must be called periodically as 
 * recommended by the gate driver
 * @return gate driver status
 */
inline static GATE_DRIVER_STATUS HAL_GateDriver_HandleCommunication(void)
{
    const uint16_t drvStatus = MCP802X_eHandleCommunication();
    GATE_DRIVER_STATUS status;
    
    switch(drvStatus)
    {
        case MCP802X_UNINITIALIZED:
        {
            status = GATE_DRIVER_UNINITIALIZED;
            break;
        }
        
        case MCP802X_INITIALIZATION:
        {
            status = GATE_DRIVER_INITIALIZATION;
            break;
        }
        
        case MCP802X_READY:
        {
            status = GATE_DRIVER_READY;
            break;
        }
        
        case MCP802X_ERROR:
        default:
        {
            status = GATE_DRIVER_ERROR;
            break;
        }
    }
    return status;
}

/**
 * Enable gate driver.
 */
inline static void HAL_GateDriver_Enable(void)
{
    MCP802X_ENABLE_SetHigh();
}

/**
 * Disable gate driver.
 */
inline static void HAL_GateDriver_Disable(void)
{
    MCP802X_ENABLE_SetLow();
}

/**
 * Initialize gate driver.
 */
inline static void HAL_GateDriver_Initialize(void)
{
    MCP802X_u8ConfigSet(MCP802X_DEFAULT_CONFIG);
}

/**
 * Disable gate driver's UART TX collision interrupt.
 */
inline static void HAL_GateDriver_UARTTxCollisionIntDisable(void)
{
    MCP802x_UART_TxCollisionInterruptSet(false);
}

/**
 * Enable gate driver's UART TX collision interrupt.
 */
inline static void HAL_GateDriver_UARTTxCollisionIntEnable(void)
{
    MCP802x_UART_TxCollisionInterruptSet(true);
}

#ifdef __cplusplus
}
#endif

#endif /* MCAF_GDI_H */
