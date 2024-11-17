.include "mm2r.inc"

; Original E-Tank Menu Command begins at 0D:9281:
; $9281: Menu Page and Menu Position Checking.        
; $9292:A5 A7     LDA $00A7 ;$00A7 is ETankCount
; $9294:F0 DE     BEQ $9274 ;Return if ETankCount == 0          
; $9296:C6 A7     DEC $00A7 ;Decrement ETankCount
; $9298:AD C0 06  LDA $06C0 ;$06C0 is Life
; $929B:C9 1C     CMP #$1C
; $929D:F0 D5     BEQ $9274 ;Return if Life == 28
; while (Life != 28)
; {
;      $929F:A5 1C     LDA $001C ;$001C is a FrameCounter.
;      $92A1:29 03     AND #$03
;      $92A3:D0 08     BNE $92AD ;if FrameCounter % 4 != 0 JMP ;$92AD
;      if(FrameCounter % 4 == 0)
;      {
;           $92A5: EE C0 06 INC Life  ;Raise Life by 1.
;           $92A8: A9 28    LDA #$28
;           $92AA: 20 51 C0 JSR $C051 ;Play Life Gain Sound
;      }
;
;      ; Not sure what the next 2 commands are doing.
;      ; Seem like part of the reglar game/draw loop since ;FrameCounter is updated.
;      $92AD: 20 96 93 JSR $9396
;      $92B0: 20 AB C0 JSR $C0AB ;Wait for next frame and update ;controller
;      $92B3: 4C 98 92 JMP $9298 ;Loop while (Life != 28)
; }

.segment "BANKD"

.org $9296
	LDA $6C0 ; Do not proceed if life is full
	CMP #$1C
	BEQ $9274

	DEC $A7 ; Decrement e-tanks

-
	LDA $1C ; 929F: Load frame counter
	AND #ETANK_REFILL_SPEED_MASK
	JSR EtankIncreaseHealth ; Call code that wouldn't fit here

	JSR $9396 ; Do mostly ordinary stuff
	JSR WaitForNmiOutOfGame

	LDA $6C0 ; If life not full loop, else done
	CMP #$1C
	BEQ $9274
	JMP -

.reloc
EtankIncreaseHealth:
	BNE + ; Skip life increase if nonzero

	INC $6C0 ; Increase life

	LDA #ENERGY_FILL_SFX_ID
	JMP EnqueueSound

+
	RTS ; BF87
