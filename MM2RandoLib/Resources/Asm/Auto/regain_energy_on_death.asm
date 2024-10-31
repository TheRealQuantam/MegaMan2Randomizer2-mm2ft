.macpack common

NUM_ITEMS = $b
MAX_ENERGY = $1c

ItemEnergies = $9b

LoadStageTileset = $c45d

.if REGAIN_WEAPON_ENERGY_ON_DEATH

.segment "BANKE"

.org $80c1
	jsr RestoreWeaponsOnDeath ; Was jsr LoadStageTileset

.reloc
RestoreWeaponsOnDeath:
	jsr LoadStageTileset

	; Okay to clobber all
	ldx #(NUM_ITEMS - 1)

.if REGAIN_WEAPON_ENERGY_ON_DEATH < MAX_ENERGY
		
-
	lda ItemEnergies, x
	clc
	adc #REGAIN_WEAPON_ENERGY_ON_DEATH
	cmp #MAX_ENERGY
	bcc +

	lda #MAX_ENERGY

+

.else

	lda #MAX_ENERGY

-

.endif

	sta ItemEnergies, x

	dex
	bpl -

	inx

	rts

.endif ; REGAIN_WEAPON_ENERGY_ON_DEATH