; Ignore iframes for instant kill mechanics

.include "mm2r.inc"

.segment "BANKB"

.org $a564
	NO_OP 4 ; Was lda IframesLeft, bne $a59c

.segment "BANKE"

.org $8a5a
	NO_OP 4 ; Was ldy IframesLeft, bne $8a65

.org $8cbe
	NO_OP 4 ; Was ldy IframesLeft, bne $8cc9

.org $9e4b
	jmp CheckLaserContact ; Was lda IframesLeft
	nop ; Was bne $9e80

CheckLaserContactRet:

.reloc
CheckLaserContact:
	; Quick lasers do weird things with iframes
	lda IframesLeft
	cmp #$1
	beq +

	jmp CheckLaserContactRet

+
	jmp $9e80

.reloc
CheckForLethalContactDamage:
	lda IframesLeft
	bne +

	jmp ApplyContactDamage

+
	lda EnemyContactDamageTable, y
	cmp #MAX_ENERGY
	bcs +

	rts

+
	jmp LethalContactDamage

.segment "BANKF"

.org $e596
	jmp CheckForLethalContactDamage ; Was lda IframesLeft
	nop ; Was bne $e5cc

	; This is all from the original game, copied to set up jump locations
ApplyContactDamage: ; e59a
	sec
	lda ObjHitPoints
	sbc EnemyContactDamageTable, y
	sta ObjHitPoints
	beq LethalContactDamage
	bcs $e5b2

LethalContactDamage: ; e5a8

.assert * = $e5a8