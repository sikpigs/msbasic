.ifdef PLBS
.import call

SYS:
    jsr     FRMNUM
    lda     FACSIGN
    bpl     :+
    jmp     GOIQ
:
    lda     FAC
    cmp     #$91
    bcc     :+
    jmp     GOIQ
:
    jsr     QINT

    ldx     FAC_LAST
    ldy     FAC_LAST - 1

    jmp     call

.endif ; PLBS
