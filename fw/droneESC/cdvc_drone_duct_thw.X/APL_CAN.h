/*
 * arm_can.h
 *
 * Receives the CAN message transmitted by the control board (ctrlBoard2) and
 * exposes the payload as the global variable arm_angle.
 *
 * ctrlBoard2 transmits two standard-ID CAN 2.0 data frames, one per node:
 *      Node 1 -> CAN ID 0x001 (1 data byte)
 *      Node 2 -> CAN ID 0x002 (1 data byte)
 *
 * This ESC listens to exactly one of those nodes, selected below.
 */

#ifndef APL_CAN_H
#define APL_CAN_H

#include <stdint.h>

/* ---------------------------------------------------------------------------
 * Node selection: set to 1 to receive node 1 (CAN ID 0x001),
 *                 set to 2 to receive node 2 (CAN ID 0x002).
 * ------------------------------------------------------------------------- */
#define ARM_CAN_NODE    1

#if (ARM_CAN_NODE == 1)
    #define ARM_CAN_RX_ID   0x001U
#elif (ARM_CAN_NODE == 2)
    #define ARM_CAN_RX_ID   0x002U
#else
    #error "ARM_CAN_NODE must be 1 or 2"
#endif

/* Latest arm angle received over CAN from the selected node.
 * Holds the single data byte (0..255) sent by ctrlBoard2. */
extern volatile uint16_t arm_angle;

/*
 * Polls the receive FIFO and, when a frame from the selected node is present,
 * copies its first data byte into arm_angle. Call periodically from the main
 * loop.
 */
extern void ARM_CAN_Tasks(void);

extern void APL_ATA6563DisableToSleep(void);

extern void APL_ATA6563Enable(void);


#endif /* ARM_CAN_H */
