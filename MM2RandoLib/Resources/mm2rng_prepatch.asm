; Prepatch assembly file for https://github.com/snarfblam/snarfblasm
; Compile with: snarfblasm mm2rng_prepatch.asm -checking:on -ips:on

; Most of this file was autogenerated from the prepatch IPS, but it needs to be cleaned up and made clear what every single change is. This is now the authoritative set of prepatch changes, and the IPS must only be generated by snarfblasm. Eventually this will be fully integrated into the randomizer with something like JS65.

CLOWN_BOT_OBJ_IDX = $29
PRESS_OBJ_IDX = $30
PRESS_CHAIN_OBJ_IDX = $52

CurObjIdx = $2b

WpnsAcquiredMask = $9a
ItemsAcquiredMask = $9b

; The prepatch inverts its meaning in several places, effectively making it easy mode
HardMode = $cb

WaitForNmiOutOfGame = $c0ab
SpawnEnemyFromEnemy = $f159

StageItemRewardMasks = $c281

.patch 0:b640
.db $19, $1a, $1b, $1c, $1d, $1d, $1e, $1e, $1e, $1f, $20, $21, $22, $23, $25, $25
.db $2a, $2a, $2a, $2a, $2a

.patch 0:b73e
.db $10, $10, $a0, $a0, $20, $30, $48, $b8, $48, $a8, $e8, $f0, $6c, $4c, $44, $98
.db $10, $10, $28, $68, $98, $d8

.patch 0:b840
.db $a0, $a0, $30, $30, $bc, $ac, $9c, $ac, $9c, $bc, $5c, $64, $74, $b8, $38, $88
.db $98, $98, $88, $88, $98

.patch 0:b940
.db $00, $00, $37, $39, $50, $50, $50, $50, $50, $50, $50, $4f, $4f, $46, $21, $21
.db $63, $63, $63, $63, $64

.patch 0:bb16
.db $0b, $0b

.patch 1:81a8
.db $58, $60, $59, $61, $5a, $62, $5b, $63, $5c, $64, $00, $00

.patch 1:81c0
.db $68, $70, $69, $71, $40, $40, $40, $40, $00, $00, $68, $70, $6a, $72, $6b, $73
.db $6c, $74, $00, $00

.patch 1:81e8
.db $78, $00, $79, $00, $7a, $00, $7b, $00, $7c, $00, $00

.patch 1:8411
.db $50, $50, $10, $55, $55, $11, $55, $55, $11, $40, $50, $50, $44, $55, $55, $44
.db $55, $55

.patch 1:846a
.db $55, $55, $11, $44, $55, $55, $55, $00, $cc, $55, $11, $44, $55, $55, $ff, $ff
.db $05, $05, $01, $04, $05, $05

.patch 1:8574
.db $6d, $75, $7d, $34, $26, $25, $00, $00, $6e, $76, $7e, $35, $23, $29, $00, $00
.db $6f, $77, $7f

.patch 1:85cb
.db $6a, $70, $7a, $34, $23, $25, $00, $00, $6b, $73, $7b, $35, $23, $26, $25, $00
.db $6c, $74, $7c

.patch 1:85f3
.db $6a, $70, $7a, $00, $00, $23, $36, $00, $6b, $73, $7b, $00, $00, $23, $36, $00
.db $6c, $74, $7c

.patch 1:8623
.db $01

.patch 1:862b
.db $02

.patch 1:8633
.db $02

.patch 1:864c
.db $57, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00
.db $57, $00, $3b, $00, $00, $00, $00, $00, $00, $3c, $23, $37, $00, $00, $00, $00
.db $27, $3d, $23, $23, $00, $00, $00, $68, $23, $3d, $23, $23, $00, $00, $00, $5f
.db $23, $3d, $23, $23, $00, $00, $00, $35, $23, $3d

.patch 1:868c
.db $35, $3d

.patch 1:8695
.db $3f

.patch 1:869d
.db $57, $5e

.patch 1:86a6
.db $69, $24, $28, $00, $00, $00, $6a, $70, $7a, $00, $23, $66, $00, $00, $6b, $73
.db $7b, $00, $23, $65, $00, $00, $6c, $74, $7c, $00, $23, $24, $00, $00, $00, $00
.db $00, $27, $28, $00, $00, $00, $57

.patch 1:86dc
.db $02

.patch 1:86e4
.db $57

.patch 1:874f
.db $00

.patch 1:b60c
.db $07, $08, $08, $09, $0a, $0a, $0c, $0c, $0e, $0e, $0f, $0f, $10, $11, $12, $12
.db $13, $17, $17, $18, $1d, $1d, $1f, $20, $20, $22, $22, $22, $23, $23, $23

.patch 1:b709
.db $a0, $d0, $70, $c0, $38, $b0, $60, $38, $b8, $48, $b8, $00, $80, $10, $e0, $f0
.db $60, $30, $e0, $c0, $10, $98, $10, $74, $9c, $90, $60, $f0, $00, $40, $90, $30
.db $b0, $e0

.patch 1:b80c
.db $20, $20, $20, $20, $5c, $9c, $9b, $7b, $08, $50, $30, $30, $50, $30, $54, $30
.db $08, $10, $10, $10, $24, $64, $80, $80, $80, $80, $6c, $0c, $0c, $0c, $0c

