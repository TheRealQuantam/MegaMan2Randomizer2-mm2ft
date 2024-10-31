.macpack common

CtrlState = $23
MmState = $2c

DoDeath = $c10b
DoPauseScreen = $c573

.segment "BANKE"

.org $817e ; Part of main game loop
	jsr PatchDoPauseScreen ; Was jsr DoPauseScreen

.reloc
PatchDoPauseScreen:
	; Okay to clobber A, X, Y?
	lda CtrlState
	eor #$ff
	and #$17 ; = 0 if Up, Select, B, and A are held
	bne +

	sta MmState ; Explosion only occurs if MmState == 0
	jmp DoDeath

+
	jmp DoPauseScreen