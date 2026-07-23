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

#include <string.h>
#include "../can_types.h"    
#include "../can1.h"

// CAN Bus FIFO Memory information
#define CAN1_FIFO_ALLOCATE_RAM_SIZE    32U // CAN FIFO allocated ram size based on (number of FIFO x FIFO message Payload size x Message object DLC size)

// CAN Bus Transmit FIFO Memory information
#define CAN1_TX_MSG_SEND_REQ_BIT_POS   0x200U // CAN FIFO TX Message Send Request bit 
#define CAN1_TX_INC_FIFO_PTR_BIT_POS   0x100U // CAN FIFO Increment Head/Tail bit
#define CAN_TX_FIFO_WORD_0      0
#define CAN_TX_FIFO_WORD_1      1
#define CAN_TX_FIFO_WORD_2      2
#define CAN_TX_FIFO_WORD_4      4

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
    .TxAttemptCallbackRegister = &CAN1_TxAttemptCallbackRegister,
    .RxBufferOverFlowCallbackRegister = NULL,
    .Tasks = NULL
};

// Section: Private Variable Definitions
// Start CAN Message Memory Base Address
static uint8_t __attribute__((aligned(4)))can1FifoMsg[CAN1_FIFO_ALLOCATE_RAM_SIZE];

// CAN Default Callback Handler
static void (*CAN1_InvalidMessageHandler)(void) = NULL;
static void (*CAN1_BusWakeUpActivityHandler)(void) = NULL;
static void (*CAN1_BusErrorHandler)(void) = NULL;
static void (*CAN1_ModeChangeHandler)(void) = NULL;
static void (*CAN1_SystemErrorHandler)(void) = NULL;
static void (*CAN1_TxAttemptHandler)(void) = NULL;

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
 @static   Get the DLC enum based decimal value
 @brief    This function get the DLC enum based decimal value
*/
static uint8_t CAN1_DlcToDataBytesGet(const enum CAN_DLC dlc)
{
    static const uint8_t dlcByteSize[] = {0U, 1U, 2U, 3U, 4U, 5U, 6U, 7U, 8U};
    return dlcByteSize[dlc];
}

/**
 @ingroup  candriver
 @static   Get the FIFO user address, message depth and payload size information
 @brief    This function get the FIFO user address, message depth and payload size
           information.
*/

static void CAN1_FIFO_InfoGet(const uint8_t fifoNum, volatile struct CAN1_FIFO_INFO *fifoInfo)
{   
    switch (fifoNum) 
    {
        case CAN1_TXQ:
            fifoInfo->address = (uint16_t *) &C1TXQUAL;
            fifoInfo->payloadSize = 8U;
            fifoInfo->msgDeepSize = 2U;
            break;
     
        default:
            fifoInfo->address = NULL;
            fifoInfo->payloadSize = 0U;
            fifoInfo->msgDeepSize = 0U;
            break;
    }
}

/**
 @ingroup  candriver
 @static   Enable the transmit FIFO message send request bit
 @brief    This function enables The FIFO transmit message send request bit
*/
static void CAN1_TX_FIFO_MessageSendRequest(const enum CAN1_TX_FIFO_CHANNELS fifoChannel)
{   
    switch (fifoChannel) 
    {           
        case CAN1_TXQ:
            // Update the CAN1_TXQ message pointer; Set TXREQ bit
            C1TXQCONL = (C1TXQCONL | (CAN1_TX_MSG_SEND_REQ_BIT_POS | CAN1_TX_INC_FIFO_PTR_BIT_POS));
            break;

        default:
            break;
    }      
}