.patch 1:b90c
.db $00, $00, $00, $00, $50, $50, $40, $41, $39, $36, $37, $00, $36, $36, $00, $37
.db $39, $2b, $2b, $2b, $4c, $4b, $4a, $47, $47, $4a, $30, $30, $30, $30, $30

.patch 1:ba00
.db $0a, $0a, $13, $13, $14, $14, $15, $15, $16, $18, $1b, $1b, $1b, $1b, $1c, $1c
.db $1c

.patch 1:ba18
.db $1d, $1d, $1d, $1d, $26, $ff

.patch 1:ba40
.db $80, $80, $f8, $f8, $f8, $f8, $08, $08, $50, $58, $48, $68, $88, $a8, $58, $54
.db $54, $64, $6c, $74, $84, $84, $94, $9c, $58, $58, $a0, $a0, $d0

.patch 1:ba82
.db $4f, $6f, $4f, $6f, $4f, $6f, $4a, $ba, $0f, $0f, $0f, $48, $48, $8c, $cc, $cc
.db $8c, $cc, $8c, $cc, $cc, $8c, $8f, $bf, $98, $c8, $48

.patch 1:bac2
.db $2f, $2f, $2f, $2f, $2f, $2f, $78, $78, $57, $57, $57, $7a, $7b, $79, $79, $79

.patch 1:bad8
.db $57, $57, $7b, $7a, $76

.patch 1:bb13
.db $00, $04, $08, $1c, $1c

.patch 2:8ac0
.db $5a, $9e

.patch 2:8ac8
.db $44, $44, $44, $44, $44, $44, $4e, $4f, $44, $44, $44, $44, $44, $44, $4e, $4f
.db $44, $44, $44, $44, $44, $44, $4e, $4f, $44, $44, $44, $44, $44, $44, $4e, $4f
.db $44, $44

.patch 2:8af0
.db $44, $44, $44, $44, $44, $44, $4e, $4f, $63, $63, $63

.patch 2:b625
.db $1c, $1d, $1d, $25, $25, $26, $23

.patch 2:b701
.db $50, $98, $d0, $f8, $38, $88, $f0, $50

.patch 2:b71f
.db $30, $80, $10, $b0, $c0, $bc, $f0, $60, $f0, $2c, $cc, $5c, $80

.patch 2:b820
.db $20, $08, $08, $08, $c4, $94, $94, $94, $b4, $b4, $b4, $80

.patch 2:b925
.db $00, $71, $71, $4b, $4b, $4b, $56

.patch 3:b612
.db $0a, $0a, $0b, $0c, $0d, $0e, $0e, $0e, $0f, $10, $10, $11, $12, $13, $17, $18
.db $1b, $1b, $1e, $1e, $1e, $1e, $1f, $20, $20, $20, $20, $21, $22, $23, $24, $25

.patch 3:b70f
.db $50, $68, $c8, $38, $d0, $d8, $70, $80, $00, $18, $88, $90, $30, $a0, $c0, $90
.db $88, $c8, $78, $90, $b8, $10, $10, $d8, $f0, $48, $10, $10, $38, $f0, $58, $f0
.db $9c, $b0, $ac

.patch 3:b80f
.db $b0, $48, $98, $40, $08, $54, $08, $08, $68, $88, $40, $90, $70, $08, $08, $08
.db $08, $98, $b8, $78, $b8, $58, $98, $88, $a8, $28, $38, $b8, $48, $b8, $58, $a4
.db $b4, $a4, $b4

.patch 3:b914
.db $00, $03, $05, $00, $00, $00, $0c, $0c, $09, $07, $07, $09, $34, $34, $34, $34
.db $21, $21, $12, $21, $12, $21, $21, $12, $21, $12, $4e, $4f, $4e, $4f

.patch 3:ba00
.db $13, $13, $14, $14, $15, $15, $16, $16, $17, $1b, $26, $26, $26, $26, $26, $26
.db $26, $ff

.patch 3:ba40
.db $f8, $f8, $f8, $f8, $08, $08, $38, $c8, $30, $b0, $08, $08, $38, $78, $88, $b8
.db $c8

.patch 3:ba80
.db $4f, $6f, $4f, $6f, $4f, $6f, $ba, $ba, $98, $38, $8f, $af, $5f, $2f, $8f, $af
.db $6f

.patch 3:bac0
.db $2f, $2f, $2f, $2f, $2f, $2f, $78, $78, $7b, $7a, $2f, $2f, $57, $57, $57, $57
.db $57

.patch 3:bb14
.db $02, $06, $0a, $0a

.patch 4:b60a
.db $09, $0a, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $13, $14

.patch 4:b70a
.db $60, $10, $60

.patch 4:b714
.db $80, $a0, $f8, $e8

.patch 4:b80a
.db $48, $90, $08, $08

.patch 4:b814
.db $80, $48, $a4, $a4

.patch 4:b90a
.db $00, $23, $25, $27

.patch 4:b914
.db $14, $00, $4e, $4e

.patch 4:ba0e
.db $29, $29

.patch 4:ba4e
.db $50, $90

.patch 4:ba8e
.db $b8, $b8

.patch 4:bace
.db $78, $78

.patch 4:bf0d
.db $0a

