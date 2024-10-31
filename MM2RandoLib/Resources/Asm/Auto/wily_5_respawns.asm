.macpack common

; This modifies the game loop to spawn weapon energy pickups in Wily 5.

; At 0x0E:816A (bank E, 0x3817A in the ROM), there is a CMP instruction to value 0x0C (CMP #0x0C). This is checking if the current stage is Wily 5 (0x0C). If the current stage is Wily 5, it jumps to a special game loop at 0x0E:8223 (bank E, 0x38233 in the ROM), which has a special setup routine for the teleport room, otherwise, it jumps to 0x0E:8171, which is the normal game loop.
 
; The special Wily 5 game loop does not include the call instruction to the subroutine that spawns items or enemies, but the loop itself is otherwise identical to the base game loop.

; This changes the jump to 0x0E:8223 to call the subroutine that sets up the teleporters. Because of the convenient ordering of instructions, this function will return directly to 0x0E:8171 - the start of the normal game loop - exactly as desired. As a result, 0x0E:8223-8267 is now unused space that may be otherwise used.

.segment "BANKE"

.org $816e
	jsr $81de ; Was jmp $8223