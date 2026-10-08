/**
 * CAN1 Generated Driver Source File
 * 
 * @file      can1.c
 *            
 * @ingroup   candriver
 *            
 * @brief     This is the generated driver source file for CAN1 driver using CCL
 *            
 * @skipline @version   Firmware Driver Version 1.3.1
 *
 * @skipline @version   PLIB Version 1.7.5
 *            
 * @skipline  Device : dsPIC33CK1024MP710
*/

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

// Section: Included Files

#include <string.h>
#include "../can_types.h"    
#include "../can1.h"

// CAN Message object arbitration field information
#define CAN_MSG_OBJ_DLC_FIELD_SIZE          0xFU
#define CAN_MSG_OBJ_ID_TYPE_FIELD_POS       0x10U
#define CAN_MSG_OBJ_ID_TYPE_SHIFT_POS       0x4U
#define CAN_MSG_OBJ_RTR_SHIFT_POS           0x5U
#define CAN_MSG_OBJ_RTR_FIELD_POS           0x20U
#define CAN_MSG_OBJ_FRAME_TYPE_FIELD_POS    0x20U
#define CAN_MSG_OBJ_FRAME_TYPE_SHIFT_POS    0x5U
#define CAN_MSG_OBJ_BRS_FIELD_POS           0x40U
#define CAN_MSG_OBJ_BRS_SHIFT_POS           0x6U
#define CAN_MSG_OBJ_FORMAT_TYPE_FIELD_POS   0x80U
#define CAN_MSG_OBJ_FORMAT_TYPE_SHIFT_POS   0x7U
#define CAN_STD_MSG_ID_MAX_SIZE             0x7FFU
#define CAN_MSG_OBJ_SID_SHIFT_POS           0x12U
#define CAN_EXT_MSG_ID_HIGH_MAX_SIZE        0x1FFFU
#define CAN_EXT_MSG_ID_LOW_MAX_SIZE         0x1FU
#define CAN_MSG_OBJ_EID_LOW_SHIFT_POS       0xBU
#define CAN_MSG_OBJ_EID_HIGH_SHIFT_POS      0x5U

// Section: Driver Interface
const struct CAN_INTERFACE CAN1 = {
    .Initialize = CAN1_Initialize,
    .Deinitialize = CAN1_Deinitialize,
    .OperationModeSet = CAN1_OperationModeSet,
    .OperationModeGet = CAN1_OperationModeGet,
    .IsBusOff = CAN1_IsBusOff,
    .SleepMode = CAN1_Sleep,
    .Transmit = CAN1_Transmit,
    .TransmitFIFOStatusGet = CAN1_TransmitFIFOStatusGet,
    .IsTxErrorActive = CAN1_IsTxErrorActive,
    .IsTxErrorPassive = CAN1_IsTxErrorPassive,
    .IsTxErrorWarning = CAN1_IsTxErrorWarning,
    .Receive = NULL,
    .ReceiveMessageGet = NULL,
    .IsRxErrorPassive = NULL,
    .IsRxErrorWarning = NULL,
    .IsRxErrorActive = NULL,
    .ReceivedMessageCountGet = NULL,
    .InvalidMessageCallbackRegister = &CAN1_InvalidMessageCallbackRegister,
    .BusWakeUpActivityCallbackRegister = &CAN1_BusWakeUpActivityCallbackRegister,
    .BusErrorCallbackRegister = &CAN1_BusErrorCallbackRegister,
    .ModeChangeCallbackRegister = &CAN1_ModeChangeCallbackRegister,
    .SystemErrorCallbackRegister = &CAN1_SystemErrorCallbackRegister,
    .TxAttemptCallbackRegister = NULL,
    .RxBufferOverFlowCallbackRegister = NULL,
    .Tasks = NULL
};

// Section: Private Variable Definitions

// TX FIFO 1 message RAM: 4 messages × (T0 + T1 + 8 bytes data) = 64 bytes
// PLSIZE=0 (8 bytes), FSIZE=3 (4 messages deep)
static uint32_t can1_msg_ram[16U] __attribute__((aligned(4)));

// CAN Default Callback Handler
static void (*CAN1_InvalidMessageHandler)(void) = NULL;
static void (*CAN1_BusWakeUpActivityHandler)(void) = NULL;
static void (*CAN1_BusErrorHandler)(void) = NULL;
static void (*CAN1_ModeChangeHandler)(void) = NULL;
static void (*CAN1_SystemErrorHandler)(void) = NULL;