.patch 5:89c0
.db $d6, $d7

.patch 5:89c8
.db $d1, $d1

.patch 5:89d0
.db $d1, $d1

.patch 5:89d8
.db $d1, $d1

.patch 5:89e0
.db $d1, $d1

.patch 5:89e8
.db $d1, $d1

.patch 5:89f0
.db $d1, $d1

.patch 5:89f8
.db $d9, $da

.patch 5:8ff0
.dsb $300, $00

.patch 5:b60d
.db $0e, $0f, $0f, $11, $1a, $1a, $1a, $1a, $1b, $1b, $1b, $1b, $1b, $1c, $1c, $1c
.db $1c, $1d, $1d, $1d, $1e, $1e, $1e

.patch 5:b708
.db $50, $d8, $88, $68, $f8, $d8, $38, $c0, $08, $18, $58, $b0, $d0, $28, $48, $70
.db $b0, $e8, $28, $78, $a0, $c8, $68, $90, $b8, $30, $78, $b0

.patch 5:b808
.db $94, $6c, $b0, $b4, $b4, $34, $c4, $c4, $84, $34, $44, $24, $44, $24, $34, $44
.db $34, $54

.patch 5:b820
.db $64, $64, $44, $44

.patch 5:b90d
.db $00, $4e, $00, $4e

.patch 5:b922
.db $73, $72

.patch 5:ba12
.db $19, $19

.patch 5:ba52
.db $30, $50

.patch 5:ba92
.db $b8, $b8

.patch 5:bad2
.db $78, $78

.patch 6:b605
.db $04, $04, $05, $06, $07, $0c, $0c, $0d, $0e, $0f, $0f, $10, $10, $11, $12, $12
.db $13, $13

.patch 6:b705
.db $38, $e0, $f0, $78, $18, $60, $c8, $e0, $60, $10, $58, $18, $e8, $b8, $38, $a8
.db $38, $98

.patch 6:b805
.db $b4, $08, $08, $74, $08, $40, $48, $58, $48, $38, $78, $48, $18, $b8, $98, $98
.db $88, $88

.patch 6:b908
.db $00, $4a, $29, $29, $29, $29, $29, $31, $31, $31, $46, $46, $46, $46, $46

.patch 7:b616
.db $08, $0a, $0a, $0b, $0b, $0c, $0c, $0d, $0e, $0e, $10, $11, $11

.patch 7:b700
.db $38, $60, $d0, $30, $a8, $d0

.patch 7:b711
.db $08, $d8, $f0, $f0, $18, $68, $20, $48, $20, $a8, $20, $a0, $30, $20, $6c, $e0
.db $40, $a8

.patch 7:b800
.db $80, $34, $74, $54, $58, $a4

.patch 7:b816
.db $70, $20, $58, $20, $b8, $20, $74, $54, $30, $64, $10, $10, $10

.patch 7:b916
.db $00, $56, $34, $56, $34, $56, $37, $37, $37, $4b, $2b, $2b, $2b

.patch 8:8b05
.db $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.db $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.db $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.db $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.db $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.db $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.db $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.db $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.patch 8:8b82
.dsb $e, $00

.patch 8:8b90
.db $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.db $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:8baf
.dsb $20, $00

.patch 8:8bd0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0, $00, $00
.db $00, $00

.patch 8:8c06
.db $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80, $07
.db $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03, $e1
.db $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80, $c0
.db $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00, $00
.db $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00, $00
.db $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08, $10
.db $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0, $c0
.db $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.patch 8:8c80
.dsb $10, $00

.patch 8:8c90
.db $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.db $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:8cb0
.dsb $1f, $00

.patch 8:8cd0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0, $00, $00
.db $00, $00

.patch 8:8cf8
.dsb $d, $00

.patch 8:8d05
.db $01, $02, $02

.patch 8:8d0e
.db $03, $03, $00, $00, $1f, $60, $80, $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff
.db $ff, $f8, $00, $00, $f8, $0e, $03, $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff
.db $ff, $1f, $00, $00, $00, $00, $80, $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0
.db $c0, $e0, $04, $04, $04, $07, $00, $00, $00, $00, $07, $07, $07, $07, $00, $00
.db $00, $00, $30, $60, $60, $e0, $00, $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00
.db $00, $00, $08, $04, $04, $04, $08, $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f
.db $3f, $ff, $60, $60, $60, $60, $e0, $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0
.db $c0, $80

.patch 8:8d80
.dsb $10, $00

.patch 8:8d90
.db $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.db $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:8daf
.dsb $20, $00

.patch 8:8dd0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.patch 8:8dee
.dsb $17, $00

.patch 8:8e05
.db $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.db $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.db $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.db $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.db $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.db $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.db $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.db $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.patch 8:8e80
.dsb $10, $00

.patch 8:8e90
.db $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.db $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:8ec0
.dsb $a, $00

.patch 8:8ed0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.patch 8:8ef2
.dsb $5, $00

.patch 8:9005
.db $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.db $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.db $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.db $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.db $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.db $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.db $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.db $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.patch 8:9080
.dsb $10, $00

.patch 8:9090
.db $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.db $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:90af
.dsb $1e, $00

.patch 8:90d0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.patch 8:90ee
.dsb $17, $00

