; When Pipis go off screen they delete their eggs, which are hard-coded to be in the object slot next to the Pipi. However, this does not ensure that the egg is actually in that slot, potentially resulting in random objects being deleted.

.include "mm2r.inc"

.segment "BANKE"

.org $ac89
	; Y is the egg enemy slot index

	lda #PIPI_EGG_OBJ_ID ; Was lda #$0
	jsr DeleteEggs ; Was sta ObjFlags + $10, y

.reloc
DeleteEggs:
	cmp ObjSpriteIds + $10, y
	bne +

	lda #$0
	sta ObjFlags + $10, y
	rts

+
	dey
	bpl DeleteEggs

	rts
