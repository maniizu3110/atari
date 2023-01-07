;---1
    processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    LDA #$82 ; Load the A register with the literal hexadecimal value $82
    LDX #82  ; Load the X register with the literal decimal value 82
    LDY $82  ; Load the Y register with the value that is inside memory position $82

    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE

;---2
    processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    LDA #$A ; Load the A register with the hexadecimal value $A
    LDX #%111111 ; Load the X register with the binary value %11111111
    STA $80 ; Store the value in the A register into memory address $80
    STX $81 ; Store the value in the X register into memory address $81
    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE


    ; Exercise 3
    processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    LDA #15 ; Load the A register with the literal decimal value 15
    TAX ; Transfer the value from A to X
    ; Transfer the value from A to Y
    ; Transfer the value from X to A
    ; Transfer the value from Y to A
    ; Load X with the decimal value 6
    ; Transfer the value from X to Y
    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE

Exercise 4
This exercise is about adding and subtracting values. Adding and subtracting are math
operations that are done by the processor ALU (arithmetic-logic-unit). Since the ALU
can only manipulate values from the (A)ccumulator, all these additions and subtractions
must be performed with the values in the A register.

    processor 6502
    seg Code ; Define a new segment named "Code"
    org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
; TODO:
    LDA #100; Load the A register with the literal decimal value 100
    ADC #5; Add the decimal value 5 to the accumulator
    SBC #10  ; Subtract the decimal value 10 from the accumulator
    ; Register A should now contain the decimal 95 (or $5F in hexadecimal)
    org $FFFC ; End the ROM by adding required values to memory position $FFFC
    .word Start ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start ; Put 2 bytes with the break address at memory position $FFFE
Exercise 5
The ADC and SBC instructions can also be used with different addressing modes. The
above exercise used ADC with immediate mode (adding a literal value directly into the
accumulator), but we can also ask ADC to add a value from a (zero page) memory
position into the accumulator.
processor 6502
seg Code ; Define a new segment named "Code"
org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
; TODO:
    LDA #$A ; Load the A register with the hexadecimal value $A
    LDX %1010; Load the X register with the binary value %1010
    STA $80 ; Store the value in the A register into (zero page) memory address $80
    STX $81 ; Store the value in the X register into (zero page) memory address $81
    LDA #10 ; Load A with the decimal value 10
    ADC $80; Add to A the value inside RAM address $80
    ADC $81; Add to A the value inside RAM address $81
    ; A should contain (#10 + $A + %1010) = #30 (or $1E in hexadecimal)
    ; Store the value of A into RAM position $82
org $FFFC ; End the ROM by adding required values to memory position $FFFC
.word Start ; Put 2 bytes with the reset address at memory position $FFFC
.word Start ; Put 2 bytes with the break address at memory position $FFFE
Exercise 6
This exercise covers the increment and decrement instructions of the 6502.
processor 6502
seg Code ; Define a new segment named "Code"
org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
; TODO:
LDA #1; Load the A register with the decimal value 1
LDX #2; Load the X register with the decimal value 2
LDY #3; Load the Y register with the decimal value 3
INX ; Increment X
INY ; Increment Y
INC ; Increment A
DEX ; Decrement X
DEY ; Decrement Y
DEC ; Decrement A

org $FFFC ; End the ROM always at position $FFFC
.word Start ; Put 2 bytes with reset address at memory position $FFFC
.word Start ; Put 2 bytes with break address at memory position $FFFE
Exercise 7
This exercise covers the increment and decrement using zero-page addressing mode.
The zero-page addressing mode helps us directly increment and decrement values
inside memory positions. The “zero page” in the 6502 are addresses between 0 and 255.
These addresses are special for the 6502 processor because we can store them using
only 1 byte (8 bits), which also means they can be performed relatively fast by the CPU.
processor 6502
seg Code ; Define a new segment named "Code"
org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
    ; TODO:
    ; Load the A register with the decimal value 10
    ; Store the value from A into memory position $80
    ; Increment the value inside a (zero page) memory position $80
    ; Decrement the value inside a (zero page) memory position $80
    org $FFFC ; End the ROM always at position $FFFC
    .word Start ; Put 2 bytes with reset address at memory position $FFFC
    .word Start ; Put 2 bytes with break address at memory position $FFFE
Exercise 8
Your goal here is to create a loop that counts down from 10 to 0. You should also fill the
memory addresses from $80 to $8A with values from 0 to A.
$80 $81 $82 $83 $84 $85 $86 $87 $88 $89 $8A
0 1 2 3 4 5 6 7 8 9 A
processor 6502
seg Code ; Define a new segment named "Code"
org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
ldy #10 ; Initialize the Y register with the decimal value 10
Loop:
    ; TODO:
    TYA ; Transfer Y to A
    STA $80,Y ; Store the value in A inside memory position $80+Y
    DEY ; Decrement Y
    BNE Loop; Branch back to "Loop" until we are done
org $FFFC ; End the ROM always at position $FFFC
.word Start ; Put 2 bytes with reset address at memory position $FFFC
.word Start ; Put 2 bytes with break address at memory position $FFFE
Exercise 9
Your goal in this exercise is to create a simple loop that goes from 1 to 10. If possible, try
using the CMP instruction. This instruction that can be used to compare the value of
the accumulator with a certain literal number. Once the comparison is done, the
processor flags will be set (zero if the compared values are equal, non-zero if different).
processor 6502
seg Code ; Define a new segment named "Code"
org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
lda #1 ; Initialize the A register with the decimal value 1
Loop:
; TODO:
INC #1; Increment A
; Compare the value in A with the decimal value 10
; Branch back to loop if the comparison was not equals (to zero)
org $FFFC ; End the ROM always at position $FFFC
.word Start ; Put 2 bytes with reset address at memory position $FFFC
.word Start ; Put 2 bytes with break address at memory position $FFFE