.patch 8:9105
.db $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.db $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.db $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.db $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.db $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.db $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.db $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.db $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.patch 8:9180
.dsb $10, $00

.patch 8:9190
.db $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.db $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:91af
.dsb $20, $00

.patch 8:91d0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.patch 8:91ee
.dsb $16, $00

.patch 8:9205
.db $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.db $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.db $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.db $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.db $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.db $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.db $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.db $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.patch 8:9288
.db $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $02, $04, $04, $04, $07, $00
.db $01, $03, $03, $07, $07, $07, $07, $00, $07, $1e, $38, $30, $60, $60, $e0, $00
.db $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:92b0
.dsb $1f, $00

.patch 8:92d0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.patch 8:92ee
.dsb $11, $00

.patch 8:9306
.db $02, $02

.patch 8:930e
.db $03, $03, $00, $00, $1f, $60, $80, $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff
.db $ff, $f8, $00, $00, $f8, $0e, $03, $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff
.db $ff, $1f, $00, $00, $00, $00, $80, $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0
.db $c0, $e0, $04, $04, $04, $07, $00, $00, $00, $00, $07, $07, $07, $07, $00, $00
.db $00, $00, $30, $60, $60, $e0, $00, $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00
.db $00, $00, $08, $04, $04, $04, $08, $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f
.db $3f, $ff, $60, $60, $60, $60, $e0, $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0
.db $c0, $80

.patch 8:9380
.dsb $c, $00

.patch 8:9390
.db $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.db $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.patch 8:93af
.dsb $11, $00

.patch 8:93d0
.db $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.db $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.patch 8:93ee
.dsb $11, $00

.patch 9:aa40
.db $f8, $20, $20, $20, $11, $1b, $15, $11

.patch 9:aa61
.db $fe, $06, $0c, $18, $38, $38, $38

.patch 9:aa80
.db $00, $7c, $c6, $06, $3c, $06, $c6, $7c

.patch 9:aa90
.db $00, $cc, $cc, $cc, $cc, $fe, $0c, $0c

.patch 9:aaa1
.db $fe, $c0, $fc, $06, $06, $c6, $7c

.patch 9:aab1
.db $7c, $c6, $c0, $fc, $c6, $c6, $7c

.patch 9:aac0
.db $70, $f0, $ff, $ff, $ff, $ff, $ff, $fc, $70, $f0, $ff, $ff, $ff, $e0, $e3, $e0
.db $07, $07, $ff, $ff, $ff, $ff, $f8, $38, $07, $07, $ff, $ff, $ff, $1f, $80, $00
.db $ff, $ff, $f0, $00, $00, $00, $c0, $c0, $ff, $ff, $f0, $00, $00, $00, $00, $00
.db $1c, $1f, $1c, $1c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $3b, $e3, $7b, $3b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $e5, $67, $67, $b7, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $c7, $6e, $6e, $67, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $cf, $dd, $dd, $8f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $2f, $b5, $b5, $35, $00, $00, $00, $00

.patch 9:ab4e
.db $00, $00, $07, $b1, $b3, $b7, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $e7, $cc, $8f, $e7, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $9b, $dc, $1c, $dc, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $80

.patch 9:ab81
.dsb $e, $00

.patch 9:ab97
.db $30

.patch 9:ab9e
.dsb $32, $00

.patch 9:adb1
.db $3c, $66, $06, $0c, $18, $00, $18

