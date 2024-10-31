.include "mm2r.inc"

.segment "BANKE"

.org $817e ; Part of main game loop
	jsr PatchDoPauseScreen ; Was jsr DoPauseScreen

.reloc
PatchDoPauseScreen:
	; Okay to clobber A, X, Y?
	lda CtrlState
	eor #$ff
	and #$11 ; = 0 if Up and A are held
	bne +

	sta MmState ; Explosion only occurs if MmState == 0
	jmp DoDeath

+
	jmp DoPauseScreen