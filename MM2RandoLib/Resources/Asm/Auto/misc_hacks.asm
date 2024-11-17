; This file contains mandatory assorted hacks that were considered too minor to give their own assembly file but have no option to attach actions to. Unlike prepatch.asm, this file is compiled at the same time as everything else, so it has access to .reloc and symbol definitions.

.include "mm2r.inc"

; Disable refight boss music
.segment "BANKB"
.org $a060
	NO_OP 3
.segment "BANKE"
.org $83ca
	NO_OP 3
.org $847a
	NO_OP 3
	
.segment "BANKE"

; Disable Changkey Maker palette swap
.org $a4e6
    ; Stop palette change when enemy appears
	jmp $a555 ; Was jsr $f159
.org $a552
	; Stop palette change on kill/despawn
	NO_OP 3 ; Was jsr $f159

.segment "BANKF"

; Preserve e-tanks on game over
.org $c1bc
	NO_OP 2

; Woodman's Leaf Shield Attack Nerf
.org $ed5c + $61
	.byte 4