/**
 @ingroup  candriver
 @struct   CAN1 FIFO parameters information data structure
 @brief    This Data structure is to implement a CAN FIFO parameters information
*/
struct CAN1_FIFO_INFO
{
    uint8_t payloadSize;
    uint8_t msgDeepSize;
    uint16_t *address;
};

// Section: Private Function Definitions

/**
 @ingroup  candriver
 @static   Configure the CAN1 bit rate settings
 @brief    This function configure the CAN1 bit rate settings
*/
static void CAN1_BitRateConfiguration(void)
{
    // BRP 0; TSEG1 126; 
    C1NBTCFGH = 0x7EU;
    // SJW 31; TSEG2 31; 
    C1NBTCFGL = 0x1F1FU;
}

/**
 @ingroup  candriver
 @static   Enable the CAN1 Error Notification interrupt
 @brief    This function enables the CAN1  error notification  interrupt
*/
static void CAN1_ErrorNotificationEnable(void)
{
    // CAN1 CAN1 Callback initialize
    CAN1_InvalidMessageCallbackRegister(&CAN1_InvalidMessageCallback);
    CAN1_BusWakeUpActivityCallbackRegister(&CAN1_BusWakeUpActivityCallback);
    CAN1_BusErrorCallbackRegister(&CAN1_BusErrorCallback);
    CAN1_ModeChangeCallbackRegister(&CAN1_ModeChangeCallback);
    CAN1_SystemErrorCallbackRegister(&CAN1_SystemErrorCallback);

    // Clear the interrupt flags
    IFS1bits.C1IF = 0; // CAN Info Interrupt flag
    
    // IVMIF disabled; WAKIF disabled; CERRIF disabled; SERRIF disabled; TBCIF disabled; MODIF disabled; 
    C1INTL = 0x0U;
    // IVMIE enabled; TEFIE disabled; RXOVIE enabled; RXIE disabled; WAKIE enabled; TXIE disabled; CERRIE enabled; SERRIE enabled; MODIE enabled; TXATIE enabled; TBCIE disabled; 
    C1INTH = 0xFC08U;

    IEC1bits.C1IE = 1; // CAN Info Interrupt Enable bit   
}

// Section: Driver Interface Function Definitions
void CAN1_Initialize(void)
{
    /* Enable the CAN1 module */
    C1CONLbits.CON = 1;
    
    // RTXAT disabled; ESIGM disabled; TXBWS No delay; STEF disabled; SERRLOM disabled; ABAT disabled; REQOP Configuration mode; TXQEN disabled; 
    C1CONH = 0x480U;  

    /* Place CAN1 module in configuration mode */
    if(CAN_OP_MODE_REQUEST_SUCCESS == CAN1_OperationModeSet(CAN_CONFIGURATION_MODE))
    {
        
        // BRSDIS enabled; CON enabled; WAKFIL enabled; WFT T11 Filter; ISOCRCEN enabled; SIDL disabled; DNCNT 0x0; PXEDIS enabled; CLKSEL disabled; 
        C1CONL = 0x9760U;
    
        // Disabled CAN1 Store in Transmit Event FIFO bit
        C1CONHbits.STEF = 0;
        // Disabled CAN1 Transmit Queue bit
        C1CONHbits.TXQEN = 0;
        
        /* configure CAN1 Bit rate settings */
        CAN1_BitRateConfiguration();

        /* Configure FIFO 1 as TX FIFO: 4 messages deep, 8-byte payload, unlimited retransmit */
        C1FIFOCON1Lbits.TXEN   = 1U;
        C1FIFOCON1Hbits.FSIZE  = 3U;   // 4 message objects (FSIZE+1)
        C1FIFOCON1Hbits.PLSIZE = 0U;   // 8-byte payload
        C1FIFOCON1Hbits.TXAT   = 3U;   // unlimited TX attempts

        /* Set FIFO base address to allocated message RAM */
        C1FIFOBAL = (uint16_t)(uintptr_t)can1_msg_ram;
        C1FIFOBAH = 0U;

        /* CAN Error Notification */
        CAN1_ErrorNotificationEnable();
        
        /* Place CAN1 module in Normal Operation mode */
        (void)CAN1_OperationModeSet(CAN_NORMAL_2_0_MODE);
    }
}

