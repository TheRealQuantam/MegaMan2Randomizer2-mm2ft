; This will change the delay defeating a boss and teleporting out of the field to be much shorter. The victory fanfare will not play, and you teleport out exactly 10 frames after landing the killing blow on a robot master, and faster for Wily bosses as well. This indirectly fixes the issue of potentially zipping out of Bubbleman or other robot masters' chambers, since you teleport immediately.

.include "mm2r.inc"

; 0x02E0AF: Time until teleport after fanfare starts. ($FD, change to $40)
; 0x02E0A2: Time until boss-defeat fanfare starts. Note that if set too low without any additional changes, a softlock may occur after some Wily bosses. Change from $FD to $10, then modify other areas that set the intial value of $05A7 (address storing our comparison). It turns out taht Mechadragon, Picopico-kun, and Gutsdozer set the intial value to $70 (at 0x02D16F). Boobeam has its own special routine with extra explosions, setting the initial value to $80 (at 0x02D386). Wily Machine and Alien do not call these subroutines and no further modification is needed.
; 0x02D170: Wily 1/2/3 boss defeat, time until fanfare starts. ($70, change to $10). Must be less or equal to value above (at 0x02E0A2).
; 0x02D386: Boobeam defeat, time until fanfare starts. ($80 change to $10). Must be less or equal to value above (at 0x02E0A2)
;
; The original subroutine that uses 0x02E0A2 is as follows:
;
; BossDefeatWaitForTeleport:
;  0B:A08B: 4E 21 04  LSR $0421    ; Not sure what this is for, but it gets zeroed out after a couple loops
;  0B:A08E: AD A7 05  LDA $05A7    ; $05A7 frequently stores a frame-counter or a 'state' value
;  0B:A091: C9 10     CMP #$FD     ; Compare value at $05A7 with 0xFD
;  0B:A093: B0 04     BCS PlayFanfare_ThenWait  ; If value at $05A7 >= 0xFD, jump to PlayFanfare_ThenWait
;  0B:A095: EE A7 05  INC $05A7    ; Increase value at $05A7 by 1
;  0B:A098: 60        RTS          ; Return
; PlayFanfare_ThenWait:
;  0B:A099                         ; Play fanfare once, then wait to teleport....
;  ...
;
; When defeating Wily 1, 2, 3, or 4, the BossDefeatWaitForTeleport subroutine is entered for the first time with $05A7 having a value of 0x70 or 0x80; if you change the comparison value at $2E0A2 from 0xFD to a value smaller than the inotial $05A7, an infinite loop occurs.

BEFORE_FRAMES = $10
AFTER_FRAMES = $40

.segment "BANKB"

.org $a09f ; Teleport delay after fanfare
	.byte AFTER_FRAMES

.org $a092 ; Global delay before fanfare
	.byte BEFORE_FRAMES

.org $9160 ; W1/2/3 boss delay before fanfare
	.byte BEFORE_FRAMES

.org $9376 ; W4 boss delay before fanfare
	.byte BEFORE_FRAMES

; Also, NOP out the code that plays the fanfare. It's too distorted sounding when immediately teleporting.
; Or TODO in the future, change to a different sound?
;  02E0B3: A9 15      LDA #$15       ; Let A = the fanfare sound value (15)
;  02E0B5: 20 51 C0   JSR PlaySound  ; Jump to "PlaySound" function, which plays the value in A

.org $a0a3
	NO_OP 5