.segment "CODE"
.ifdef PLBS
.import putcmd_lcd
.importzp bios_public

LCDCMD:
    jsr     GETBYT
    phx                 ; Save command in stack
    ldy     #0
    jsr     CHRGOT
@lcdcmd_args:
    beq     @lcdcmd
    cmp     #','
    bne     @lcdcmd

    jsr     CHRGET          ; consume ','
    jsr     GETBYT          ; read next argument

    stx     BUFFER, y       ; put argument in BUFFER
    iny
    cpy     #$10            ; 16 byte buffer limit
    beq     @lcdcmd

    jsr     CHRGET
    jmp     @lcdcmd_args

@lcdcmd:   
    ; Setup bios_params pointer with address of BUFFER
    lda     #<BUFFER
    sta     bios_public + LCDCmdArgs::data_ptr + Ptr::lo
    lda     #>BUFFER
    sta     bios_public + LCDCmdArgs::data_ptr + Ptr::hi

    pla                     ; Pull command off stack
    jsr     putcmd_lcd

    rts

LCDPRINT:
    jsr     FRMEVL
    bit     VALTYP
    bmi     @lcd_print
    jsr     FOUT
    jsr     STRLIT
@lcd_print:
    jsr     FREFAC
    tax
    ldy     #0
@lcd_print_char:
    lda     (INDEX), y
    jsr     putchar_lcd
    iny
    dex
    bne     @lcd_print_char
    rts

.endif ; PLBS