void CAN1_Deinitialize(void)
{
    /* Place CAN1 module in configuration mode */
    if(CAN_OP_MODE_REQUEST_SUCCESS == CAN1_OperationModeSet(CAN_CONFIGURATION_MODE))
    {        
        C1CONL = 0x760;  
        C1CONH = 0x498;  
           
        /* Reset bit rate settings to POR*/
        C1NBTCFGH = 0x3E;
        C1NBTCFGL = 0xF0F;

        /* CAN Error Notification */
        // Clear the interrupt flags
        IFS1bits.C1IF = 0; // CAN Info Interrupt flag
        // IVMIF disabled; WAKIF disabled; CERRIF disabled; SERRIF disabled; TBCIF disabled; MODIF disabled; 
        C1INTL = 0x0;
        // IVMIE enabled; TEFIE disabled; RXOVIE enabled; RXIE disabled; WAKIE enabled; TXIE disabled; CERRIE enabled; SERRIE enabled; MODIE enabled; TXATIE enabled; TBCIE disabled; 
        C1INTH = 0x0;

        IEC1bits.C1IE = 0; // CAN Info Interrupt Enable bit   
    }
    
    /* Disable the CAN1 module */
    C1CONLbits.CON = 0;
}

enum CAN_OP_MODE_STATUS CAN1_OperationModeSet(const enum CAN_OP_MODES requestMode) 
{
    enum CAN_OP_MODE_STATUS status = CAN_OP_MODE_REQUEST_SUCCESS;
    
    if((CAN_CONFIGURATION_MODE == CAN1_OperationModeGet()) || (requestMode == CAN_DISABLE_MODE)
            || (requestMode == CAN_CONFIGURATION_MODE))
    {
        C1CONHbits.REQOP = requestMode;

        while(C1CONHbits.OPMOD != requestMode) 
        {
            // This condition is avoiding the system error case endless loop
            if(C1INTLbits.SERRIF == 1)
            {
                status = CAN_OP_MODE_SYS_ERROR_OCCURED;
                break;
            }
        }
    }
    else
    {
        status = CAN_OP_MODE_REQUEST_FAIL;
    }
    
    return status;
}

enum CAN_OP_MODES CAN1_OperationModeGet(void) 
{
    return C1CONHbits.OPMOD;
}

bool CAN1_IsBusOff(void)
{
    return C1TRECHbits.TXBO;
}

void CAN1_Sleep(void)
{
    C1INTLbits.WAKIF = 0;
    C1INTHbits.WAKIE = 1;
    
    
    /* put the module in disable mode */
   (void)CAN1_OperationModeSet(CAN_DISABLE_MODE);
}

void CAN1_InvalidMessageCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        CAN1_InvalidMessageHandler = handler;
    }
}

void __attribute__ ((weak)) CAN1_InvalidMessageCallback ( void )
{ 

} 

void CAN1_BusWakeUpActivityCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        CAN1_BusWakeUpActivityHandler = handler;
    }
}

void __attribute__ ((weak)) CAN1_BusWakeUpActivityCallback ( void )
{ 

} 

void CAN1_BusErrorCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        CAN1_BusErrorHandler = handler;
    }
}

void __attribute__ ((weak)) CAN1_BusErrorCallback ( void )
{ 

} 

void CAN1_ModeChangeCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        CAN1_ModeChangeHandler = handler;
    }
}

void __attribute__ ((weak)) CAN1_ModeChangeCallback ( void )
{ 

} 

void CAN1_SystemErrorCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        CAN1_SystemErrorHandler = handler;
    }
}

