; configuration
CONFIG_2A := 1

CONFIG_SCRTCH_ORDER := 2

; zero page
ZP_START1 = $08
ZP_START2 = $12
ZP_START3 = $18
ZP_START4 = $23

; extra/override ZP variables
USR := GORESTART

; inputbuffer
INPUTBUFFER := $0200

; constants
SPACE_FOR_GOSUB := $3E
STACK_TOP := $FA
WIDTH := 40
WIDTH2 := 30

RAMSTART2 := $4000

.import getchar
.import putchar
.import putchar_lcd
.import PRBYTE

; monitor functions
MONCOUT	:= putchar
MONRDKEY := getchar

LOAD:
SAVE:
    rts