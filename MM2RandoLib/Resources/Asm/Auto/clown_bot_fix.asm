; Fix clown bot death causing object corruption, most notably leading to phantom crash walls in the first screen of Flash Man.

.include "mm2r.inc"

.segment "BANKE"

; Clown bot death fix
.org $a6f6
	jsr DoesClownGearExist ; Was ldy EnemyVars110, x
	bcs $a70c ; Was cpy #$ff
	nop ; Was beq $a70c
	nop

FREE_UNTIL $a6fd
	
.reloc
DoesClownGearExist:
	; Should the gear still exist?
	ldy EnemyVars110, x
	cpy #$ff
	bcs ++
	
	; Has the gear's object slot been used by something else?
	lda ObjSpriteIds, y
	cmp #CLOWN_GEAR_OBJ_ID
	bne +
	
	clc
	
	rts
	
+
	sec
	
++
	rts