void __attribute__ ((weak)) CAN1_SystemErrorCallback ( void )
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
void __attribute__((__interrupt__, no_auto_psv)) _C1Interrupt(void)
{
    if(1 == C1INTLbits.IVMIF)
    {
        if(CAN1_InvalidMessageHandler != NULL)
        {
            CAN1_InvalidMessageHandler();
        }
       
        C1INTLbits.IVMIF = 0;
    }
    
    if(1 == C1INTLbits.WAKIF)
    {
        if(CAN1_BusWakeUpActivityHandler != NULL)
        {
            CAN1_BusWakeUpActivityHandler();
        }
       
        C1INTLbits.WAKIF = 0;
    }
    
    if(1 == C1INTLbits.CERRIF)
    {
        if(CAN1_BusErrorHandler != NULL)
        {
            CAN1_BusErrorHandler();
        }
       
        C1INTLbits.CERRIF = 0;
    }
    
    if(1 == C1INTLbits.MODIF)
    {
        if(CAN1_ModeChangeHandler != NULL)
        {
            CAN1_ModeChangeHandler();
        }
       
        C1INTLbits.MODIF = 0;
    }
    
    if(1 == C1INTLbits.SERRIF)
    {
        if(CAN1_SystemErrorHandler != NULL)
        {
            CAN1_SystemErrorHandler();
        }
       
        C1INTLbits.SERRIF = 0;
    }
    
    IFS1bits.C1IF = 0;
}

enum CAN_TX_MSG_REQUEST_STATUS CAN1_Transmit(const unsigned fifoChannel, struct CAN_MSG_OBJ *txCanMsg)
{
    volatile uint32_t *txMsgObj;
    uint8_t dlcBytes;

    (void)fifoChannel;  // only FIFO 1 is configured; caller passes 1

    if (C1FIFOSTA1bits.TFNRFNIF == 0U)
    {
        return CAN_TX_MSG_REQUEST_FIFO_FULL;
    }

    // Hardware updates C1FIFOUA1L to point to the next available message object
    txMsgObj = (volatile uint32_t *)(uintptr_t)C1FIFOUA1L;

    // T0: pack message ID
    if (txCanMsg->field.idType == CAN_FRAME_EXT)
    {
        // Extended: upper 11 bits (EID[28:18]) into T0[28:18], lower 18 bits into T0[17:0]
        txMsgObj[0] = ((txCanMsg->msgId >> 18U) << CAN_MSG_OBJ_SID_SHIFT_POS) |
                      (txCanMsg->msgId & 0x3FFFFU);
    }
    else
    {
        // Standard: SID[10:0] into T0[28:18]
        txMsgObj[0] = (txCanMsg->msgId & CAN_STD_MSG_ID_MAX_SIZE) << CAN_MSG_OBJ_SID_SHIFT_POS;
    }

    // T1: control fields
    txMsgObj[1] = ((uint32_t)txCanMsg->field.dlc       & CAN_MSG_OBJ_DLC_FIELD_SIZE) |
                  ((uint32_t)txCanMsg->field.idType     << CAN_MSG_OBJ_ID_TYPE_SHIFT_POS) |
                  ((uint32_t)txCanMsg->field.frameType  << CAN_MSG_OBJ_FRAME_TYPE_SHIFT_POS) |
                  ((uint32_t)txCanMsg->field.brs        << CAN_MSG_OBJ_BRS_SHIFT_POS) |
                  ((uint32_t)txCanMsg->field.formatType << CAN_MSG_OBJ_FORMAT_TYPE_SHIFT_POS);

    // Payload (DLC enum values 0-8 map 1:1 to byte count for CAN 2.0)
    dlcBytes = (uint8_t)txCanMsg->field.dlc;
    if (dlcBytes > 8U)
    {
        dlcBytes = 8U;
    }
    if ((txCanMsg->data != NULL) && (dlcBytes > 0U))
    {
        memcpy((void *)&txMsgObj[2], txCanMsg->data, dlcBytes);
    }

    // Advance FIFO head and request transmission
    C1FIFOCON1Lbits.UINC  = 1U;
    C1FIFOCON1Lbits.TXREQ = 1U;

    return CAN_TX_MSG_REQUEST_SUCCESS;
}

enum CAN_TX_FIFO_STATUS CAN1_TransmitFIFOStatusGet(const unsigned fifoChannel)
{
    (void)fifoChannel;
    return (C1FIFOSTA1bits.TFNRFNIF != 0U) ? CAN_TX_FIFO_AVAILABLE : CAN_TX_FIFO_FULL;
}

bool CAN1_IsTxErrorActive(void)
{
    return (C1TRECHbits.TXWARN == 0U) && (C1TRECHbits.TXBP == 0U) && (C1TRECHbits.TXBO == 0U);
}

bool CAN1_IsTxErrorPassive(void)
{
    return (bool)C1TRECHbits.TXBP;
}

bool CAN1_IsTxErrorWarning(void)
{
    return (bool)C1TRECHbits.TXWARN;
}

/**
 End of File
*/


