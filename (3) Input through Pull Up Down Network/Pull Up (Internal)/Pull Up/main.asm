;
; Pull Down.asm
;
; Created: 27-01-2025 12:19:55
; Author : ssart
;


.INCLUDE "M32DEF.INC" 
.ORG 0X0000 
LDI R16,HIGH(RAMEND) 
OUT SPH,R16 
LDI R16,LOW(RAMEND) 
OUT SPL,R16 
SBI DDRC,PINC0 // To show the status through LED 
// Make PORTB0 to work as input pin 
CBI DDRB,PINB0 
// To enable Internal Pull-up network 
SBI PORTB,PINB0 

LDI R17,0x01 
MAIN: CBI PORTC,PINC0 
Loop: IN R16,PINB 
AND R16,R17 
BRNE MAIN 
SBI PORTC,PINC0 
JMP Loop 
