.macpack common

.segment "BANKE"

.reloc
DeleteBullets:
	lda $42f
	bpl +

	; Return to caller of caller
	pla
	pla

	rts

+
	ldx #$e

-
	lsr $421, x
	dex
	bne -
	
	rts

.segment "BANKF"

.org $c573
	jsr DeleteBullets

	; Delete platforms
	txa
	ldx #$2

-
	sta $5a0, x
	dex
	bpl -
