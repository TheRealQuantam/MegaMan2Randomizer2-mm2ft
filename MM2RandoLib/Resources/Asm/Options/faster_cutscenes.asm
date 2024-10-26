.macpack common

LevelIdx = $2a

.segment "BANKD"

; This is the number of frames to wait after drawing the path on the Wily map before fade out.
; Default value 0x7D (125 frames), change to 0x10.
.org $99a8
	.byte $10

; Skip 3 of the 4 extra pages of text that occur when receiving an item, and only show the last page "GET EQUIPPED WITH ITEM X"
.org $bc78
	ldx LevelIdx
	lda $c281, x
	lsr a
	ora #$a0
	sta $420
	inc $420

	jmp $bcd0

; Weapon get text
.org $bd3a
	.byte 4

.segment "BANKE"

; READY text
.org $8137
	.byte $60