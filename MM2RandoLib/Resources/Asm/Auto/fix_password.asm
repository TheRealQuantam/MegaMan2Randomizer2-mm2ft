; MM2 originally hard-coded which weapons came with which special items, and after WpnsAcquiredMask was decoded from the password ItemsAcquiredMask was calculated by swizzling the bits in WpnsAcquiredMask. As the randomizer randomizes which weapons come with which items, a more flexible solution is needed. There already exists a table to award items based on stage, so the randomizer needs to add a table to map weapon (represented by the bits in WpnsAcquiredMask) to stage.

.include "mm2r.inc"

.segment "BANKD"

.org $a4ad
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

FREE_UNTIL $a4c0

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
