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
#include "arm_can.h"
#include "mcc_generated_files/can/can1.h"
#include "mcc_generated_files/system/pins.h"

volatile uint16_t arm_angle = 0;

/* ---------------------------------------------------------------------------
 * Receive FIFO (FIFO1) message RAM.
 *
 * Each CAN 2.0 receive object with an 8-byte payload occupies:
 *      2 header words (R0 + R1, 32-bit each) = 8 bytes
 *      8 payload bytes
 *      = 16 bytes per message.
 * Timestamping is left disabled, so no timestamp word is inserted.
 * ------------------------------------------------------------------------- */
#define ARM_CAN_RX_FIFO_DEPTH   4U
#define ARM_CAN_RX_OBJ_BYTES    16U

static uint8_t __attribute__((aligned(4)))
    armCanRxFifo[ARM_CAN_RX_FIFO_DEPTH * ARM_CAN_RX_OBJ_BYTES];

/* Receive FIFO object 16-bit word offsets (mirrors the layout the generated
 * CAN1 driver uses when writing the transmit FIFO). */
#define CAN_RX_FIFO_WORD_ID     0U  /* R0: SID<10:0> for a standard frame     */
#define CAN_RX_FIFO_WORD_CTRL   2U  /* R1 low: DLC<3:0>, IDE, RTR, BRS, FDF   */
#define CAN_RX_FIFO_WORD_DATA   4U  /* first payload word (data byte 0 = low) */

void ARM_CAN_Initialize(void)
{
    /* CAN1_Initialize() (called from SYSTEM_Initialize) leaves CAN1 in Normal
     * CAN 2.0 mode with no receive FIFO. Re-enter configuration mode to add a
     * receive FIFO and an acceptance filter for the selected node, then resume
     * normal operation. */
  
    // ChB
    CAN_STBY_SetLow();
    //LATCbits.LATC11 = 0;  // TX pin LOW
    
    if (CAN_OP_MODE_REQUEST_SUCCESS ==
            CAN1_OperationModeSet(CAN_CONFIGURATION_MODE))
    {
        /* Base address of the CAN message-object RAM area. */
        /* cppcheck-suppress misra-c2012-11.4 */
        C1FIFOBAL = (uint16_t) &armCanRxFifo[0];

        /* Configure FIFO1 as a receive FIFO. */
        C1FIFOCON1L = 0x0000U;                          /* TXEN = 0 -> receive */
        C1FIFOCON1Hbits.PLSIZE = 0;                     /* 8-byte payload      */
        C1FIFOCON1Hbits.FSIZE  = ARM_CAN_RX_FIFO_DEPTH - 1U;
        C1FIFOCON1Lbits.FRESET = 1;                     /* reset FIFO to empty */

        /* Acceptance filter 0: match the selected standard node ID exactly. */
        C1FLTOBJ0L = 0x0000U;
        C1FLTOBJ0H = 0x0000U;
        C1FLTOBJ0Lbits.SID  = ARM_CAN_RX_ID;            /* ID to accept        */
        C1FLTOBJ0Hbits.EXIDE = 0;                       /* standard frames     */

        C1MASK0L = 0x0000U;
        C1MASK0H = 0x0000U;
        C1MASK0Lbits.MSID = 0x7FFU;                     /* match all 11 SID bits */
        C1MASK0Hbits.MIDE = 1;                          /* match std/ext (IDE)   */

        /* Route filter 0 hits to FIFO1, then enable the filter. */
        C1FLTCON0Lbits.F0BP   = 1;
        C1FLTCON0Lbits.FLTEN0 = 1;

        /* Resume normal CAN 2.0 operation. */
        (void) CAN1_OperationModeSet(CAN_NORMAL_2_0_MODE);
    }
    
    // ChB
    CAN_STBY_SetLow();
   // LATCbits.LATC11 = 0;  // TX pin LOW
    
}

void ARM_CAN_Tasks(void)
{
    /* TFNRFNIF == 1 on a receive FIFO means "FIFO not empty": a message waits. */
    if (C1FIFOSTA1bits.TFNRFNIF == 1)
    {
        /* C1FIFOUA1L holds the RAM address of the oldest unread message. */
        /* cppcheck-suppress misra-c2012-11.4 */
        const volatile uint16_t *rxFifoObj = (const volatile uint16_t *) C1FIFOUA1L;

        uint8_t dlc = (uint8_t) (rxFifoObj[CAN_RX_FIFO_WORD_CTRL] & 0x000FU);

        if (dlc >= 1U)
        {
            /* First data byte carries the arm angle sent by ctrlBoard2. */
            arm_angle = (uint16_t) (rxFifoObj[CAN_RX_FIFO_WORD_DATA] & 0x00FFU);
        }

        /* Advance the FIFO tail to release this message slot. */
        C1FIFOCON1Lbits.UINC = 1;
    }
}