/**
 @ingroup  candriver
 @static   Read the message object from user input and update to the CAN1 TX FIFO
 @brief    This function Read the message object from user input and update
           to the CAN1 TX FIFO.
*/
static void CAN1_MessageWriteToFifo(uint16_t *txFifoObj, struct CAN_MSG_OBJ *txCanMsg)
{
    /*
    Transmit FIFO Object format:
    
    Transmit FIFO WORD_0:    |15:8|| EID<4:0>          | SID<10:8>              ||
                             | 7:0||           SID<7:0>                         ||
                             
    Transmit FIFO WORD_1:    |15:8|| SID<11>           | EID<17:13>             ||
                             | 7:0|| EID<12:5>                                  ||
                             
    Transmit FIFO WORD_2:    |15:8||Sequence<6:0>(Not implemented) |  ESI<1>    ||
                             | 7:0||FDF<1> | BRS<1> | RTR<1> | IDE<1> | DLC<3:0>||
                             
    Transmit FIFO WORD_3:    |15:8||Sequence<22:15>(Not implemented)            ||
                             | 7:0||Sequence<14:7>(Not implemented)             ||
                          
    Transmit FIFO WORD_4 to  |15:8|| Transmit Data Byte 1,3,5.. n               ||
    Transmit FIFO WORD_n:    | 7:0|| Transmit Data Byte 0,2,4.. n-1             ||
    */
    
    uint8_t dlcByteSize = 0;

    /* message is standard identifier */
    if(txCanMsg->field.idType == (uint8_t) CAN_FRAME_STD) 
    {
        // SID <10:0>
        txFifoObj[CAN_TX_FIFO_WORD_0] = (txCanMsg->msgId & CAN_STD_MSG_ID_MAX_SIZE);
    } 
    else 
    {
        /* message is extended identifier */
        // SID <10:0> and EID <4:0>
        txFifoObj[CAN_TX_FIFO_WORD_0] = (((txCanMsg->msgId >> CAN_MSG_OBJ_SID_SHIFT_POS) & CAN_STD_MSG_ID_MAX_SIZE) | 
                        (txCanMsg->msgId & CAN_EXT_MSG_ID_LOW_MAX_SIZE) << CAN_MSG_OBJ_EID_LOW_SHIFT_POS);

        // EID <5:17>
        txFifoObj[CAN_TX_FIFO_WORD_1] = ((txCanMsg->msgId >>  CAN_MSG_OBJ_EID_HIGH_SHIFT_POS) & CAN_EXT_MSG_ID_HIGH_MAX_SIZE);
    }

    // DLC <3:0>, IDE <1>, RTR <1>, BRS <1>, FDF <1> 
    txFifoObj[CAN_TX_FIFO_WORD_2] = (txCanMsg->field.dlc & CAN_MSG_OBJ_DLC_FIELD_SIZE) | 
                    ((txCanMsg->field.idType << CAN_MSG_OBJ_ID_TYPE_SHIFT_POS) & CAN_MSG_OBJ_ID_TYPE_FIELD_POS) | 
                    ((txCanMsg->field.frameType << CAN_MSG_OBJ_FRAME_TYPE_SHIFT_POS) & CAN_MSG_OBJ_FRAME_TYPE_FIELD_POS) | 
                    ((txCanMsg->field.brs << CAN_MSG_OBJ_BRS_SHIFT_POS) & CAN_MSG_OBJ_BRS_FIELD_POS) | 
                    ((txCanMsg->field.formatType << CAN_MSG_OBJ_FORMAT_TYPE_SHIFT_POS) & CAN_MSG_OBJ_FORMAT_TYPE_FIELD_POS);
        
    // Data frame message
    if(txCanMsg->field.frameType == (uint8_t) CAN_FRAME_DATA)
    {
        dlcByteSize = CAN1_DlcToDataBytesGet(txCanMsg->field.dlc);

        // Coping TX message object to FIFO
        (void)memcpy((uint8_t*)(&txFifoObj[CAN_TX_FIFO_WORD_4]), txCanMsg->data, dlcByteSize);
    } 
    // RTR frame message
    else
    {
        txFifoObj[CAN_TX_FIFO_WORD_2] = txFifoObj[CAN_TX_FIFO_WORD_2] | (((bool) 1 << CAN_MSG_OBJ_RTR_SHIFT_POS) & CAN_MSG_OBJ_RTR_FIELD_POS);
    }
}