.patch 9:b010
.db $00, $03, $03, $07, $07, $0f, $0f, $0f, $03, $04, $04, $08, $08, $10, $10, $10
.db $00, $f8, $f8, $fc, $fc, $fe, $fe, $ff, $f8, $04, $04, $02, $02, $01, $01, $00
.db $00, $03, $07, $0f, $1f, $3f, $7f, $ff, $03, $04, $08, $10, $20, $40, $80, $00
.db $00, $f8, $f8, $f0, $f0, $f0, $f0, $e0, $fc, $04, $04, $08, $08, $09, $09, $11
.db $00, $3f, $7f, $7f, $7f, $ff, $fc, $fc, $7f, $40, $80, $80, $80, $00, $03, $02
.db $00, $ff, $ff, $ff, $ff, $ff, $00, $00, $ff, $00, $00, $00, $00, $00, $ff, $00
.db $00, $c0, $80, $83, $87, $0f, $0f, $1f, $e0, $20, $43, $44, $48, $90, $90, $20
.db $00, $3f, $ff, $ff, $ff, $ff, $ff, $e3, $3f, $c0, $00, $00, $00, $00, $00, $1c
.db $00, $00, $c0, $e0, $e0, $f0, $f0, $f0, $00, $c0, $20, $10, $10, $08, $08, $08
.db $00, $00, $00, $01, $01, $03, $07, $07, $00, $01, $01, $02, $02, $04, $08, $08
.db $00, $fe, $fe, $fe, $fe, $fe, $de, $de, $fe, $01, $01, $01, $01, $01, $21, $21
.db $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00
.db $00, $0f, $1f, $1f, $1f, $3f, $3f, $7f, $1f, $10, $20, $20, $20, $40, $40, $80
.db $00, $01, $83, $87, $cf, $df, $ff, $ff, $81, $82, $44, $48, $30, $20, $00, $00
.db $ff, $7f, $3f, $1f, $0f, $07, $03, $01, $ff, $7f, $3f, $1f, $0f, $07, $03, $01
.db $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fe, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $ff
.db $9f, $9f, $bf, $3f, $00, $7f, $00, $ff, $a0, $a0, $c0, $40, $7f, $80, $ff, $00
.db $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $ff, $00, $ff, $00
.db $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $ff, $00, $ff, $00
.db $e2, $e1, $e1, $c5, $04, $c3, $00, $8b, $13, $12, $12, $26, $e7, $24, $e7, $4c
.db $f8, $f8, $f8, $ff, $00, $ff, $00, $f0, $04, $04, $07, $00, $ff, $00, $ff, $0f
.db $00, $ff, $03, $fb, $01, $f1, $01, $03, $00, $ff, $ff, $07, $f9, $09, $f1, $f3
.db $1f, $bf, $bf, $bf, $00, $7e, $00, $7e, $20, $c0, $c0, $c0, $ff, $81, $ff, $81
.db $c1, $80, $07, $0f, $10, $0f, $20, $27, $22, $43, $87, $8f, $1f, $10, $3f, $38
.db $f1, $01, $01, $01, $0f, $ef, $03, $e2, $09, $f9, $01, $01, $ff, $1f, $f3, $13
.db $ef, $ef, $df, $be, $80, $7c, $00, $00, $f0, $f0, $e0, $c1, $ff, $82, $ff, $ff
.db $9f, $1f, $1f, $1f, $00, $1f, $00, $00, $60, $a0, $a0, $20, $3f, $20, $ff, $ff
.db $1f, $1f, $1e, $1e, $1c, $1d, $1c, $48, $9f, $9f, $9f, $9f, $9f, $9e, $9f, $8f
.db $7f, $7f, $ff, $ff, $00, $fd, $00, $00, $80, $80, $00, $00, $ff, $02, $fd, $fc
.db $ff, $ff, $ff, $ff, $00, $e7, $00, $00, $00, $00, $00, $00, $ff, $18, $e7, $87
.db $00, $ff, $ff, $fe, $fe, $fe, $fe, $fc, $ff, $00, $00, $01, $01, $01, $01, $02
.db $fc, $7c, $38, $18, $0b, $00, $03, $07, $fd, $7d, $3b, $1b, $0c, $07, $04, $08
.db $00, $00, $00, $00, $fe, $00, $fc, $f8, $ff, $ff, $ff, $ff, $01, $fe, $02, $04
.db $00, $00, $00, $00, $00, $01, $67, $7f, $ff, $ff, $fe, $78, $20, $01, $67, $7f
.db $00, $00, $00, $00, $3f, $80, $7f, $7f, $ff, $bf, $3f, $7f, $40, $ff, $80, $80
.db $08, $08, $00, $00, $17, $10, $0f, $0f, $cf, $cf, $cf, $8f, $98, $9f, $90, $90
.db $00, $00, $03, $00, $ff, $00, $ff, $ff, $f8, $f0, $f3, $ff, $00, $ff, $00, $00
.db $03, $03, $ff, $03, $fb, $01, $f1, $f1, $03, $03, $ff, $ff, $07, $f9, $09, $09
.db $00, $00, $00, $7f, $00, $bf, $bf, $df, $ff, $ff, $ff, $80, $ff, $c0, $c0, $e0
.db $30, $00, $00, $ff, $00, $ff, $fe, $fc, $37, $8f, $ff, $00, $ff, $00, $01, $02
.db $02, $04, $03, $88, $07, $17, $0f, $20, $e3, $e7, $e4, $4f, $c8, $98, $10, $3f
.db $00, $00, $ff, $00, $e0, $e0, $c3, $03, $ff, $ff, $00, $ff, $10, $10, $23, $e3
.db $00, $00, $ff, $00, $1f, $1f, $c0, $f0, $ff, $ff, $00, $ff, $60, $20, $ff, $f0
.db $08, $07, $80, $0f, $8f, $80, $08, $08, $cf, $c8, $4f, $c0, $50, $5f, $c8, $08
.db $00, $f0, $01, $e1, $c3, $03, $07, $07, $f8, $08, $f1, $11, $23, $e3, $07, $07
.db $00, $97, $f0, $ef, $e0, $f8, $f8, $ff, $0f, $98, $ff, $f0, $ff, $f8, $f8, $ff
.db $fc, $fc, $f8, $f8, $00, $f8, $00, $01, $02, $02, $04, $04, $fc, $04, $f8, $f9
.db $07, $0f, $0f, $00, $00, $00, $00, $00, $08, $10, $10, $1f, $00, $00, $00, $00
.db $f8, $f0, $f1, $01, $07, $03, $01, $00, $04, $08, $09, $f1, $07, $03, $01, $00
.db $fe, $fe, $fe, $ff, $ff, $ff, $ff, $ff

