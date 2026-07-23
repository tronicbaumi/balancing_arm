/**
 * SCCP6-TIMER Generated Driver Header File 
 * 
 * @file      sccp6.h
 * 
 * @ingroup   timerdriver
 * 
 * @brief     This is the generated driver header file for the SCCP6-TIMER driver
 *
 * @skipline @version   Firmware Driver Version 1.6.1
 *
 * @skipline @version   PLIB Version 1.6.6
 *
 * @skipline  Device : dsPIC33CDVC256MP506
*/

/*
© [2026] Microchip Technology Inc. and its subsidiaries.

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

#ifndef SCCP6_H
#define SCCP6_H

// Section: Included Files

#include <stddef.h>
#include <stdint.h>
#include <xc.h>
#include "timer_interface.h"

// Section: Data Type Definitions


/**
 * @ingroup  timerdriver
 * @brief    Structure object of type TIMER_INTERFACE with the custom name given by 
 *           the user in the Melody Driver User interface. The default name 
 *           e.g. Timer1 can be changed by the user in the TIMER user interface. 
 *           This allows defining a structure with application specific name using 
 *           the 'Custom Name' field. Application specific name allows the API Portability.
*/
extern const struct TIMER_INTERFACE MCP802x_Timer;

/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_Initialize API
 */
#define MCP802x_Timer_Initialize SCCP6_Timer_Initialize
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_Deinitialize API
 */
#define MCP802x_Timer_Deinitialize SCCP6_Timer_Deinitialize
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_Tasks API
 */
#define MCP802x_Timer_Tasks SCCP6_Timer_Tasks
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_Start API
 */
#define MCP802x_Timer_Start SCCP6_Timer_Start
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_Stop API
 */
#define MCP802x_Timer_Stop SCCP6_Timer_Stop

#if TIMER_PERIODCOUNTSET_API_SUPPORT
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_PeriodCountSet API
 */
#define MCP802x_Timer_PeriodCountSet SCCP6_Timer_PeriodCountSet
#endif

/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_PeriodSet API
 */
#define MCP802x_Timer_PeriodSet SCCP6_Timer_PeriodSet
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_PeriodGet API
 */
#define MCP802x_Timer_PeriodGet SCCP6_Timer_PeriodGet
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_CounterGet API
 */
#define MCP802x_Timer_CounterGet SCCP6_Timer_CounterGet
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_Counter16BitGet API
 */
#define MCP802x_Timer_Counter16BitGet SCCP6_Timer_Counter16BitGet
/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_InterruptPrioritySet API
 */
#define MCP802x_Timer_InterruptPrioritySet SCCP6_Timer_InterruptPrioritySet

/**
 * @ingroup  timerdriver
 * @brief    This macro defines the Custom Name for \ref SCCP6_Timer_TimeoutCallbackRegister API
 */
#define MCP802x_Timer_TimeoutCallbackRegister SCCP6_Timer_TimeoutCallbackRegister

// Section: Driver Interface Functions

/**
 * @ingroup  timerdriver
 * @brief    Initializes the SCCP6 module 
 * @param    none
 * @return   none  
 */
void SCCP6_Timer_Initialize (void);

/**
 * @ingroup  timerdriver
 * @brief    Deinitializes the SCCP6 to POR values
 * @param    none
 * @return   none  
 */
void SCCP6_Timer_Deinitialize(void);

/**
 * @ingroup  timerdriver
 * @brief    Starts the timer
 * @pre      \ref SCCP6_Timer_Initialize must be called
 * @param    none
 * @return   none  
 */
void SCCP6_Timer_Start(void);

/**
 * @ingroup  timerdriver
 * @brief    Stops the timer
 * @pre      \ref SCCP6_Timer_Initialize must be called
 * @param    none
 * @return   none  
 */
void SCCP6_Timer_Stop(void);

/**
 * @ingroup  timerdriver
 * @brief    Sets the SCCP6-Timer period count value
 * @pre      \ref SCCP6_Timer_Initialize must be called
 * @param[in]  count - period value
 * @return   none  
 */
void SCCP6_Timer_PeriodSet(uint32_t count);

/**
 * @ingroup  timerdriver
 * @brief    This inline function gets the SCCP6-Timer period count value
 * @pre      \ref SCCP6_Timer_Initialize must be called
 * @param    none
 * @return   Period count value  
 */
inline static uint32_t SCCP6_Timer_PeriodGet(void)
{
    if(CCP6CON1Lbits.T32 == 1)
    {
        return (((uint32_t)CCP6PRH << 16U) | (CCP6PRL) );
    }
    else
    {
        return (uint32_t) CCP6PRL;
    }
}

/**
 * @ingroup  timerdriver
 * @brief    Gets the SCCP6-Timer elapsed count value
 * @param    none
 * @return   Elapsed count value of the timer  
 */
uint32_t SCCP6_Timer_CounterGet(void);

/**
 * @ingroup  timerdriver
 * @brief    This inline function gets the SCCP6-Timer least significant 16 bit elapsed count value
 * @param    none
 * @return   Least significant 16 bit elapsed count value of the timer  
 */
inline static uint16_t SCCP6_Timer_Counter16BitGet(void)
{
    return CCP6TMRL;
}

/**
 * @ingroup  timerdriver
 * @brief    Sets the Interrupt Priority Value 
 * @param    none
 * @return   none  
 */
void SCCP6_Timer_InterruptPrioritySet(enum INTERRUPT_PRIORITY priority);


/**
 * @ingroup    timerdriver
 * @brief      This function can be used to override default callback and to define 
 *             custom callback for SCCP6 Timeout event.
 * @param[in]  handler - Address of the callback function.  
 * @return     none 
 */
void SCCP6_Timer_TimeoutCallbackRegister(void (*handler)(void));

/**
 * @ingroup    timerdriver
 * @brief      This function can be used to override default callback and to define 
 *             custom callback for SCCP6 Timeout event.
 * @param[in]  handler - Address of the callback function.  
 * @return     none 
 */
void SCCP6_TimeoutCallbackRegister(void* handler)__attribute__((deprecated("\nThis will be removed in future MCC releases. \nUse SCCP6_Timer_TimeoutCallbackRegister instead. ")));

/**
 * @ingroup  timerdriver
 * @brief    This is the default callback with weak attribute. The user can 
 *           override and implement the default callback without weak attribute 
 *           or can register a custom callback function using  \ref SCCP6_Timer_TimeoutCallbackRegister.
 * @param    none
 * @return   none  
 */
void SCCP6_TimeoutCallback(void);


#if TIMER_PERIODCOUNTSET_API_SUPPORT
/**
 * @ingroup  timerdriver
 * @brief    Sets the SCCP6-Timer period count value
 * @pre      \ref SCCP6_Timer_Initialize must be called
 * @param[in]  count - period value
 * @return   none  
 */
void SCCP6_Timer_PeriodCountSet(size_t count)__attribute__((deprecated ("\nThis will be removed in future MCC releases. \nUse SCCP6_Timer_PeriodSet instead. ")));
#endif
#endif //SCCP6_H

/**
 End of File
*/


