/**
 * UART3 Generated Driver Source File
 * 
 * @file        uart3.c
 *  
 * @ingroup     uartdriver
 *  
 * @brief       This is the generated driver source file for the UART3 driver
 *            
 * @skipline @version     Firmware Driver Version 1.7.0
 *
 * @skipline @version     PLIB Version 1.5.4
 *
 * @skipline    Device : dsPIC33CDVC256MP506
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
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>
#include <xc.h>
#include "../uart3.h"

// Section: Macro Definitions
#define UART3_CLOCK 100000000U
#define UART3_BAUD_TO_BRG_WITH_FRACTIONAL(x) (UART3_CLOCK/(x))
#define UART3_BAUD_TO_BRG_WITH_BRGH_1(x) (UART3_CLOCK/(4U*(x))-1U)
#define UART3_BAUD_TO_BRG_WITH_BRGH_0(x) (UART3_CLOCK/(16U*(x))-1U)
#define UART3_BRG_TO_BAUD_WITH_FRACTIONAL(x) (UART3_CLOCK/(x))
#define UART3_BRG_TO_BAUD_WITH_BRGH_1(x) (UART3_CLOCK/(4U*((x)+1U)))
#define UART3_BRG_TO_BAUD_WITH_BRGH_0(x) (UART3_CLOCK/(16U*((x)+1U)))

#define UART3_MIN_ACHIEVABLE_BAUD_WITH_FRACTIONAL 95U
#define UART3_MIN_ACHIEVABLE_BAUD_WITH_BRGH_1 24U

// Section: Driver Interface

const struct UART_INTERFACE MCP802x_UART = {
    .Initialize = &UART3_Initialize,
    .Deinitialize = &UART3_Deinitialize,
    .Read = &UART3_Read,
    .Write = &UART3_Write,
    .IsRxReady = &UART3_IsRxReady,
    .IsTxReady = &UART3_IsTxReady,
    .IsTxDone = &UART3_IsTxDone,
    .TransmitEnable = &UART3_TransmitEnable,
    .TransmitDisable = &UART3_TransmitDisable,
    .TransmitInterruptEnable = NULL,
    .TransmitInterruptDisable = NULL,
    .AutoBaudSet = &UART3_AutoBaudSet,
    .AutoBaudQuery = &UART3_AutoBaudQuery,
    .AutoBaudEventEnableGet = &UART3_AutoBaudEventEnableGet,
    .BRGCountSet = &UART3_BRGCountSet,
    .BRGCountGet = &UART3_BRGCountGet,
    .BaudRateSet = &UART3_BaudRateSet,
    .BaudRateGet = &UART3_BaudRateGet,
    .ErrorGet = &UART3_ErrorGet,
    .RxCompleteCallbackRegister = &UART3_RxCompleteCallbackRegister,
    .TxCompleteCallbackRegister = &UART3_TxCompleteCallbackRegister,
    .TxCollisionCallbackRegister = &UART3_TxCollisionCallbackRegister,
    .FramingErrorCallbackRegister = &UART3_FramingErrorCallbackRegister,
    .OverrunErrorCallbackRegister = &UART3_OverrunErrorCallbackRegister,
    .ParityErrorCallbackRegister = &UART3_ParityErrorCallbackRegister,
};

// Section: Private Variable Definitions

static volatile bool softwareBufferEmpty = true;
static union
{
    struct
    {
        uint16_t frammingError :1;
        uint16_t parityError :1;
        uint16_t overrunError :1;
        uint16_t txCollisionError :1;
        uint16_t autoBaudOverflow :1;
        uint16_t reserved :11;
    };
    size_t status;
} uartError;

// Section: Data Type Definitions

/**
 @ingroup  uartdriver
 @static   UART Driver Queue Status
 @brief    Defines the object required for the status of the queue
*/
static uint8_t * volatile rxTail;
static uint8_t * volatile rxHead;
static uint8_t * volatile txTail;
static uint8_t * volatile txHead;
static bool volatile rxOverflowed;

