 /**
 * PINS Generated Driver Source File 
 * 
 * @file      pins.c
 *            
 * @ingroup   pinsdriver
 *            
 * @brief     This is the generated driver source file for PINS driver.
 *
 * @skipline @version   Firmware Driver Version 1.0.2
 *
 * @skipline @version   PLIB Version 1.4.1
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

// Section: Includes
#include <xc.h>
#include <stddef.h>
#include "../pins.h"

// Section: File specific functions

// Section: Driver Interface Function Definitions
void PINS_Initialize(void)
{
    /****************************************************************************
     * Setting the Output Latch SFR(s)
     ***************************************************************************/
    LATA = 0x0100U;
    LATB = 0x0000U;
    LATC = 0x0000U;
    LATD = 0x0000U;
    LATE = 0x0000U;
    LATF = 0x0000U;

    /****************************************************************************
     * Setting the GPIO Direction SFR(s)
     ***************************************************************************/
    TRISA = 0x00FFU;
    TRISB = 0xFFFFU;
    TRISC = 0x7FF7U;
    TRISD = 0x7FFFU;
    TRISE = 0xFC3FU;
    TRISF = 0xF7FFU;


    /****************************************************************************
     * Setting the Weak Pull Up and Weak Pull Down SFR(s)
     ***************************************************************************/
    CNPUA = 0x0000U;
    CNPUB = 0x0000U;
    CNPUC = 0x0000U;
    CNPUD = 0x0000U;
    CNPUE = 0x0000U;
    CNPUF = 0x0000U;
    CNPDA = 0x0001U;
    CNPDB = 0x0000U;
    CNPDC = 0x0000U;
    CNPDD = 0x0000U;
    CNPDE = 0x0000U;
    CNPDF = 0x0000U;


    /****************************************************************************
     * Setting the Open Drain SFR(s)
     ***************************************************************************/
    ODCA = 0x0000U;
    ODCB = 0x0000U;
    ODCC = 0x0000U;
    ODCD = 0x0000U;
    ODCE = 0x0000U;
    ODCF = 0x0000U;


    /****************************************************************************
     * Setting the Analog/Digital Configuration SFR(s)
     ***************************************************************************/
    ANSELA = 0x001FU;
    ANSELB = 0x039FU;
    ANSELC = 0x0081U;
    ANSELD = 0x2C00U;
    ANSELE = 0x000FU;
    ANSELF = 0x03C0U;

    /****************************************************************************
     * Set the PPS
     ***************************************************************************/
     __builtin_write_RPCON(0x0000); // unlock PPS

        RPINR20bits.SCK1R = 0x0031U; //RC1->SPI1:SCK1IN;
        RPINR20bits.SDI1R = 0x0032U; //RC2->SPI1:SDI1;
        RPINR21bits.SS1R = 0x0036U; //RC6->SPI1:SS1;
        RPINR26bits.CAN1RXR = 0x003EU; //RC14->CAN1:CAN1RX;
        RPINR18bits.U1RXR = 0x002DU; //RB13->UART1:U1RX;
        RPOR9bits.RP51R = 0x0005U;  //RC3->SPI1:SDO1;
        RPOR15bits.RP63R = 0x0015U;  //RC15->CAN1:CAN1TX;
        RPOR33bits.RP99R = 0x0001U;  //RA8->UART1:U1TX;

     __builtin_write_RPCON(0x0800); // lock PPS


}

