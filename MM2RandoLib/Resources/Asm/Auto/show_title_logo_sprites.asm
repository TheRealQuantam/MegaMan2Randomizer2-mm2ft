.include "mm2r.inc"

; The code to draw the RM2 logo sprites is still in the US ROM, it just needs to be reintroduced to the active path.

.segment "BANKD"

.org $a231
	; During title screen
	jsr WaitForTitleScreenNmi ; Was jsr WaitForNmiOutOfGame

.org $a271
	; While Mega Man beams out of title screen 1
	jsr WaitForTitleScreenNmi ; Was jsr WaitForNmiOutOfGame

.org $a29c
	; While Mega Man beams out of title screen 2
	jsr WaitForTitleScreenNmi ; Was jsr WaitForNmiOutOfGame

.org $a2a9
	; While Mega Man beams out of title screen 3
	jsr WaitForTitleScreenNmi ; Was jsr WaitForNmiOutOfGame

.reloc
WaitForTitleScreenNmi:
	jsr DrawTitleLogoSprites
	jmp WaitForNmiOutOfGame

