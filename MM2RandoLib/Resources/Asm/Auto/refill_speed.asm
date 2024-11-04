.macpack common

MAX_ENERGY = $1c

REFILL_SFX_ID = $28

FrameCtr = $1c
CtrlState = $23
NumEtanks = $a7
CurItemIdx = $a9 ; 0 if none
ItemEnergies = $9c
Temp = $fd

EnqueueSound = $c051
WaitForNmi = $c0ab

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
.if ETANK_PROTECTION_LEVEL <> MAX_ENERGY
	jsr ShouldUseEtank
.else
	LDA $6C0
	CMP #MAX_ENERGY
.endif

	BEQ $9274

	DEC NumEtanks

.if ETANK_REFILL_SPEED_MASK = $ff

	lda #MAX_ENERGY
	sta $6c0

	lda #REFILL_SFX_ID
	jsr EnqueueSound

	jmp $9274

FREE_UNTIL $92b6

.else

-
	LDA FrameCtr ; 929F
	AND #ETANK_REFILL_SPEED_MASK
	JSR EtankIncreaseHealth ; Call code that wouldn't fit here

	JSR $9396 ; Do mostly ordinary stuff
	JSR WaitForNmi

	LDA $6C0 ; If life not full loop, else done
	CMP #MAX_ENERGY
	BEQ $9274
	JMP -

FREE_UNTIL $92b6

.reloc
EtankIncreaseHealth:
	BNE + ; Skip life increase if nonzero

	INC $6C0 ; Increase life

	LDA #REFILL_SFX_ID
	JMP EnqueueSound

+
	RTS

.endif

.if ETANK_PROTECTION_LEVEL <> MAX_ENERGY

.reloc
ShouldUseEtank: ; Returns Z if no
	lda $6c0
	cmp #MAX_ENERGY
	beq @Done ; Z: no

	cmp #ETANK_PROTECTION_LEVEL
	bcc @Done ; !Z: yes

	lda CtrlState
	and #$4 ; Select is pressed

@Done:
	rts

.endif

.segment "BANKE"

.if HEALTH_REFILL_SPEED_MASK = $ff

.org $82f2
PickupHealth:
	; A = amount to increase life by
	sta Temp
	
	lda $6c0
	cmp #MAX_ENERGY
	bcs @Done

	clc
	adc Temp
	cmp #MAX_ENERGY
	bcc @NoOverflow

	lda #MAX_ENERGY

@NoOverflow:
	sta $6c0

	lda #REFILL_SFX_ID
	jsr EnqueueSound

@Done:
	rts

FREE_UNTIL $8327

.else

.org $830a
	and #HEALTH_REFILL_SPEED_MASK

.endif
	
.if ENERGY_REFILL_SPEED_MASK = $ff

.org $832d
PickupEnergy:
	; A = amount to increase energy by
	sta Temp
	
	ldx CurItemIdx
	beq @Done
	
	dex
	lda ItemEnergies, x
	cmp #MAX_ENERGY
	bcs @Done
	
	clc
	adc Temp
	cmp #MAX_ENERGY
	bcc @NoOverflow
	
	lda #MAX_ENERGY
	
@NoOverflow:
	sta ItemEnergies, x
	
	lda #REFILL_SFX_ID
	jsr EnqueueSound
	
@Done:
	rts

FREE_UNTIL $8361

.else

.org $8349
	and #ENERGY_REFILL_SPEED_MASK

.endif
