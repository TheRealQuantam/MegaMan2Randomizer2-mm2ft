; Fix the issue of blocky hitbox remaining a few frames after death.
; When not fallen apart, Blockys are multi-object enemies consisting of the main object ($31) and hit box objects ($32). Hit box objects have the index of the main object and self-destruct when the main object is no longer alive; however, the hit box objects do not check that what's in the Blocky object slot is still a Blocky. When an enemy dies its object slot is replaced by an explosion object, which is alive for several frames.

.include "mm2r.inc"

.segment "BANKE"

; Blocky hitbox object handler

.org $a9c6
	jsr CheckBlockyAlive ; Was lda ObjFlags, y
	; Checks if the high bit is set (Blocky is alive)

.reloc
CheckBlockyAlive:
	; Y is Blocky index

	lda ObjSpriteIds, y
	cmp #BLOCKY_OBJ_ID
	bne +
	
	lda ObjFlags, y ; Obligatory
	
	rts
	
+
	; Positive return means no Blocky
	lda #$0
	
	rts
