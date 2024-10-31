.macpack common

BLOCKY_OBJ_ID = $31

.segment "BANKE"

.org $a9c6
	jsr CheckBlockyAlive ; Was lda $420, y

.reloc
CheckBlockyAlive:
	; Y is Blocky index
	lda $400, y
	cmp #BLOCKY_OBJ_ID
	bne +
	
	lda $420, y ; Obligatory
	
	rts
	
+
	; Positive return means no Blocky
	lda #$0
	
	rts
