.include "mm2r.inc"

.segment "BANKE"

; Clown bot death fix
.org $a6f6
	jsr DoesClownGearExist ; Was ldy 110, x
	bcs $a70c ; Was cpy #$ff
	nop ; Was beq $a70c
	nop
	
.reloc
DoesClownGearExist:
	; Should the gear still exist?
	ldy $110, x
	cpy #$ff
	bcs ++
	
	; Has the gear's object slot been used by something else?
	lda $400, y
	cmp #CLOWN_GEAR_OBJ_ID
	bne +
	
	clc
	
	rts
	
+
	sec
	
++
	rts