/**
 @ingroup  uartdriver
 @brief    Defines the length of the Transmit and Receive Buffers
*/

/* We add one extra byte than requested so that we don't have to have a separate
 * bit to determine the difference between buffer full and buffer empty, but
 * still be able to hold the amount of data requested by the user.  Empty is
 * when head == tail.  So full will result in head/tail being off by one due to
 * the extra byte.
 */
#define UART3_CONFIG_TX_BYTEQ_LENGTH (8+1)
#define UART3_CONFIG_RX_BYTEQ_LENGTH (8+1)

/**
 @ingroup  uartdriver
 @static   UART Driver Queue
 @brief    Defines the Transmit and Receive Buffers
*/
static uint8_t txQueue[UART3_CONFIG_TX_BYTEQ_LENGTH];
static uint8_t rxQueue[UART3_CONFIG_RX_BYTEQ_LENGTH];

static void (*UART3_RxCompleteHandler)(void);
static void (*UART3_TxCompleteHandler)(void);
static void (*UART3_TxCollisionHandler)(void);
static void (*UART3_FramingErrorHandler)(void);
static void (*UART3_OverrunErrorHandler)(void);
static void (*UART3_ParityErrorHandler)(void);

// Section: Driver Interface

void UART3_Initialize(void)
{
    IEC3bits.U3TXIE = 0;
    IEC3bits.U3RXIE = 0;
    IEC11bits.U3EVTIE = 0;

    // URXEN ; RXBIMD ; UARTEN disabled; MOD Asynchronous 8-bit UART; UTXBRK ; BRKOVR ; UTXEN ; USIDL ; WAKE ; ABAUD ; BRGH ; 
    U3MODE = 0x0U;
    // STSEL 1 Stop bit sent, 1 checked at RX; BCLKMOD enabled; SLPEN ; FLO ; BCLKSEL FOSC/2; C0EN ; RUNOVF ; UTXINV ; URXINV ; HALFDPLX ; 
    U3MODEH = 0x800U;
    // OERIE ; RXBKIF ; RXBKIE ; ABDOVF ; OERR ; TXCIE ; TXCIF ; FERIE ; TXMTIE ; ABDOVE ; CERIE ; CERIF ; PERIE ; 
    U3STA = 0x80U;
    // URXISEL ; UTXBE ; UTXISEL TX_BUF_EMPTY; URXBE ; STPMD ; TXWRE ; 
    U3STAH = 0x2EU;
    // BaudRate 9599.69; Frequency 100000000 Hz; BRG 10417; 
    U3BRG = 0x28B1U;
    // BRG 0; 
    U3BRGH = 0x0U;
    
    txHead = txQueue;
    txTail = txQueue;
    rxHead = rxQueue;
    rxTail = rxQueue;
   
    rxOverflowed = false;
    
    UART3_RxCompleteCallbackRegister(&UART3_RxCompleteCallback);
    UART3_TxCompleteCallbackRegister(&UART3_TxCompleteCallback);
    UART3_TxCollisionCallbackRegister(&UART3_TxCollisionCallback);
    UART3_FramingErrorCallbackRegister(&UART3_FramingErrorCallback);
    UART3_OverrunErrorCallbackRegister(&UART3_OverrunErrorCallback);
    UART3_ParityErrorCallbackRegister(&UART3_ParityErrorCallback);

    // UART Frame error interrupt
    U3STAbits.FERIE = 1;
    // UART Parity error interrupt
    U3STAbits.PERIE = 1;
    // UART Receive Buffer Overflow interrupt
    U3STAbits.OERIE = 1;
    // UART Transmit collision interrupt
    U3STAbits.TXCIE = 1;
    // UART Auto-Baud Overflow interrupt
    U3STAbits.ABDOVE = 1;  
    // UART Receive Interrupt
    IEC3bits.U3RXIE = 1;
    // UART Event interrupt
    IEC11bits.U3EVTIE = 1;
    // UART Error interrupt
    IEC3bits.U3EIE    = 1;
    
    //Make sure to set LAT bit corresponding to TxPin as high before UART initialization
    U3MODEbits.UARTEN = 1;   // enabling UART ON bit
    U3MODEbits.UTXEN = 1;
    U3MODEbits.URXEN = 1;
}

