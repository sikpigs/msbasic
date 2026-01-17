; configuration
CONFIG_2A := 1

CONFIG_SCRTCH_ORDER := 2

; zero page

ZP_START = $10
ZP1_SIZE = $0A
ZP2_SIZE = $06
ZP3_SIZE = $0B

ZP_START1 = ZP_START
ZP_START2 = (ZP_START1 + ZP1_SIZE)
ZP_START3 = (ZP_START2 + ZP2_SIZE)
ZP_START4 = (ZP_START3 + ZP3_SIZE)

; extra/override ZP variables
USR := GORESTART

; inputbuffer
INPUTBUFFER := $0200

; constants
SPACE_FOR_GOSUB := $3E
STACK_TOP       := $FA
WIDTH           := 40
WIDTH2          := 30

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