.patch 9:b330
.db $fe, $fe, $00, $80, $80, $ff, $ff, $ff, $01, $01, $ff, $80, $80, $ff, $ff, $ff
.db $0f, $20, $38, $38, $3f, $ff, $ff, $ff, $10, $3f, $38, $38, $3f, $ff, $ff, $ff
.db $ff, $00, $00, $00, $ff, $ff, $ff, $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff
.db $e1, $03, $03, $03, $ff, $ff, $ff, $ff, $11, $f3, $03, $03, $ff, $ff, $ff, $ff
.db $e7, $f0, $f8, $fe, $ff, $ff, $ff, $ff, $f8, $f7, $f8, $fe, $ff, $ff, $ff, $ff
.db $f0, $00, $01, $07, $ff, $ff, $ff, $ff, $08, $e0, $01, $07, $ff, $ff, $ff, $ff
.db $70, $f0, $ff, $ff, $ff, $ff, $ff, $f8, $70, $f0, $ff, $ff, $ff, $ff, $ff, $f8
.db $07, $07, $ff, $ff, $ff, $ff, $f0, $00, $07, $07, $ff, $ff, $ff, $ff, $f0, $00
.db $f0, $ff, $ff, $ff, $ff, $c0, $00, $00, $f0, $ff, $ff, $ff, $ff, $c0, $00, $00
.db $0f, $ff, $ff, $fc, $00, $00, $00, $00, $0f, $ff, $ff, $fc, $00, $00, $00, $00
.db $ff, $ff, $f0, $00, $00, $00, $00, $00, $ff, $ff, $f0, $00, $00, $00, $00, $00
.db $ff, $c0, $00, $00, $00, $00, $00, $00, $ff, $c0, $00, $00, $00, $00, $00, $00
.db $01, $e0, $00, $e0, $03, $02, $03, $fe, $f9, $11, $f3, $13, $f3, $02, $03, $fe
.db $03, $07, $07, $07, $0f, $0f, $0f, $0f, $00, $04, $00, $00, $08, $00, $00, $00
.db $00, $00, $01, $01, $01, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $00
.db $7f, $3f, $1f, $0f, $07, $03, $01, $00, $7f, $3f, $1f, $0f, $07, $03, $01, $00
.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8
.db $ff, $ff, $ff, $ff, $ff, $ff, $e0, $00, $ff, $ff, $ff, $ff, $ff, $ff, $e0, $00
.db $ff, $ff, $ff, $ff, $fc, $00, $00, $00, $ff, $ff, $ff, $ff, $fc, $00, $00, $00
.db $ff, $ff, $ff, $f0, $00, $00, $00, $00, $ff, $ff, $ff, $f0, $00, $00, $00, $00
.db $ff, $ff, $c0, $00, $00, $00, $00, $00, $ff, $ff, $c0, $00, $00, $00, $00, $00
.db $fc, $00, $00, $00, $00, $00, $00, $00, $fc, $00, $00, $00, $00, $00, $00, $00
.db $00, $00, $03, $0f, $1f, $3f, $7f, $ff, $00, $00, $02, $08, $00, $00, $00, $00
.db $1f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $18, $80, $00, $00, $00, $00, $00, $00
.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $03, $00, $00, $00, $00, $00, $00, $00
.db $00, $e0, $f8, $fc, $fe, $ff, $ff, $ff, $00, $20, $08, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $00, $80, $c0, $00, $00, $00, $00, $00, $00, $00, $40
.db $18, $30, $b0, $60, $e0, $c0, $80, $00, $d8, $b0, $30, $60, $e0, $c0, $80, $00
.db $00, $00, $00, $00, $00, $00, $01, $01, $80, $80, $80, $00, $00, $01, $02, $02
.db $00, $1f, $3f, $7f, $7f, $f7, $f7, $e7, $3f, $20, $40, $80, $80, $08, $08, $18
.db $00, $80, $80, $80, $80, $80, $a0, $c0, $80, $40, $40, $40, $40, $40, $40, $20
.db $00, $0f, $0f, $1f, $1f, $1f, $3f, $3f, $0f, $10, $10, $20, $20, $20, $40, $40
.db $00, $80, $81, $c1, $c3, $e3, $f7, $f7, $81, $41, $42, $22, $24, $14, $08, $08
.db $00, $f8, $f8, $f0, $f0, $f0, $e0, $e0, $fc, $04, $04, $08, $08, $08, $10, $11
.db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $07, $1f, $7f, $ff
.db $00, $00, $00, $00, $00, $00, $00, $00, $0f, $1f, $7f, $ff, $ff, $ff, $ff, $ff
.db $00, $00, $00, $00, $00, $01, $03, $07, $ff, $ff, $ff, $ff, $fe, $fd, $fb, $f7
.db $01, $01, $03, $03, $07, $07, $07, $00, $00, $00, $00, $00, $00, $00, $00, $0f
.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff
.db $ff, $ff, $fc, $f3, $ef, $df, $bc, $b8, $00, $00, $04, $13, $2f, $5f, $3c, $b8
.db $ff, $ff, $0f, $f3, $fd, $01, $00, $00, $00, $00, $08, $f0, $fc, $01, $00, $00
.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff
.db $c0, $e0, $e0, $f0, $f0, $f0, $f0, $04, $00, $20, $00, $10, $00, $00, $00, $f4
.db $80, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00
.db $3b, $77, $77, $6f, $c0, $df, $80, $00, $3c, $78, $78, $70, $ff, $e0, $ff, $ff
.db $c7, $c7, $87, $87, $00, $ff, $00, $00, $28, $28, $48, $48, $ff, $00, $ff, $ff
.db $c7, $c7, $c7, $c7, $06, $c6, $12, $00, $27, $27, $27, $27, $e7, $27, $e3, $f3
.db $bf, $7f, $7f, $7f, $00, $ff, $00, $00, $c0, $80, $80, $80, $ff, $00, $ff, $ff
.db $ff, $ff, $ff, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $ff
.db $e3, $c3, $c7, $c7, $0f, $80, $00, $3f, $13, $23, $27, $27, $cf, $5f, $df, $80
.db $ff, $ff, $ff, $fc, $00, $00, $00, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00
.db $ff, $ff, $f1, $04, $13, $2f, $9f, $7e, $ff, $ff, $fe, $f8, $e3, $cf, $1f, $7e
.db $ff, $c0, $3c, $f8, $e0, $c0, $00, $00, $ff, $c0, $3c, $f8, $e0, $c0, $00, $00
.db $0f, $00, $00, $00, $00, $01, $01, $00, $00, $0f, $0f, $00, $00, $01, $01, $00
.db $ff, $00, $00, $00, $ff, $ff, $ff, $00, $00, $ff, $ff, $00, $ff, $ff, $ff, $00
.db $78, $70, $70, $70, $e0, $e0, $e0, $00, $78, $70, $70, $70, $e0, $e0, $e0, $00
.db $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $03, $07
.db $ff, $00, $ff, $00, $00, $ff, $00, $00, $00, $ff, $00, $ff, $ff, $00, $ff, $ff
.db $f4, $04, $f4, $04, $14, $f4, $0c, $28, $04, $f4, $04, $f4, $e4, $14, $ec, $c8

