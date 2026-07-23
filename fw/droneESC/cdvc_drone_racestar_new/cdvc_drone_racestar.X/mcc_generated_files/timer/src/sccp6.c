/**
 * SCCP6-TIMER Generated Driver Source File
 * 
 * @file      sccp6.c
 * 
 * @ingroup   timerdriver
 * 
 * @brief     This is the generated driver source file for SCCP6-TIMER driver
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

// Section: Included Files

#include <stddef.h> 
#include "../sccp6.h"
#include "../timer_interface.h"

// Section: Data Type Definitions

#define MASK_32_BIT_LOW 0x0000FFFFU
#define MASK_32_BIT_HIGH 0xFFFF0000U

// Section: File specific functions

static void (*SCCP6_TimeoutHandler)(void) = NULL;

// Section: Driver Interface

// Defines an object for TIMER_INTERFACE

const struct TIMER_INTERFACE MCP802x_Timer = {
    .Initialize     = &SCCP6_Timer_Initialize,
    .Deinitialize   = &SCCP6_Timer_Deinitialize,
    .Start          = &SCCP6_Timer_Start,
    .Stop           = &SCCP6_Timer_Stop,
    #if TIMER_PERIODCOUNTSET_API_SUPPORT
    .PeriodCountSet = &SCCP6_Timer_PeriodCountSet,
    #endif
    .PeriodSet      = &SCCP6_Timer_PeriodSet,
    .CounterGet     = &SCCP6_Timer_CounterGet,
    .PeriodGet	    = &SCCP6_Timer_PeriodGet,
    .InterruptPrioritySet = &SCCP6_Timer_InterruptPrioritySet,
    .TimeoutCallbackRegister = &SCCP6_Timer_TimeoutCallbackRegister,
    .Tasks          = NULL,
};

// Section: Driver Interface Function Definitions

void SCCP6_Timer_Initialize(void)
{
    // MOD 16-Bit/32-Bit Timer; CCSEL disabled; TMR32 16 Bit; TMRPS 1:16; CLKSEL FOSC/2; TMRSYNC disabled; CCPSLP disabled; CCPSIDL disabled; CCPON disabled; 
    CCP6CON1L = 0x80U; //The module is disabled, till other settings are configured
    //SYNC None; ALTSYNC disabled; ONESHOT disabled; TRIGEN disabled; IOPS Each Time Base Period Match; RTRGEN disabled; OPSRC Timer Interrupt Event; 
    CCP6CON1H = 0x0U;
    //ASDG 0x0; SSDG disabled; ASDGM disabled; PWMRSEN disabled; 
    CCP6CON2L = 0x0U;
    //ICSEL ; AUXOUT Disabled; ICGSM Level-Sensitive mode; OCAEN disabled; OENSYNC disabled; 
    CCP6CON2H = 0x0U;
    //PSSACE Tri-state; POLACE disabled; OSCNT None; OETRIG disabled; 
    CCP6CON3H = 0x0U;
    //ICOV disabled; ICDIS disabled; SCEVT disabled; ASEVT disabled; TRCLR disabled; TRSET disabled; ICGARM disabled; 
    CCP6STATL = 0x0U;
    //TMRL 0x0000; 
    CCP6TMRL = 0x0U;
    //TMRH 0x0000; 
    CCP6TMRH = 0x0U;
    //PRL 62499; 
    CCP6PRL = 0xF423U;
    //PRH 0; 
    CCP6PRH = 0x0U;
    //CMPA 0; 
    CCP6RA = 0x0U;
    //CMPB 0; 
    CCP6RB = 0x0U;
    //BUFL 0x0000; 
    CCP6BUFL = 0x0U;
    //BUFH 0x0000; 
    CCP6BUFH = 0x0U;
    
    SCCP6_Timer_TimeoutCallbackRegister(&SCCP6_TimeoutCallback);

    IFS2bits.CCT6IF = 0;
    // Enabling SCCP6 interrupt
    IEC2bits.CCT6IE = 1;

    CCP6CON1Lbits.CCPON = 1; //Enable Module
}

void SCCP6_Timer_Deinitialize(void)
{
    CCP6CON1Lbits.CCPON = 0;
    
    IFS2bits.CCT6IF = 0;
    IEC2bits.CCT6IE = 0;
    
    CCP6CON1L = 0x0U; 
    CCP6CON1H = 0x0U; 
    CCP6CON2L = 0x0U; 
    CCP6CON2H = 0x100U; 
    CCP6CON3H = 0x0U; 
    CCP6STATL = 0x0U; 
    CCP6TMRL = 0x0U; 
    CCP6TMRH = 0x0U; 
    CCP6PRL = 0xFFFFU; 
    CCP6PRH = 0xFFFFU; 
    CCP6RA = 0x0U; 
    CCP6RB = 0x0U; 
    CCP6BUFL = 0x0U; 
    CCP6BUFH = 0x0U; 
}

void SCCP6_Timer_Start(void)
{
    IFS2bits.CCT6IF = 0;
    // Enable SCCP6 interrupt
    IEC2bits.CCT6IE = 1;
    
    CCP6CON1Lbits.CCPON = 1;
}

void SCCP6_Timer_Stop(void)
{
    CCP6CON1Lbits.CCPON = 0;
    
    IFS2bits.CCT6IF = 0;
    // Disable SCCP6 interrupt
    IEC2bits.CCT6IE = 0;
}

void SCCP6_Timer_PeriodSet(uint32_t count)
{
    if(count > 0xFFFFU)
    {
        CCP6PRL = (uint16_t)(count & MASK_32_BIT_LOW);
        CCP6PRH = (uint16_t)((count & MASK_32_BIT_HIGH) >> 16);
        CCP6CON1Lbits.T32 = 1;
    }
    else
    {
        CCP6PRL = (uint16_t)(count & MASK_32_BIT_LOW);
        CCP6CON1Lbits.T32 = 0;
    }
}

uint32_t SCCP6_Timer_CounterGet(void)
{ 
    uint16_t tmrLow;
    uint16_t tmrHigh;
    uint16_t tmrLowRepeat;
    
    if(CCP6CON1Lbits.T32 == 1)
    {
        tmrLow = CCP6TMRL;
        tmrHigh = CCP6TMRH;
        tmrLowRepeat = CCP6TMRL;
        
        if(tmrLowRepeat < tmrLow)
        {
            return (((uint32_t)CCP6TMRH << 16U) | tmrLowRepeat); 
        }
        else 
        {
            return (((uint32_t)tmrHigh << 16U) | tmrLowRepeat);
        }
    }
    else
    {
        return (uint32_t)CCP6TMRL;
    }
}

void SCCP6_Timer_InterruptPrioritySet(enum INTERRUPT_PRIORITY priority)
{
    IPC11bits.CCT6IP = priority;
}

void SCCP6_Timer_TimeoutCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        SCCP6_TimeoutHandler = handler;
    }
}

void SCCP6_TimeoutCallbackRegister(void* handler)
{
    if(NULL != handler)
    {
        SCCP6_TimeoutHandler = handler;
    }
}

void __attribute__ ((weak)) SCCP6_TimeoutCallback (void)
{ 

} 

/* cppcheck-suppress misra-c2012-8.4
*
* (Rule 8.4) REQUIRED: A compatible declaration shall be visible when an object or 
* function with external linkage is defined
*
* Reasoning: Interrupt declaration are provided by compiler and are available
* outside the driver folder
*/
void __attribute__ ( ( interrupt, no_auto_psv ) ) _CCT6Interrupt (void)
{
    if(NULL != SCCP6_TimeoutHandler)
    {
        (*SCCP6_TimeoutHandler)();
    }
    IFS2bits.CCT6IF = 0;
}

#if TIMER_PERIODCOUNTSET_API_SUPPORT
void SCCP6_PeriodCountSet(size_t count)
{
    CCP6PRL = count & MASK_32_BIT_LOW;
    CCP6PRH = (count & MASK_32_BIT_HIGH) >> 16;
}
#endif

/**
 End of File
*/
