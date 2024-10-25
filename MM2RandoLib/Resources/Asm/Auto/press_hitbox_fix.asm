.macpack common

PRESS_OBJ_ID = $30
PRESS_CHAIN_OBJ_ID = $52

CurObjIdx = $2b

SpawnEnemyFromEnemy = $f159

.segment "BANKE"

.org $a837
	lda #PRESS_CHAIN_OBJ_ID
	jsr SpawnPressChain ; Was jsr SpawnEnemyFromEnemy
	
.org $b55c ; $d bytes available
	; 3 bytes
	jmp PressChainObjHdlr
	
SpawnPressChain: ; 8 bytes
	jsr SpawnEnemyFromEnemy
	
	; Okay to clobber A
	txa ; Press object index
	sta $120, y ; Generic enemy variable of chain
	
	rts
	
.reloc
PressChainObjHdlr:
	; X is object index ($2b)
	; Okay to clobber A, X, Y??
	
	; Has the chain lifetime expired?
	dec $4e0, x
	beq +
	
	; Does the press still exist?
	ldy $110, x
	lda $420, y
	bpl +
	
	; Is it still a press?
	lda $400, y 
	cmp #PRESS_OBJ_ID
	bne +
	
	jsr $efb3 ; Do collision detection
	
	rts
	
+
	; No more chain
	lsr $420, x
	
	rts
