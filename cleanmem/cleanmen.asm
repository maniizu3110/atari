    processor 6502

    seg code
    org $F000       ; Define the coe origin at $F000

Start:
    sei             ; Disable interrupts
    cld             ; Clear decimal mode
    ldx #$FF        ; Load the X register with $FF
    txs             ; Transfer X to the stack pointer

    ; Clear the Page Zero region($00 to $FF)
    ; Meaning the entire RAM and also the entire TIA registers
    lda #0          ; A=0
    ldx #$FF        ; X=$FF

MemLoop:
    sta $0,x        ; Store A at $00,X
    dex             ; X--
    bne MemLoop     ; Loop until X=0 (z-flag is set)

    ; Fill the ROM size to exactly 4KB
    org $FFFC
    .word Start     ; Reset vector at $FFFC
    .word Start     ; IRQ vector at $FFFE(unused in the VCS)



; ---------------------------------------------------------------
    ; LDA ; load the A register
    ; LDX ; load the X register
    ; LDY ; load the Y register

    ; STA ; store the A register
    ; STX ; store the X register
    ; STY ; store the Y register 

    ; ADC ; add to accumulator with carry
    ; SBC ; subtract from accumulator with carry
    ;     CLC ; clear carry flag,usually performed before addition
    ;     SEC ; set carry flag,usually performed before subtraction

    ; INC ; increment memory by one
    ; INX ; increment X by one
    ; INY ; increment Y by one

    ; DEC ; decrement memory by one
    ; DEX ; decrement X by one
    ; DEY ; decrement Y by one

    ; JMP ; jump to another location
    
    ; Branchは分岐のこと
    ; BCC ; Branch on carry clear         C == 0
    ; BCS ; Branch on carry set           C == 1
    ; BEQ ; Branch on equal to zero       Z == 1
    ; BNE ; Branch on not equal to zero   Z == 0
    ; BMI ; Branch on minus               N == 1
    ; BPL ; Branch on plus                N == 0
    ; BVC ; Branch on overflow clear      V == 0
    ; BVS ; Branch on overflow set        V == 1