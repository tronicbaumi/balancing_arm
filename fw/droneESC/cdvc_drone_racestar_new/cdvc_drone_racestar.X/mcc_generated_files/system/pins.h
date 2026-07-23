/**
 * PINS Generated Driver Header File 
 * 
 * @file      pins.h
 *            
 * @defgroup  pinsdriver Pins Driver
 *            
 * @brief     The Pin Driver directs the operation and function of 
 *            the selected device pins using dsPIC MCUs.
 *
 * @skipline @version   Firmware Driver Version 1.0.2
 *
 * @skipline @version   PLIB Version 1.4.1
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

#ifndef PINS_H
#define PINS_H
// Section: Includes
#include <xc.h>

// Section: Device Pin Macros

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RB1 GPIO Pin which has a custom name of MCAF_LED2 to High
 * @pre      The RB1 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define MCAF_LED2_SetHigh()          (_LATB1 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RB1 GPIO Pin which has a custom name of MCAF_LED2 to Low
 * @pre      The RB1 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCAF_LED2_SetLow()           (_LATB1 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RB1 GPIO Pin which has a custom name of MCAF_LED2
 * @pre      The RB1 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCAF_LED2_Toggle()           (_LATB1 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RB1 GPIO Pin which has a custom name of MCAF_LED2
 * @param    none
 * @return   none  
 */
#define MCAF_LED2_GetValue()         _RB1

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RB1 GPIO Pin which has a custom name of MCAF_LED2 as Input
 * @param    none
 * @return   none  
 */
#define MCAF_LED2_SetDigitalInput()  (_TRISB1 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RB1 GPIO Pin which has a custom name of MCAF_LED2 as Output
 * @param    none
 * @return   none  
 */
#define MCAF_LED2_SetDigitalOutput() (_TRISB1 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RB12 GPIO Pin which has a custom name of MCP802X_FAULT to High
 * @pre      The RB12 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define MCP802X_FAULT_SetHigh()          (_LATB12 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RB12 GPIO Pin which has a custom name of MCP802X_FAULT to Low
 * @pre      The RB12 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCP802X_FAULT_SetLow()           (_LATB12 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RB12 GPIO Pin which has a custom name of MCP802X_FAULT
 * @pre      The RB12 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCP802X_FAULT_Toggle()           (_LATB12 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RB12 GPIO Pin which has a custom name of MCP802X_FAULT
 * @param    none
 * @return   none  
 */
#define MCP802X_FAULT_GetValue()         _RB12

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RB12 GPIO Pin which has a custom name of MCP802X_FAULT as Input
 * @param    none
 * @return   none  
 */
#define MCP802X_FAULT_SetDigitalInput()  (_TRISB12 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RB12 GPIO Pin which has a custom name of MCP802X_FAULT as Output
 * @param    none
 * @return   none  
 */
#define MCP802X_FAULT_SetDigitalOutput() (_TRISB12 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RB13 GPIO Pin which has a custom name of MCP802X_ENABLE to High
 * @pre      The RB13 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define MCP802X_ENABLE_SetHigh()          (_LATB13 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RB13 GPIO Pin which has a custom name of MCP802X_ENABLE to Low
 * @pre      The RB13 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCP802X_ENABLE_SetLow()           (_LATB13 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RB13 GPIO Pin which has a custom name of MCP802X_ENABLE
 * @pre      The RB13 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCP802X_ENABLE_Toggle()           (_LATB13 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RB13 GPIO Pin which has a custom name of MCP802X_ENABLE
 * @param    none
 * @return   none  
 */
#define MCP802X_ENABLE_GetValue()         _RB13

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RB13 GPIO Pin which has a custom name of MCP802X_ENABLE as Input
 * @param    none
 * @return   none  
 */
#define MCP802X_ENABLE_SetDigitalInput()  (_TRISB13 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RB13 GPIO Pin which has a custom name of MCP802X_ENABLE as Output
 * @param    none
 * @return   none  
 */
#define MCP802X_ENABLE_SetDigitalOutput() (_TRISB13 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RC9 GPIO Pin which has a custom name of MCAF_BUTTON1 to High
 * @pre      The RC9 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON1_SetHigh()          (_LATC9 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RC9 GPIO Pin which has a custom name of MCAF_BUTTON1 to Low
 * @pre      The RC9 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON1_SetLow()           (_LATC9 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RC9 GPIO Pin which has a custom name of MCAF_BUTTON1
 * @pre      The RC9 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON1_Toggle()           (_LATC9 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RC9 GPIO Pin which has a custom name of MCAF_BUTTON1
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON1_GetValue()         _RC9

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RC9 GPIO Pin which has a custom name of MCAF_BUTTON1 as Input
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON1_SetDigitalInput()  (_TRISC9 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RC9 GPIO Pin which has a custom name of MCAF_BUTTON1 as Output
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON1_SetDigitalOutput() (_TRISC9 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RD12 GPIO Pin which has a custom name of MCAF_BUTTON2 to High
 * @pre      The RD12 must be set as Output Pin             
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON2_SetHigh()          (_LATD12 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Sets the RD12 GPIO Pin which has a custom name of MCAF_BUTTON2 to Low
 * @pre      The RD12 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON2_SetLow()           (_LATD12 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Toggles the RD12 GPIO Pin which has a custom name of MCAF_BUTTON2
 * @pre      The RD12 must be set as Output Pin
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON2_Toggle()           (_LATD12 ^= 1)

/**
 * @ingroup  pinsdriver
 * @brief    Reads the value of the RD12 GPIO Pin which has a custom name of MCAF_BUTTON2
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON2_GetValue()         _RD12

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RD12 GPIO Pin which has a custom name of MCAF_BUTTON2 as Input
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON2_SetDigitalInput()  (_TRISD12 = 1)

/**
 * @ingroup  pinsdriver
 * @brief    Configures the RD12 GPIO Pin which has a custom name of MCAF_BUTTON2 as Output
 * @param    none
 * @return   none  
 */
#define MCAF_BUTTON2_SetDigitalOutput() (_TRISD12 = 0)

/**
 * @ingroup  pinsdriver
 * @brief    Initializes the PINS module
 * @param    none
 * @return   none  
 */
void PINS_Initialize(void);



#endif