void UART3_Deinitialize(void)
{
    // UART Transmit interrupt
    IFS3bits.U3TXIF = 0;
    IEC3bits.U3TXIE = 0;
    
    // UART Receive Interrupt
    IFS3bits.U3RXIF = 0;
    IEC3bits.U3RXIE = 0;
    
    // UART Event interrupt
    IFS11bits.U3EVTIF = 0;
    IEC11bits.U3EVTIE = 0;
    
    // UART Error interrupt
    IFS3bits.U3EIF = 0;
    IEC3bits.U3EIE    = 0;
    
    U3MODE = 0x0U;
    U3MODEH = 0x0U;
    U3STA = 0x80U;
    U3STAH = 0x2EU;
    U3BRG = 0x0U;
    U3BRGH = 0x0U;
}

uint8_t UART3_Read(void)
{
    uint8_t data = 0;

    if(rxHead != rxTail)
	{
		data = *rxHead;

		rxHead++;

		if (rxHead == &rxQueue[UART3_CONFIG_RX_BYTEQ_LENGTH])
		{
			rxHead = rxQueue;
		}
	}
    return data;
}

void UART3_Write(uint8_t byte)
{
    while(UART3_IsTxReady() == 0)
    {
    }

    *txTail = byte;

    txTail++;
    
    if (txTail == &txQueue[UART3_CONFIG_TX_BYTEQ_LENGTH])
    {
        txTail = txQueue;
    }

    IEC3bits.U3TXIE = 1;
    softwareBufferEmpty = false;
}

bool UART3_IsRxReady(void)
{    
    return !(rxHead == rxTail);
}

bool UART3_IsTxReady(void)
{
    uint16_t size;
    uint8_t *snapshot_txHead = (uint8_t*)txHead;
    
    if (txTail < snapshot_txHead)
    {
        size = (snapshot_txHead - txTail - 1);
    }
    else
    {
        size = ( UART3_CONFIG_TX_BYTEQ_LENGTH - (txTail - snapshot_txHead) - (uint16_t)1 );
    }
    
    return (size != (uint16_t)0);
}

bool UART3_IsTxDone(void)
{
    bool status = false;
    
    if(txTail == txHead)
    {
        status = (bool)(U3STAbits.TRMT && U3STAHbits.UTXBE);
    }
    
    return status;
}

void UART3_TransmitEnable(void)
{
    U3MODEbits.UTXEN = 1;
}

void UART3_TransmitDisable(void)
{
    U3MODEbits.UTXEN = 0;
}


void UART3_AutoBaudSet(bool enable)
{
    U3INTbits.ABDIF = 0U;
    U3INTbits.ABDIE = enable;
    U3MODEbits.ABAUD = enable;
}

bool UART3_AutoBaudQuery(void)
{
    return U3MODEbits.ABAUD;
}

bool UART3_AutoBaudEventEnableGet(void)
{ 
    return U3INTbits.ABDIE; 
}


void UART3_BRGCountSet(uint32_t brgValue)
{
    U3BRG = brgValue & 0xFFFFU;
    U3BRGH = (brgValue >>16U) & 0x000FU;
}

uint32_t UART3_BRGCountGet(void)
{
    uint32_t brgValue;
    
    brgValue = U3BRGH;
    brgValue = (brgValue << 16U) | U3BRG;
    
    return brgValue;
}