/**
 @ingroup  candriver
 @static   Configure the CAN1 transmit FIFO settings
 @brief    This function configure the CAN1 transmit FIFO settings
*/
static void CAN1_TX_FIFO_Configuration(void)
{
    // TXAT Unlimited attempts; PLSIZE 8; FSIZE 2; TXPRI 0; 
    C1TXQCONH = 0x140U;
    // TXQEIE disabled; TXREQ disabled; TXQNIE disabled; TXATIE enabled; UINC disabled; FRESET enabled; 
    C1TXQCONL = 0x490U;
}

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
    CAN1_TxAttemptCallbackRegister(&CAN1_TxAttemptCallback);

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
    
    // RTXAT disabled; ESIGM disabled; TXBWS No delay; STEF disabled; SERRLOM disabled; ABAT disabled; REQOP Configuration mode; TXQEN enabled; 
    C1CONH = 0x490U;  

    /* Place CAN1 module in configuration mode */
    if(CAN_OP_MODE_REQUEST_SUCCESS == CAN1_OperationModeSet(CAN_CONFIGURATION_MODE))
    {
        /* Initialize the C1FIFOBAL with the start address of the CAN1 FIFO message object area. */
        /* cppcheck-suppress misra-c2012-11.4
        * Assigning an array pointer to CAN FIFO Address register
        */
        C1FIFOBAL = (uint16_t) &can1FifoMsg[0];
        
        // BRSDIS enabled; CON enabled; WAKFIL enabled; WFT T11 Filter; ISOCRCEN enabled; SIDL disabled; DNCNT 0x0; PXEDIS enabled; CLKSEL disabled; 
        C1CONL = 0x9760U;
    
        // Disabled CAN1 Store in Transmit Event FIFO bit
        C1CONHbits.STEF = 0;
        // Enabled CAN1 Transmit Queue bit
        C1CONHbits.TXQEN = 1;
        
        /* configure CAN1 Bit rate settings */
        CAN1_BitRateConfiguration();        
        
        /* configure CAN1 FIFO settings */
        CAN1_TX_FIFO_Configuration();

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
        
        /* configure CAN1 FIFO settings */
        /* Reset TX FIFO settings to POR*/
        C1TXQCONH = 0x60;
        C1TXQCONL = 0x480;

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

enum CAN_TX_MSG_REQUEST_STATUS CAN1_Transmit(const enum CAN1_TX_FIFO_CHANNELS fifoChannel, struct CAN_MSG_OBJ *txCanMsg)
{
    volatile struct CAN1_FIFO_INFO fifoInfo;
    CAN1_FIFO_InfoGet(fifoChannel, &fifoInfo);
    enum CAN_TX_MSG_REQUEST_STATUS txMsgStatus = CAN_TX_MSG_REQUEST_SUCCESS;
    
    // If CAN module is configured in Non-BRS mode and TX message object has BRS set
    if((txCanMsg->field.brs == (bool) 1) && (C1CONLbits.BRSDIS == (bool) 1))
    {
        txMsgStatus |= CAN_TX_MSG_REQUEST_BRS_ERROR;
    }
    
    // If CAN 2.0 mode, Tx Message object has more than 8 bytes of DLC Size
    // CAN 2.0 mode DLC supports upto 8 byte 
    if(txCanMsg->field.dlc > (uint8_t) DLC_8) 
    {
       txMsgStatus |= CAN_TX_MSG_REQUEST_DLC_EXCEED_ERROR;
    }
    
    // If any CAN TX message object has DLC size more than CAN TX FIFO Payload size
    if(CAN1_DlcToDataBytesGet(txCanMsg->field.dlc) > fifoInfo.payloadSize) 
    {
        txMsgStatus |= CAN_TX_MSG_REQUEST_DLC_EXCEED_ERROR;
    }
    
    if(CAN_TX_MSG_REQUEST_SUCCESS == txMsgStatus)
    {
        if(CAN_TX_FIFO_AVAILABLE == CAN1_TransmitFIFOStatusGet(fifoChannel))
        {
            if((uint16_t *)(*(fifoInfo.address)) != NULL) 
            {
                /* cppcheck-suppress misra-c2012-11.4
                * Parsing CAN Message object location address
                */
                CAN1_MessageWriteToFifo((uint16_t *) *fifoInfo.address, txCanMsg);
                CAN1_TX_FIFO_MessageSendRequest(fifoChannel);
            }         
        }
        else
        {
            txMsgStatus |= CAN_TX_MSG_REQUEST_FIFO_FULL;
        }
    }

    return txMsgStatus;
}

enum CAN_TX_FIFO_STATUS CAN1_TransmitFIFOStatusGet(const enum CAN1_TX_FIFO_CHANNELS fifoChannel)
{
    enum CAN_TX_FIFO_STATUS fifoStatus;
    
    switch (fifoChannel) 
    {
        case CAN1_TXQ:
            fifoStatus = ((C1TXQSTA & 0x1) ? CAN_TX_FIFO_AVAILABLE:CAN_TX_FIFO_FULL);
            break;
            
        default:
            fifoStatus = CAN_TX_FIFO_FULL;
            break;
    }
    
    return fifoStatus;
}

bool CAN1_IsBusOff(void)
{
    return C1TRECHbits.TXBO;
}

bool CAN1_IsTxErrorPassive(void) 
{
    return C1TRECHbits.TXBP;
}

bool CAN1_IsTxErrorWarning(void) 
{
    return C1TRECHbits.TXWARN;
}

bool CAN1_IsTxErrorActive(void)
{
    bool errorState = false;
    if((0 < C1TRECLbits.TERRCNT) && (C1TRECLbits.TERRCNT < 128)) 
    {
        errorState = true;
    }
    
    return errorState;
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

void CAN1_TxAttemptCallbackRegister(void (*handler)(void))
{
    if(NULL != handler)
    {
        CAN1_TxAttemptHandler = handler;
    }
}

void __attribute__ ((weak)) CAN1_TxAttemptCallback(void)
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
    
    if(1 == C1INTLbits.TXATIF)
    {
        if(CAN1_TxAttemptHandler != NULL)
        {
            CAN1_TxAttemptHandler();
        }
    }
    
    IFS1bits.C1IF = 0;
}

/**
 End of File
*/