.patch 9:b6e0
.dsb $f, $00

.patch 9:b6f0
.db $7f, $00, $fc, $00, $00, $01, $f8, $00, $80, $ff, $02, $fc, $00, $01, $f8, $00
.db $ff, $00, $03, $00, $f8, $c0, $00, $00, $00, $ff, $0c, $07, $f8, $c0, $00, $00
.db $e1, $00, $e3, $00, $00, $00, $00, $00, $12, $f3, $14, $f7, $00, $00, $00, $00
.db $f8, $00, $f8, $00, $00, $01, $01, $03, $04, $fc, $04, $f8, $00, $00, $00, $00
.db $7f, $00, $3e, $80, $ff, $ff, $ff, $ff, $80, $ff, $41, $7f, $00, $00, $00, $00
.db $00, $00, $7f, $00, $fe, $ff, $ff, $ff, $bf, $bf, $00, $7f, $00, $00, $00, $00
.db $09, $27, $df, $3f, $fc, $ff, $ff, $ff, $f1, $c7, $1f, $3f, $fc, $00, $00, $00
.db $f8, $f0, $c0, $00, $00, $ff, $ff, $ff, $f8, $f0, $c0, $00, $00, $00, $00, $00
.db $00, $00, $00, $00, $00, $ff, $fe, $fe, $00, $00, $00, $00, $00, $00, $00, $00
.db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00

.patch 9:b790
.db $fc, $fc, $fd, $fd, $fd, $f9, $fb, $fb, $02, $00, $01, $01, $05, $01, $03, $03
.db $00, $00, $e0, $c0, $c0, $c0, $c0, $80, $00, $00, $e0, $c0, $c0, $c0, $c0, $80
.db $00, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $00, $00, $00
.db $03, $ff, $ff, $ff, $ff, $00, $00, $00, $03, $ff, $ff, $ff, $ff, $00, $00, $00
.db $80, $80

.patch 9:b7d9
.db $80, $00

.patch b:a929
	; Invert difficulty modes
	lda HardMode
	beq + ; Was bne +
	asl $00
+
	rts

.patch b:ae4a
.db $20, $12, $01, $0e, $04, $0f, $0d, $09, $1a, $05, $12, $20

.patch b:b02f
.db $12, $1c

.patch d:a231
	; During title screen
	jsr WaitForNmiTitleScreen ; Was jsr WaitForNmiOutOfGame

.patch d:a271
	; While Mega Man beams out of title screen 1
	jsr WaitForNmiTitleScreen ; Was jsr WaitForNmiOutOfGame

.patch d:a29c
	; While Mega Man beams out of title screen 2
	jsr WaitForNmiTitleScreen ; Was jsr WaitForNmiOutOfGame

.patch d:a2a9
	; While Mega Man beams out of title screen 3
	jsr WaitForNmiTitleScreen ; Was jsr WaitForNmiOutOfGame

; Password item decoding fix
.patch d:a4ad
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

; The title screen background palette is at abbe-abcc

.patch d:aac0
.db $11, $2c, $15, $0f, $30, $2c, $15, $26, $26, $27, $15

; The title screen attributes map is at b2f1-b330

.patch d:b31a
.db $5a, $99, $55, $55, $55, $55, $55, $66, $aa, $08, $00, $00, $01, $05, $55, $65
.db $a5

; End of title screen attributes map at b330

; The title screen tile map is at b351-b710 (32x30). For some reason the rows are stored in reverse order, so the first row in the ROM is the bottom row.

.patch d:b372
.db $c6, $cc, $c1, $c7 ; "FLAG"

.patch d:b392
.db $c0

.patch d:b3b2
.db $d3, $c5, $c5, $c4 ; "SEED"