void UART3_BaudRateSet(uint32_t baudRate)
{
    uint32_t brgValue;
    
    if((baudRate >= UART3_MIN_ACHIEVABLE_BAUD_WITH_FRACTIONAL) && (baudRate != 0U))
    {
        U3MODEHbits.BCLKMOD = 1;
        U3MODEbits.BRGH = 0;
        brgValue = UART3_BAUD_TO_BRG_WITH_FRACTIONAL(baudRate);
    }
    else if(baudRate >= UART3_MIN_ACHIEVABLE_BAUD_WITH_BRGH_1)
    {
        U3MODEHbits.BCLKMOD = 0;
        U3MODEbits.BRGH = 1;
        brgValue = UART3_BAUD_TO_BRG_WITH_BRGH_1(baudRate);
    }
    else
    {
        U3MODEHbits.BCLKMOD = 0;
        U3MODEbits.BRGH = 0;
        brgValue = UART3_BAUD_TO_BRG_WITH_BRGH_0(baudRate);
    }
    U3BRG = brgValue & 0xFFFFU;
    U3BRGH = (brgValue >>16U) & 0x000FU;
}

uint32_t UART3_BaudRateGet(void)
{
    uint32_t brgValue;
    uint32_t baudRate;
    
    brgValue = UART3_BRGCountGet();
    if((U3MODEHbits.BCLKMOD == 1U) && (brgValue != 0U))
    {
        baudRate = UART3_BRG_TO_BAUD_WITH_FRACTIONAL(brgValue);
    }
    else if(U3MODEbits.BRGH == 1)
    {
        baudRate = UART3_BRG_TO_BAUD_WITH_BRGH_1(brgValue);
    }
    else
    {
        baudRate = UART3_BRG_TO_BAUD_WITH_BRGH_0(brgValue);
    }
    return baudRate;
}

void UART3_TxCollisionInterruptSet(const bool enable)
{
    if(enable == true)
    {
        U3STAbits.TXCIE = 1;
    }
    else 
    {
        U3STAbits.TXCIE = 0;
    }
}

size_t UART3_ErrorGet(void)
{
    size_t fetchUartError = uartError.status;
    uartError.status = 0;
    return fetchUartError;
}

void UART3_RxCompleteCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        UART3_RxCompleteHandler = handler;
    }
}

void __attribute__ ((weak)) UART3_RxCompleteCallback(void)
{ 

} 

void UART3_TxCompleteCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        UART3_TxCompleteHandler = handler;
    }
}

void __attribute__ ((weak)) UART3_TxCompleteCallback(void)
{ 

} 

void UART3_TxCollisionCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        UART3_TxCollisionHandler = handler;
    }
}

void __attribute__ ((weak)) UART3_TxCollisionCallback(void)
{ 

} 

void UART3_FramingErrorCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        UART3_FramingErrorHandler = handler;
    }
}

void __attribute__ ((weak)) UART3_FramingErrorCallback(void)
{ 

} 

void UART3_OverrunErrorCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        UART3_OverrunErrorHandler = handler;
    }
}

void __attribute__ ((weak)) UART3_OverrunErrorCallback(void)
{ 

} 

void UART3_ParityErrorCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        UART3_ParityErrorHandler = handler;
    }
}

void __attribute__ ((weak)) UART3_ParityErrorCallback(void)
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
void __attribute__ ( ( interrupt, no_auto_psv ) ) _U3TXInterrupt(void)
{

    if(txHead == txTail)
    {
        if(NULL != UART3_TxCompleteHandler)
            {
                (*UART3_TxCompleteHandler)();
            }
        IEC3bits.U3TXIE = 0;
        softwareBufferEmpty = true;
    }
    else
    {

        while(!(U3STAHbits.UTXBF == 1))
        {
            U3TXREG = *txHead;
            txHead++;

            if(txHead == &txQueue[UART3_CONFIG_TX_BYTEQ_LENGTH])
            {
                txHead = txQueue;
            }

            // Are we empty?
            if(txHead == txTail)
            {
                break;
            }
        }
    }
}

        /* cppcheck-suppress misra-c2012-8.4
        *
        * (Rule 8.4) REQUIRED: A compatible declaration shall be visible when an object or 
        * function with external linkage is defined
        *
        * Reasoning: Interrupt declaration are provided by compiler and are available
        * outside the driver folder
        */
