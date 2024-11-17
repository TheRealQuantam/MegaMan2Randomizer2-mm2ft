.include "mm2r.inc"

.segment "BANKD"

.org $811E ; Disable Stage Select Flashing
	.byte $1F

.org $995D ; Wily Map Flash Color
	.byte $0F

.ifndef FASTER_CUTSCENE_TEXT
	; This sequence is disabled by FastText, and the patch conflicts with it.
	.org $BC88 ; Item Get Flash Color
		.byte $0F
.endif

.segment "BANKB"

.org $89F4 ; Flash Man Fire Flash Color
	.byte $0F
.org $8C6C ; Metal Man Periodic Flash Color
	.byte $0F

.segment "BANKD"

.org $BA0A ; NOP Ending Palette Flash
	.byte $EA
.org $B795 ; Disable Ending Screen Flash
	.byte $00
	

.segment "BANKB"


; Dragon
.org $91A2 ; Dragon Hit Flash Palette Index
	.byte $63
.org $9177 ; Dragon Hit Restore Palette Index
	.byte $63
	
.ifndef RANDOMIZE_COLOR_PALETTES
	.org $91A0 ; Dragon Hit Flash Color
		.byte $37
	.org $9175 ; Dragon Hit Restore Color
		.byte $27
.endif

.org $9390 ; Dragon Defeat Flash Color
	.byte $0F
	

; Guts Tank
.org $9651 ; Guts Tank Flash Palette Index
	.byte $5C
; p.Add(0x2D65F, 0x0F, "Guts Tank Flash Color");


; Wily Machine
.org $9A86 ; Wily Machine Flash Palette Index
	.byte $63
.org $9A13 ; Wily Machine Restore Palette Index
	.byte $63
	
.ifndef RANDOMIZE_COLOR_PALETTES
	.org $9A84 ; Wily Machine Flash Color
		.byte $25
	.org $9A11 ; Wily Machine Restore Color
		.byte $35
.endif


; Alien
.org $9C87 ; Alien Hit Flash Color
	.byte $0F
.org $9D5C ; Alien Defeat Flash Color
	.byte $0F
.org $9F0B ; Alien ExplOsion Flash Color
	.byte $0F