.patch d:b3d7
; Erase "PRESS START"
.db $c0, $c0, $c0, $c0, $c0, $00, $c0, $c0, $c0, $c0, $c0

.patch d:b3f2
.db $d6, $c5, $d2, $dc ; "VER."

.patch d:b438
; Erase "DIFFICULT"
.db $c0, $c0, $c0, $c0, $c0, $c0, $c0, $00, $00, $00

.patch d:b459
.db $c5, $c1, $d3, $d9 ; "EASY"

.patch d:b479
; Erase "NORMAL"
.dsb $6, $c0

.patch d:b499
.db $ce, $cf, $d2, $cd, $c1, $cc ; "NORMAL"

.patch d:b4de
.dsb $6, $00

.patch d:b4fe
.dsb $6, $00

.patch d:b51f
.dsb $4, $00

.patch d:b53f
.dsb $4e, $00

.patch d:b596
.db $42, $43, $44, $45, $46, $47, $48, $af, $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7
.db $00, $41, $7b, $7b, $7b, $7b, $7c, $7d

.patch d:b5b4
.db $30, $31, $32, $33, $34, $35, $36, $37, $38, $ac, $ad, $3b, $3c, $ae, $3e, $b9
.db $00, $00, $00, $40, $78, $78, $78, $78, $79, $7a

.patch d:b5d4
.db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $3f
.db $6f, $70, $71, $72, $73, $74, $75, $76, $77

.patch d:b5f3
.db $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e
.db $2f, $5f, $60, $61, $62, $63, $64, $65, $66, $67

.patch d:b615
.db $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $1f, $4f
.db $50, $51, $52, $53, $54, $55, $56, $57, $4e

.patch d:b63b
.dsb $c, $00

.patch d:b648
.db $68, $69, $6a, $6b, $6c, $6d, $6e

.patch d:b65c
.db $c0

.patch d:b663
.db $c0, $00, $00, $00, $00, $58, $59, $5a, $5b, $5c, $5d

.patch d:b689
.db $49, $4a, $4b, $4c, $4d

; End of title screen tile map at b710

; Fixes the incorrect tile colors on the Rockman-based title screen
.patch d:bf88
WaitForNmiTitleScreen:
	jsr $a60f
	jmp WaitForNmiOutOfGame

; Password item decoding fix
.patch d:bfea
GetAcquiredItemsFromWeapons:
	asl $2
	bcc +
	
	ldy WpnToStageIdxMap, x
	ora StageItemRewardMasks, y
	
+
	dex
	bpl GetAcquiredItemsFromWeapons
	
	rts
	
.patch d:bff8
WpnToStageIdxMap: ; Written by the randomizer
	.db 0, 1, 2, 3, 4, 5, 6, 7

; Change last byte of Table_BossRushBGColor ??
.patch e:84a2
.db $0a ; Was $21 (??)

; Clown bot death fix
.patch e:a6f6
	jsr DoesClownGearExist ; Was ldy 110, x
	bcs $a70c ; Was cpy #$ff
	nop ; Was beq $a70c
	nop
	
; Press hitbox fix
.patch e:a837
	lda #PRESS_CHAIN_OBJ_IDX
	jsr SpawnPressChain ; Was jsr SpawnEnemyFromEnemy
	
.patch e:b55c ; $d bytes available
	; 3 bytes
	jmp PressChainObjHdlr
	
SpawnPressChain: ; 8 bytes
	jsr SpawnEnemyFromEnemy
	
	; Okay to clobber A
	txa ; Press object index
	sta $120, y ; Generic enemy variable of chain
	
	rts
	
; Bank $e free space bd24-bfff
; mm2ft uses bd24-be4e
; Pause patch uses bd4f-be64
; Merciless mode uses be65-be82
; Clown bot death fix uses be83-be94
; Bird egg fix uses be95-bea4
; Press chain hitbox fix uses bea5-bec0

.patch e:be83
DoesClownGearExist:
	; Should the gear still exist?
	ldy $110, x
	cpy #$ff
	bcs ++
	
	; Has the gear's object slot been used by something else?
	lda $400, y
	cmp #CLOWN_BOT_OBJ_IDX
	bne +
	
	clc
	
	rts
	
+
	sec
	
++
	rts
	
.patch e:bea5
PressChainObjHdlr:
	; X is object index ($2b)
	; Okay to clobber A, X, Y??
	
	; Has the chain lifetime expired?
	dec $4e0, x
	beq +
	
	; Does the press still exist?
	ldy $110, x
	lda $420, y
	bpl +
	
	; Is it still a press?
	lda $400, y 
	cmp #PRESS_OBJ_IDX
	bne +
	
	jsr $efb3 ; Do collision detection
	
	rts
	
+
	; No more chain
	lsr $420, x
	
	rts

.patch f:e97f
	; Invert difficulty modes
	lda HardMode
	beq + ; Was bne +
	asl $00
+
	rts

.patch f:f26a
	; Invert difficulty modes
	lda HardMode
	bne $f2b6 ; Was beq $f2b6

; mm2ft frees up ca16-cb0b

; mm2ft frees up d192-d1de

; Bank $f free space f2e3-f2ff

; mm2ft reserves f300-f8ff for DPCM

; Bank $f free space ff87-ffdf