void __attribute__ ( ( interrupt, no_auto_psv ) ) _U3RXInterrupt(void)
{
    size_t rxQueueSize ;
    uint8_t *rxTailPtr = NULL;
    
    IFS3bits.U3RXIF = 0;
    
    while(!(U3STAHbits.URXBE == 1))
    {
        *rxTail = U3RXREG;

        rxQueueSize = UART3_CONFIG_RX_BYTEQ_LENGTH - 1;
        rxTailPtr = rxTail;
        rxTailPtr++;
        // Will the increment not result in a wrap and not result in a pure collision?
        // This is most often condition so check first
        if ((rxTail != &rxQueue[rxQueueSize]) && (rxTailPtr != rxHead))
        {
            rxTail++;
        } 
        else if ( (rxTail == &rxQueue[rxQueueSize]) &&
                  (rxHead !=  rxQueue) )
        {
            // Pure wrap no collision
            rxTail = rxQueue;
        } 
        else // must be collision
        {
            rxOverflowed = true;
        }
    }
	
    if(NULL != UART3_RxCompleteHandler)
    {
        (*UART3_RxCompleteHandler)();
    }
}

        /* cppcheck-suppress misra-c2012-8.4
        *
        * (Rule 8.4) REQUIRED: A compatible declaration shall be visible when an object or 
        * function with external linkage is defined
        *
        * Reasoning: Interrupt declaration are provided by compiler and are available
        * outside the driver folder
        */
void __attribute__ ( ( interrupt, no_auto_psv ) ) _U3EInterrupt(void)
{
    if (U3STAbits.ABDOVF == 1)
    {
        uartError.status = (uint16_t)(uartError.status | (uint16_t)UART_ERROR_AUTOBAUD_OVERFLOW_MASK);
        U3STAbits.ABDOVF = 0;
    }
    
    if (U3STAbits.TXCIF == 1)
    {
        uartError.status = (uint16_t)(uartError.status | (uint16_t)UART_ERROR_TX_COLLISION_MASK);
        if(NULL != UART3_TxCollisionHandler)
        {
            (*UART3_TxCollisionHandler)();
        }
        
        U3STAbits.TXCIF = 0;
    }
    
    if (U3STAbits.OERR == 1)
    {
        uartError.status = (uint16_t)(uartError.status | (uint16_t)UART_ERROR_RX_OVERRUN_MASK);
        if(NULL != UART3_OverrunErrorHandler)
        {
            (*UART3_OverrunErrorHandler)();
        }
        
        U3STAbits.OERR = 0;
    }
    
    if (U3STAbits.PERR == 1)
    {
        uartError.status = (uint16_t)(uartError.status | (uint16_t)UART_ERROR_PARITY_MASK);
        if(NULL != UART3_ParityErrorHandler)
        {
            (*UART3_ParityErrorHandler)();
        }
    }
    
    if (U3STAbits.FERR == 1)
    {
        uartError.status = (uint16_t)(uartError.status | (uint16_t)UART_ERROR_FRAMING_MASK);
        if(NULL != UART3_FramingErrorHandler)
        {
            (*UART3_FramingErrorHandler)();
        }
    }
        
    IFS3bits.U3EIF = 0;
}

/* ISR for UART Event Interrupt */
        /* cppcheck-suppress misra-c2012-8.4
        *
        * (Rule 8.4) REQUIRED: A compatible declaration shall be visible when an object or 
        * function with external linkage is defined
        *
        * Reasoning: Interrupt declaration are provided by compiler and are available
        * outside the driver folder
        */
void __attribute__ ( ( interrupt, no_auto_psv ) ) _U3EVTInterrupt(void)
{
    U3INTbits.ABDIF = false;
    IFS11bits.U3EVTIF = false;
}
