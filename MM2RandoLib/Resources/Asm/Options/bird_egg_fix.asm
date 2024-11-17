.include "mm2r.inc"

;.include "mm2r.inc"

.segment "BANKE"

.org $ac89
	lda #PIPI_EGG_OBJ_ID ; Was lda #$0
	jsr DeleteEggs ; Was sta $430, y

.reloc
DeleteEggs:
	cmp $410, y
	bne +

	lda #$0
	sta $430, y
	rts

+
	dey
	bpl DeleteEggs

	rts
