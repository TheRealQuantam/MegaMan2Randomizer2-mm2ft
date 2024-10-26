.macpack common

;;; TODO: Pass this from code
WEAPON_TO_STAGE_INDEX_MAP_ADDR = $bff8

WpnsAcquiredMask = $9a
ItemsAcquiredMask = $9b

StageItemRewardMasks = $c281

.segment "BANKD"

.org $a4ad
	; $13 bytes available
	lda $2
	sta WpnsAcquiredMask
	
	tya ; Probably safe to clobber but better safe than sorry
	pha
	
	lda #$0 ; Acquired item mask
	ldx #$7 ; Weapon index
	jsr GetAcquiredItemsFromWeapons
	sta ItemsAcquiredMask
	
	pla
	tay
	
	nop ; Pad out
	nop

; Written by the randomizer
.org WEAPON_TO_STAGE_INDEX_MAP_ADDR
WpnToStageIdxMap:
	.byte 0, 1, 2, 3, 4, 5, 6, 7

.reloc
GetAcquiredItemsFromWeapons:
	asl $2
	bcc +
	
	ldy WpnToStageIdxMap, x
	ora StageItemRewardMasks, y
	
+
	dex
	bpl GetAcquiredItemsFromWeapons
	
	rts
