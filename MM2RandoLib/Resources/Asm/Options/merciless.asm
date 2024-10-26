.macpack common

IframesLeft = $4b

EnemyContactDamageTable = $ed5c

.segment "BANKB"

.org $a564
	nop ; Was lda 02 E5 74
	nop ; Was bne $a59c
	nop
	nop

.segment "BANKE"

.org $8a5a
	nop ; Was ldy IframesLeft
	nop ; Was bne $8a65
	nop
	nop

.org $8cbe
	nop ; Was ldy IframesLeft
	nop ; Was bne $8cc9
	nop
	nop

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
	cmp #$1c
	bcs +

	rts

+
	jmp LethalContactDamage

.segment "BANKF"

.org $e596
	jsr CheckForLethalContactDamage ; Was lda IframesLeft
	nop ; Was bne $e5cc

	; This is all from the original game, copied to set up jump locations
ApplyContactDamage: ; e59a
	sec
	lda $6c0
	sbc EnemyContactDamageTable, y
	sta $6c0
	beq LethalContactDamage
	bcs $e5b2

LethalContactDamage: ; e5a8
