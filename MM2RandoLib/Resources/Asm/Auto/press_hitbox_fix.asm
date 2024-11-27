; When crushers hit the ground, a chain hit box object is spawned for $2b frames, then it self-destructs. This period elapses regardless of whether the crusher dies prior to the end of that period.

.include "mm2r.inc"

.segment "BANKE"

.org $a837
	lda #PRESS_CHAIN_OBJ_ID
	jsr SpawnPressChain ; Was jsr SpawnEnemyFromEnemy
	
.org $b55c
	; 3 bytes
	jmp PressChainObjHdlr
	
SpawnPressChain: ; 8 bytes
	jsr SpawnEnemyFromEnemy
	
	; Okay to clobber A
	txa ; Press object index
	sta EnemyVars120, y ; Generic enemy variable of chain
	
	rts

FREE_UNTIL $b569
	
.reloc
PressChainObjHdlr:
	; X is object index
	; Okay to clobber A, X, Y??
	
	; Has the chain lifetime expired?
	dec GenObjVars, x
	beq +
	
	; Does the press still exist?
	ldy EnemyVars110, x
	lda ObjFlags, y
	bpl +
	
	; Is it still a press?
	lda ObjSpriteIds, y 
	cmp #PRESS_OBJ_ID
	bne +
	
	jsr $efb3 ; Do collision detection
	
	rts
	
+
	; No more chain
	lsr ObjFlags, x
	
	rts
