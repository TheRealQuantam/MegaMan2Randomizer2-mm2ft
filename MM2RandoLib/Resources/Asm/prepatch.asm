; Most of this file was autogenerated from the prepatch IPS, but it needs to be cleaned up and made clear what every single change is.
; NOTE: Because of how the prepatch is applied, it CANNOT use .reloc.

.include "mm2r.inc"

; The prepatch inverts its meaning in several places, effectively making it easy mode
HardMode = $cb

.segment "BANK0"
.org $b640
.byte $19, $1a, $1b, $1c, $1d, $1d, $1e, $1e, $1e, $1f, $20, $21, $22, $23, $25, $25
.byte $2a, $2a, $2a, $2a, $2a

.org $b73e
.byte $10, $10, $a0, $a0, $20, $30, $48, $b8, $48, $a8, $e8, $f0, $6c, $4c, $44, $98
.byte $10, $10, $28, $68, $98, $d8

.org $b840
.byte $a0, $a0, $30, $30, $bc, $ac, $9c, $ac, $9c, $bc, $5c, $64, $74, $b8, $38, $88
.byte $98, $98, $88, $88, $98

.org $b940
.byte $00, $00, $37, $39, $50, $50, $50, $50, $50, $50, $50, $4f, $4f, $46, $21, $21
.byte $63, $63, $63, $63, $64

.org $bb16
.byte $0b, $0b

.segment "BANK1"
.org $81a8
.byte $58, $60, $59, $61, $5a, $62, $5b, $63, $5c, $64, $00, $00

.org $81c0
.byte $68, $70, $69, $71, $40, $40, $40, $40, $00, $00, $68, $70, $6a, $72, $6b, $73
.byte $6c, $74, $00, $00

.org $81e8
.byte $78, $00, $79, $00, $7a, $00, $7b, $00, $7c, $00, $00

.org $8411
.byte $50, $50, $10, $55, $55, $11, $55, $55, $11, $40, $50, $50, $44, $55, $55, $44
.byte $55, $55

.org $846a
.byte $55, $55, $11, $44, $55, $55, $55, $00, $cc, $55, $11, $44, $55, $55, $ff, $ff
.byte $05, $05, $01, $04, $05, $05

.org $8574
.byte $6d, $75, $7d, $34, $26, $25, $00, $00, $6e, $76, $7e, $35, $23, $29, $00, $00
.byte $6f, $77, $7f

.org $85cb
.byte $6a, $70, $7a, $34, $23, $25, $00, $00, $6b, $73, $7b, $35, $23, $26, $25, $00
.byte $6c, $74, $7c

.org $85f3
.byte $6a, $70, $7a, $00, $00, $23, $36, $00, $6b, $73, $7b, $00, $00, $23, $36, $00
.byte $6c, $74, $7c

.org $8623
.byte $01

.org $862b
.byte $02

.org $8633
.byte $02

.org $864c
.byte $57, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00
.byte $57, $00, $3b, $00, $00, $00, $00, $00, $00, $3c, $23, $37, $00, $00, $00, $00
.byte $27, $3d, $23, $23, $00, $00, $00, $68, $23, $3d, $23, $23, $00, $00, $00, $5f
.byte $23, $3d, $23, $23, $00, $00, $00, $35, $23, $3d

.org $868c
.byte $35, $3d

.org $8695
.byte $3f

.org $869d
.byte $57, $5e

.org $86a6
.byte $69, $24, $28, $00, $00, $00, $6a, $70, $7a, $00, $23, $66, $00, $00, $6b, $73
.byte $7b, $00, $23, $65, $00, $00, $6c, $74, $7c, $00, $23, $24, $00, $00, $00, $00
.byte $00, $27, $28, $00, $00, $00, $57

.org $86dc
.byte $02

.org $86e4
.byte $57

.org $874f
.byte $00

.org $b60c
.byte $07, $08, $08, $09, $0a, $0a, $0c, $0c, $0e, $0e, $0f, $0f, $10, $11, $12, $12
.byte $13, $17, $17, $18, $1d, $1d, $1f, $20, $20, $22, $22, $22, $23, $23, $23

.org $b709
.byte $a0, $d0, $70, $c0, $38, $b0, $60, $38, $b8, $48, $b8, $00, $80, $10, $e0, $f0
.byte $60, $30, $e0, $c0, $10, $98, $10, $74, $9c, $90, $60, $f0, $00, $40, $90, $30
.byte $b0, $e0

.org $b80c
.byte $20, $20, $20, $20, $5c, $9c, $9b, $7b, $08, $50, $30, $30, $50, $30, $54, $30
.byte $08, $10, $10, $10, $24, $64, $80, $80, $80, $80, $6c, $0c, $0c, $0c, $0c

.org $b90c
.byte $00, $00, $00, $00, $50, $50, $40, $41, $39, $36, $37, $00, $36, $36, $00, $37
.byte $39, $2b, $2b, $2b, $4c, $4b, $4a, $47, $47, $4a, $30, $30, $30, $30, $30

.org $ba00
.byte $0a, $0a, $13, $13, $14, $14, $15, $15, $16, $18, $1b, $1b, $1b, $1b, $1c, $1c
.byte $1c

.org $ba18
.byte $1d, $1d, $1d, $1d, $26, $ff

.org $ba40
.byte $80, $80, $f8, $f8, $f8, $f8, $08, $08, $50, $58, $48, $68, $88, $a8, $58, $54
.byte $54, $64, $6c, $74, $84, $84, $94, $9c, $58, $58, $a0, $a0, $d0

.org $ba82
.byte $4f, $6f, $4f, $6f, $4f, $6f, $4a, $ba, $0f, $0f, $0f, $48, $48, $8c, $cc, $cc
.byte $8c, $cc, $8c, $cc, $cc, $8c, $8f, $bf, $98, $c8, $48

.org $bac2
.byte $2f, $2f, $2f, $2f, $2f, $2f, $78, $78, $57, $57, $57, $7a, $7b, $79, $79, $79

.org $bad8
.byte $57, $57, $7b, $7a, $76

.org $bb13
.byte $00, $04, $08, $1c, $1c

.segment "BANK2"
.org $8ac0
.byte $5a, $9e

.org $8ac8
.byte $44, $44, $44, $44, $44, $44, $4e, $4f, $44, $44, $44, $44, $44, $44, $4e, $4f
.byte $44, $44, $44, $44, $44, $44, $4e, $4f, $44, $44, $44, $44, $44, $44, $4e, $4f
.byte $44, $44

.org $8af0
.byte $44, $44, $44, $44, $44, $44, $4e, $4f, $63, $63, $63

.org $b625
.byte $1c, $1d, $1d, $25, $25, $26, $23

.org $b701
.byte $50, $98, $d0, $f8, $38, $88, $f0, $50

.org $b71f
.byte $30, $80, $10, $b0, $c0, $bc, $f0, $60, $f0, $2c, $cc, $5c, $80

.org $b820
.byte $20, $08, $08, $08, $c4, $94, $94, $94, $b4, $b4, $b4, $80

.org $b925
.byte $00, $71, $71, $4b, $4b, $4b, $56

.segment "BANK3"
.org $b612
.byte $0a, $0a, $0b, $0c, $0d, $0e, $0e, $0e, $0f, $10, $10, $11, $12, $13, $17, $18
.byte $1b, $1b, $1e, $1e, $1e, $1e, $1f, $20, $20, $20, $20, $21, $22, $23, $24, $25

.org $b70f
.byte $50, $68, $c8, $38, $d0, $d8, $70, $80, $00, $18, $88, $90, $30, $a0, $c0, $90
.byte $88, $c8, $78, $90, $b8, $10, $10, $d8, $f0, $48, $10, $10, $38, $f0, $58, $f0
.byte $9c, $b0, $ac

.org $b80f
.byte $b0, $48, $98, $40, $08, $54, $08, $08, $68, $88, $40, $90, $70, $08, $08, $08
.byte $08, $98, $b8, $78, $b8, $58, $98, $88, $a8, $28, $38, $b8, $48, $b8, $58, $a4
.byte $b4, $a4, $b4

.org $b914
.byte $00, $03, $05, $00, $00, $00, $0c, $0c, $09, $07, $07, $09, $34, $34, $34, $34
.byte $21, $21, $12, $21, $12, $21, $21, $12, $21, $12, $4e, $4f, $4e, $4f

.org $ba00
.byte $13, $13, $14, $14, $15, $15, $16, $16, $17, $1b, $26, $26, $26, $26, $26, $26
.byte $26, $ff

.org $ba40
.byte $f8, $f8, $f8, $f8, $08, $08, $38, $c8, $30, $b0, $08, $08, $38, $78, $88, $b8
.byte $c8

.org $ba80
.byte $4f, $6f, $4f, $6f, $4f, $6f, $ba, $ba, $98, $38, $8f, $af, $5f, $2f, $8f, $af
.byte $6f

.org $bac0
.byte $2f, $2f, $2f, $2f, $2f, $2f, $78, $78, $7b, $7a, $2f, $2f, $57, $57, $57, $57
.byte $57

.org $bb14
.byte $02, $06, $0a, $0a

.segment "BANK4"
.org $b60a
.byte $09, $0a, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $13, $14

.org $b70a
.byte $60, $10, $60

.org $b714
.byte $80, $a0, $f8, $e8

.org $b80a
.byte $48, $90, $08, $08

.org $b814
.byte $80, $48, $a4, $a4

.org $b90a
.byte $00, $23, $25, $27

.org $b914
.byte $14, $00, $4e, $4e

.org $ba0e
.byte $29, $29

.org $ba4e
.byte $50, $90

.org $ba8e
.byte $b8, $b8

.org $bace
.byte $78, $78

.org $bf0d
.byte $0a

.segment "BANK5"
.org $89c0
.byte $d6, $d7

.org $89c8
.byte $d1, $d1

.org $89d0
.byte $d1, $d1

.org $89d8
.byte $d1, $d1

.org $89e0
.byte $d1, $d1

.org $89e8
.byte $d1, $d1

.org $89f0
.byte $d1, $d1

.org $89f8
.byte $d9, $da

.org $8ff0
.res $300, $00

.org $b60d
.byte $0e, $0f, $0f, $11, $1a, $1a, $1a, $1a, $1b, $1b, $1b, $1b, $1b, $1c, $1c, $1c
.byte $1c, $1d, $1d, $1d, $1e, $1e, $1e

.org $b708
.byte $50, $d8, $88, $68, $f8, $d8, $38, $c0, $08, $18, $58, $b0, $d0, $28, $48, $70
.byte $b0, $e8, $28, $78, $a0, $c8, $68, $90, $b8, $30, $78, $b0

.org $b808
.byte $94, $6c, $b0, $b4, $b4, $34, $c4, $c4, $84, $34, $44, $24, $44, $24, $34, $44
.byte $34, $54

.org $b820
.byte $64, $64, $44, $44

.org $b90d
.byte $00, $4e, $00, $4e

.org $b922
.byte $73, $72

.org $ba12
.byte $19, $19

.org $ba52
.byte $30, $50

.org $ba92
.byte $b8, $b8

.org $bad2
.byte $78, $78

.segment "BANK6"
.org $b605
.byte $04, $04, $05, $06, $07, $0c, $0c, $0d, $0e, $0f, $0f, $10, $10, $11, $12, $12
.byte $13, $13

.org $b705
.byte $38, $e0, $f0, $78, $18, $60, $c8, $e0, $60, $10, $58, $18, $e8, $b8, $38, $a8
.byte $38, $98

.org $b805
.byte $b4, $08, $08, $74, $08, $40, $48, $58, $48, $38, $78, $48, $18, $b8, $98, $98
.byte $88, $88

.org $b908
.byte $00, $4a, $29, $29, $29, $29, $29, $31, $31, $31, $46, $46, $46, $46, $46

.segment "BANK7"
.org $b616
.byte $08, $0a, $0a, $0b, $0b, $0c, $0c, $0d, $0e, $0e, $10, $11, $11

.org $b700
.byte $38, $60, $d0, $30, $a8, $d0

.org $b711
.byte $08, $d8, $f0, $f0, $18, $68, $20, $48, $20, $a8, $20, $a0, $30, $20, $6c, $e0
.byte $40, $a8

.org $b800
.byte $80, $34, $74, $54, $58, $a4

.org $b816
.byte $70, $20, $58, $20, $b8, $20, $74, $54, $30, $64, $10, $10, $10

.org $b916
.byte $00, $56, $34, $56, $34, $56, $37, $37, $37, $4b, $2b, $2b, $2b

.segment "BANK8"
.org $8b05
.byte $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.byte $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.byte $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.byte $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.byte $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.byte $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.byte $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.byte $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.org $8b82
.res $e, $00

.org $8b90
.byte $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.byte $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $8baf
.res $20, $00

.org $8bd0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0, $00, $00
.byte $00, $00

.org $8c06
.byte $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80, $07
.byte $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03, $e1
.byte $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80, $c0
.byte $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00, $00
.byte $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00, $00
.byte $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08, $10
.byte $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0, $c0
.byte $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.org $8c80
.res $10, $00

.org $8c90
.byte $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.byte $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $8cb0
.res $1f, $00

.org $8cd0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0, $00, $00
.byte $00, $00

.org $8cf8
.res $d, $00

.org $8d05
.byte $01, $02, $02

.org $8d0e
.byte $03, $03, $00, $00, $1f, $60, $80, $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff
.byte $ff, $f8, $00, $00, $f8, $0e, $03, $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff
.byte $ff, $1f, $00, $00, $00, $00, $80, $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0
.byte $c0, $e0, $04, $04, $04, $07, $00, $00, $00, $00, $07, $07, $07, $07, $00, $00
.byte $00, $00, $30, $60, $60, $e0, $00, $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00
.byte $00, $00, $08, $04, $04, $04, $08, $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f
.byte $3f, $ff, $60, $60, $60, $60, $e0, $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0
.byte $c0, $80

.org $8d80
.res $10, $00

.org $8d90
.byte $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.byte $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $8daf
.res $20, $00

.org $8dd0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.org $8dee
.res $17, $00

.org $8e05
.byte $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.byte $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.byte $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.byte $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.byte $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.byte $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.byte $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.byte $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.org $8e80
.res $10, $00

.org $8e90
.byte $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.byte $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $8ec0
.res $a, $00

.org $8ed0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.org $8ef2
.res $5, $00

.org $9005
.byte $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.byte $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.byte $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.byte $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.byte $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.byte $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.byte $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.byte $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.org $9080
.res $10, $00

.org $9090
.byte $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.byte $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $90af
.res $1e, $00

.org $90d0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.org $90ee
.res $17, $00

.org $9105
.byte $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.byte $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.byte $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.byte $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.byte $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.byte $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.byte $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.byte $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.org $9180
.res $10, $00

.org $9190
.byte $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.byte $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $91af
.res $20, $00

.org $91d0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.org $91ee
.res $16, $00

.org $9205
.byte $01, $02, $02, $00, $00, $00, $00, $00, $01, $03, $03, $00, $00, $1f, $60, $80
.byte $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff, $ff, $f8, $00, $00, $f8, $0e, $03
.byte $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff, $ff, $1f, $00, $00, $00, $00, $80
.byte $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0, $c0, $e0, $04, $04, $04, $07, $00
.byte $00, $00, $00, $07, $07, $07, $07, $00, $00, $00, $00, $30, $60, $60, $e0, $00
.byte $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00, $00, $00, $08, $04, $04, $04, $08
.byte $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f, $3f, $ff, $60, $60, $60, $60, $e0
.byte $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0, $c0, $80

.org $9288
.byte $00, $00, $00, $00, $00, $00, $00, $00, $01, $02, $02, $04, $04, $04, $07, $00
.byte $01, $03, $03, $07, $07, $07, $07, $00, $07, $1e, $38, $30, $60, $60, $e0, $00
.byte $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $92b0
.res $1f, $00

.org $92d0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.org $92ee
.res $11, $00

.org $9306
.byte $02, $02

.org $930e
.byte $03, $03, $00, $00, $1f, $60, $80, $07, $1f, $38, $00, $00, $1f, $7f, $ff, $ff
.byte $ff, $f8, $00, $00, $f8, $0e, $03, $e1, $f0, $18, $00, $00, $f8, $fe, $ff, $ff
.byte $ff, $1f, $00, $00, $00, $00, $80, $c0, $c0, $e0, $00, $00, $00, $00, $80, $c0
.byte $c0, $e0, $04, $04, $04, $07, $00, $00, $00, $00, $07, $07, $07, $07, $00, $00
.byte $00, $00, $30, $60, $60, $e0, $00, $00, $00, $00, $f0, $e0, $e0, $e0, $00, $00
.byte $00, $00, $08, $04, $04, $04, $08, $10, $21, $c3, $0f, $07, $07, $07, $0f, $1f
.byte $3f, $ff, $60, $60, $60, $60, $e0, $c0, $c0, $80, $e0, $e0, $e0, $e0, $e0, $c0
.byte $c0, $80

.org $9380
.res $c, $00

.org $9390
.byte $01, $02, $02, $04, $04, $04, $07, $00, $01, $03, $03, $07, $07, $07, $07, $00
.byte $07, $1e, $38, $30, $60, $60, $e0, $00, $ff, $fe, $f8, $f0, $e0, $e0, $e0

.org $93af
.res $11, $00

.org $93d0
.byte $07, $0c, $08, $08, $0c, $07, $00, $00, $07, $0f, $0f, $0f, $0f, $07, $00, $00
.byte $e0, $f0, $70, $70, $f0, $e0, $00, $00, $e0, $f0, $f0, $f0, $f0, $e0

.org $93ee
.res $11, $00

.segment "BANK9"
.org $aa40
.byte $f8, $20, $20, $20, $11, $1b, $15, $11

.org $aa61
.byte $fe, $06, $0c, $18, $38, $38, $38

.org $aa80
.byte $00, $7c, $c6, $06, $3c, $06, $c6, $7c

.org $aa90
.byte $00, $cc, $cc, $cc, $cc, $fe, $0c, $0c

.org $aaa1
.byte $fe, $c0, $fc, $06, $06, $c6, $7c

.org $aab1
.byte $7c, $c6, $c0, $fc, $c6, $c6, $7c

.org $aac0
.byte $70, $f0, $ff, $ff, $ff, $ff, $ff, $fc, $70, $f0, $ff, $ff, $ff, $e0, $e3, $e0
.byte $07, $07, $ff, $ff, $ff, $ff, $f8, $38, $07, $07, $ff, $ff, $ff, $1f, $80, $00
.byte $ff, $ff, $f0, $00, $00, $00, $c0, $c0, $ff, $ff, $f0, $00, $00, $00, $00, $00
.byte $1c, $1f, $1c, $1c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $3b, $e3, $7b, $3b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $e5, $67, $67, $b7, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $c7, $6e, $6e, $67, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $cf, $dd, $dd, $8f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $2f, $b5, $b5, $35, $00, $00, $00, $00

.org $ab4e
.byte $00, $00, $07, $b1, $b3, $b7, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $e7, $cc, $8f, $e7, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $9b, $dc, $1c, $dc, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $80

.org $ab81
.res $e, $00

.org $ab97
.byte $30

.org $ab9e
.res $32, $00

.org $adb1
.byte $3c, $66, $06, $0c, $18, $00, $18

.org $b010
.byte $00, $03, $03, $07, $07, $0f, $0f, $0f, $03, $04, $04, $08, $08, $10, $10, $10
.byte $00, $f8, $f8, $fc, $fc, $fe, $fe, $ff, $f8, $04, $04, $02, $02, $01, $01, $00
.byte $00, $03, $07, $0f, $1f, $3f, $7f, $ff, $03, $04, $08, $10, $20, $40, $80, $00
.byte $00, $f8, $f8, $f0, $f0, $f0, $f0, $e0, $fc, $04, $04, $08, $08, $09, $09, $11
.byte $00, $3f, $7f, $7f, $7f, $ff, $fc, $fc, $7f, $40, $80, $80, $80, $00, $03, $02
.byte $00, $ff, $ff, $ff, $ff, $ff, $00, $00, $ff, $00, $00, $00, $00, $00, $ff, $00
.byte $00, $c0, $80, $83, $87, $0f, $0f, $1f, $e0, $20, $43, $44, $48, $90, $90, $20
.byte $00, $3f, $ff, $ff, $ff, $ff, $ff, $e3, $3f, $c0, $00, $00, $00, $00, $00, $1c
.byte $00, $00, $c0, $e0, $e0, $f0, $f0, $f0, $00, $c0, $20, $10, $10, $08, $08, $08
.byte $00, $00, $00, $01, $01, $03, $07, $07, $00, $01, $01, $02, $02, $04, $08, $08
.byte $00, $fe, $fe, $fe, $fe, $fe, $de, $de, $fe, $01, $01, $01, $01, $01, $21, $21
.byte $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00
.byte $00, $0f, $1f, $1f, $1f, $3f, $3f, $7f, $1f, $10, $20, $20, $20, $40, $40, $80
.byte $00, $01, $83, $87, $cf, $df, $ff, $ff, $81, $82, $44, $48, $30, $20, $00, $00
.byte $ff, $7f, $3f, $1f, $0f, $07, $03, $01, $ff, $7f, $3f, $1f, $0f, $07, $03, $01
.byte $ff, $ff, $ff, $ff, $ff, $fe, $fe, $fe, $ff, $ff, $ff, $ff, $ff, $fe, $fe, $ff
.byte $9f, $9f, $bf, $3f, $00, $7f, $00, $ff, $a0, $a0, $c0, $40, $7f, $80, $ff, $00
.byte $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $ff, $00, $ff, $00
.byte $ff, $ff, $ff, $ff, $00, $ff, $00, $ff, $00, $00, $00, $00, $ff, $00, $ff, $00
.byte $e2, $e1, $e1, $c5, $04, $c3, $00, $8b, $13, $12, $12, $26, $e7, $24, $e7, $4c
.byte $f8, $f8, $f8, $ff, $00, $ff, $00, $f0, $04, $04, $07, $00, $ff, $00, $ff, $0f
.byte $00, $ff, $03, $fb, $01, $f1, $01, $03, $00, $ff, $ff, $07, $f9, $09, $f1, $f3
.byte $1f, $bf, $bf, $bf, $00, $7e, $00, $7e, $20, $c0, $c0, $c0, $ff, $81, $ff, $81
.byte $c1, $80, $07, $0f, $10, $0f, $20, $27, $22, $43, $87, $8f, $1f, $10, $3f, $38
.byte $f1, $01, $01, $01, $0f, $ef, $03, $e2, $09, $f9, $01, $01, $ff, $1f, $f3, $13
.byte $ef, $ef, $df, $be, $80, $7c, $00, $00, $f0, $f0, $e0, $c1, $ff, $82, $ff, $ff
.byte $9f, $1f, $1f, $1f, $00, $1f, $00, $00, $60, $a0, $a0, $20, $3f, $20, $ff, $ff
.byte $1f, $1f, $1e, $1e, $1c, $1d, $1c, $48, $9f, $9f, $9f, $9f, $9f, $9e, $9f, $8f
.byte $7f, $7f, $ff, $ff, $00, $fd, $00, $00, $80, $80, $00, $00, $ff, $02, $fd, $fc
.byte $ff, $ff, $ff, $ff, $00, $e7, $00, $00, $00, $00, $00, $00, $ff, $18, $e7, $87
.byte $00, $ff, $ff, $fe, $fe, $fe, $fe, $fc, $ff, $00, $00, $01, $01, $01, $01, $02
.byte $fc, $7c, $38, $18, $0b, $00, $03, $07, $fd, $7d, $3b, $1b, $0c, $07, $04, $08
.byte $00, $00, $00, $00, $fe, $00, $fc, $f8, $ff, $ff, $ff, $ff, $01, $fe, $02, $04
.byte $00, $00, $00, $00, $00, $01, $67, $7f, $ff, $ff, $fe, $78, $20, $01, $67, $7f
.byte $00, $00, $00, $00, $3f, $80, $7f, $7f, $ff, $bf, $3f, $7f, $40, $ff, $80, $80
.byte $08, $08, $00, $00, $17, $10, $0f, $0f, $cf, $cf, $cf, $8f, $98, $9f, $90, $90
.byte $00, $00, $03, $00, $ff, $00, $ff, $ff, $f8, $f0, $f3, $ff, $00, $ff, $00, $00
.byte $03, $03, $ff, $03, $fb, $01, $f1, $f1, $03, $03, $ff, $ff, $07, $f9, $09, $09
.byte $00, $00, $00, $7f, $00, $bf, $bf, $df, $ff, $ff, $ff, $80, $ff, $c0, $c0, $e0
.byte $30, $00, $00, $ff, $00, $ff, $fe, $fc, $37, $8f, $ff, $00, $ff, $00, $01, $02
.byte $02, $04, $03, $88, $07, $17, $0f, $20, $e3, $e7, $e4, $4f, $c8, $98, $10, $3f
.byte $00, $00, $ff, $00, $e0, $e0, $c3, $03, $ff, $ff, $00, $ff, $10, $10, $23, $e3
.byte $00, $00, $ff, $00, $1f, $1f, $c0, $f0, $ff, $ff, $00, $ff, $60, $20, $ff, $f0
.byte $08, $07, $80, $0f, $8f, $80, $08, $08, $cf, $c8, $4f, $c0, $50, $5f, $c8, $08
.byte $00, $f0, $01, $e1, $c3, $03, $07, $07, $f8, $08, $f1, $11, $23, $e3, $07, $07
.byte $00, $97, $f0, $ef, $e0, $f8, $f8, $ff, $0f, $98, $ff, $f0, $ff, $f8, $f8, $ff
.byte $fc, $fc, $f8, $f8, $00, $f8, $00, $01, $02, $02, $04, $04, $fc, $04, $f8, $f9
.byte $07, $0f, $0f, $00, $00, $00, $00, $00, $08, $10, $10, $1f, $00, $00, $00, $00
.byte $f8, $f0, $f1, $01, $07, $03, $01, $00, $04, $08, $09, $f1, $07, $03, $01, $00
.byte $fe, $fe, $fe, $ff, $ff, $ff, $ff, $ff

.org $b330
.byte $fe, $fe, $00, $80, $80, $ff, $ff, $ff, $01, $01, $ff, $80, $80, $ff, $ff, $ff
.byte $0f, $20, $38, $38, $3f, $ff, $ff, $ff, $10, $3f, $38, $38, $3f, $ff, $ff, $ff
.byte $ff, $00, $00, $00, $ff, $ff, $ff, $ff, $00, $ff, $00, $00, $ff, $ff, $ff, $ff
.byte $e1, $03, $03, $03, $ff, $ff, $ff, $ff, $11, $f3, $03, $03, $ff, $ff, $ff, $ff
.byte $e7, $f0, $f8, $fe, $ff, $ff, $ff, $ff, $f8, $f7, $f8, $fe, $ff, $ff, $ff, $ff
.byte $f0, $00, $01, $07, $ff, $ff, $ff, $ff, $08, $e0, $01, $07, $ff, $ff, $ff, $ff
.byte $70, $f0, $ff, $ff, $ff, $ff, $ff, $f8, $70, $f0, $ff, $ff, $ff, $ff, $ff, $f8
.byte $07, $07, $ff, $ff, $ff, $ff, $f0, $00, $07, $07, $ff, $ff, $ff, $ff, $f0, $00
.byte $f0, $ff, $ff, $ff, $ff, $c0, $00, $00, $f0, $ff, $ff, $ff, $ff, $c0, $00, $00
.byte $0f, $ff, $ff, $fc, $00, $00, $00, $00, $0f, $ff, $ff, $fc, $00, $00, $00, $00
.byte $ff, $ff, $f0, $00, $00, $00, $00, $00, $ff, $ff, $f0, $00, $00, $00, $00, $00
.byte $ff, $c0, $00, $00, $00, $00, $00, $00, $ff, $c0, $00, $00, $00, $00, $00, $00
.byte $01, $e0, $00, $e0, $03, $02, $03, $fe, $f9, $11, $f3, $13, $f3, $02, $03, $fe
.byte $03, $07, $07, $07, $0f, $0f, $0f, $0f, $00, $04, $00, $00, $08, $00, $00, $00
.byte $00, $00, $01, $01, $01, $00, $00, $00, $00, $00, $01, $01, $01, $00, $00, $00
.byte $7f, $3f, $1f, $0f, $07, $03, $01, $00, $7f, $3f, $1f, $0f, $07, $03, $01, $00
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $f8
.byte $ff, $ff, $ff, $ff, $ff, $ff, $e0, $00, $ff, $ff, $ff, $ff, $ff, $ff, $e0, $00
.byte $ff, $ff, $ff, $ff, $fc, $00, $00, $00, $ff, $ff, $ff, $ff, $fc, $00, $00, $00
.byte $ff, $ff, $ff, $f0, $00, $00, $00, $00, $ff, $ff, $ff, $f0, $00, $00, $00, $00
.byte $ff, $ff, $c0, $00, $00, $00, $00, $00, $ff, $ff, $c0, $00, $00, $00, $00, $00
.byte $fc, $00, $00, $00, $00, $00, $00, $00, $fc, $00, $00, $00, $00, $00, $00, $00
.byte $00, $00, $03, $0f, $1f, $3f, $7f, $ff, $00, $00, $02, $08, $00, $00, $00, $00
.byte $1f, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $18, $80, $00, $00, $00, $00, $00, $00
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $03, $00, $00, $00, $00, $00, $00, $00
.byte $00, $e0, $f8, $fc, $fe, $ff, $ff, $ff, $00, $20, $08, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $00, $80, $c0, $00, $00, $00, $00, $00, $00, $00, $40
.byte $18, $30, $b0, $60, $e0, $c0, $80, $00, $d8, $b0, $30, $60, $e0, $c0, $80, $00
.byte $00, $00, $00, $00, $00, $00, $01, $01, $80, $80, $80, $00, $00, $01, $02, $02
.byte $00, $1f, $3f, $7f, $7f, $f7, $f7, $e7, $3f, $20, $40, $80, $80, $08, $08, $18
.byte $00, $80, $80, $80, $80, $80, $a0, $c0, $80, $40, $40, $40, $40, $40, $40, $20
.byte $00, $0f, $0f, $1f, $1f, $1f, $3f, $3f, $0f, $10, $10, $20, $20, $20, $40, $40
.byte $00, $80, $81, $c1, $c3, $e3, $f7, $f7, $81, $41, $42, $22, $24, $14, $08, $08
.byte $00, $f8, $f8, $f0, $f0, $f0, $e0, $e0, $fc, $04, $04, $08, $08, $08, $10, $11
.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $07, $1f, $7f, $ff
.byte $00, $00, $00, $00, $00, $00, $00, $00, $0f, $1f, $7f, $ff, $ff, $ff, $ff, $ff
.byte $00, $00, $00, $00, $00, $01, $03, $07, $ff, $ff, $ff, $ff, $fe, $fd, $fb, $f7
.byte $01, $01, $03, $03, $07, $07, $07, $00, $00, $00, $00, $00, $00, $00, $00, $0f
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff
.byte $ff, $ff, $fc, $f3, $ef, $df, $bc, $b8, $00, $00, $04, $13, $2f, $5f, $3c, $b8
.byte $ff, $ff, $0f, $f3, $fd, $01, $00, $00, $00, $00, $08, $f0, $fc, $01, $00, $00
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $ff
.byte $c0, $e0, $e0, $f0, $f0, $f0, $f0, $04, $00, $20, $00, $10, $00, $00, $00, $f4
.byte $80, $00, $00, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00
.byte $3b, $77, $77, $6f, $c0, $df, $80, $00, $3c, $78, $78, $70, $ff, $e0, $ff, $ff
.byte $c7, $c7, $87, $87, $00, $ff, $00, $00, $28, $28, $48, $48, $ff, $00, $ff, $ff
.byte $c7, $c7, $c7, $c7, $06, $c6, $12, $00, $27, $27, $27, $27, $e7, $27, $e3, $f3
.byte $bf, $7f, $7f, $7f, $00, $ff, $00, $00, $c0, $80, $80, $80, $ff, $00, $ff, $ff
.byte $ff, $ff, $ff, $ff, $00, $ff, $00, $00, $00, $00, $00, $00, $ff, $00, $ff, $ff
.byte $e3, $c3, $c7, $c7, $0f, $80, $00, $3f, $13, $23, $27, $27, $cf, $5f, $df, $80
.byte $ff, $ff, $ff, $fc, $00, $00, $00, $fe, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00
.byte $ff, $ff, $f1, $04, $13, $2f, $9f, $7e, $ff, $ff, $fe, $f8, $e3, $cf, $1f, $7e
.byte $ff, $c0, $3c, $f8, $e0, $c0, $00, $00, $ff, $c0, $3c, $f8, $e0, $c0, $00, $00
.byte $0f, $00, $00, $00, $00, $01, $01, $00, $00, $0f, $0f, $00, $00, $01, $01, $00
.byte $ff, $00, $00, $00, $ff, $ff, $ff, $00, $00, $ff, $ff, $00, $ff, $ff, $ff, $00
.byte $78, $70, $70, $70, $e0, $e0, $e0, $00, $78, $70, $70, $70, $e0, $e0, $e0, $00
.byte $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $03, $07
.byte $ff, $00, $ff, $00, $00, $ff, $00, $00, $00, $ff, $00, $ff, $ff, $00, $ff, $ff
.byte $f4, $04, $f4, $04, $14, $f4, $0c, $28, $04, $f4, $04, $f4, $e4, $14, $ec, $c8

.org $b6e0
.res $f, $00

.org $b6f0
.byte $7f, $00, $fc, $00, $00, $01, $f8, $00, $80, $ff, $02, $fc, $00, $01, $f8, $00
.byte $ff, $00, $03, $00, $f8, $c0, $00, $00, $00, $ff, $0c, $07, $f8, $c0, $00, $00
.byte $e1, $00, $e3, $00, $00, $00, $00, $00, $12, $f3, $14, $f7, $00, $00, $00, $00
.byte $f8, $00, $f8, $00, $00, $01, $01, $03, $04, $fc, $04, $f8, $00, $00, $00, $00
.byte $7f, $00, $3e, $80, $ff, $ff, $ff, $ff, $80, $ff, $41, $7f, $00, $00, $00, $00
.byte $00, $00, $7f, $00, $fe, $ff, $ff, $ff, $bf, $bf, $00, $7f, $00, $00, $00, $00
.byte $09, $27, $df, $3f, $fc, $ff, $ff, $ff, $f1, $c7, $1f, $3f, $fc, $00, $00, $00
.byte $f8, $f0, $c0, $00, $00, $ff, $ff, $ff, $f8, $f0, $c0, $00, $00, $00, $00, $00
.byte $00, $00, $00, $00, $00, $ff, $fe, $fe, $00, $00, $00, $00, $00, $00, $00, $00
.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $00

.org $b790
.byte $fc, $fc, $fd, $fd, $fd, $f9, $fb, $fb, $02, $00, $01, $01, $05, $01, $03, $03
.byte $00, $00, $e0, $c0, $c0, $c0, $c0, $80, $00, $00, $e0, $c0, $c0, $c0, $c0, $80
.byte $00, $ff, $ff, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $00, $00, $00
.byte $03, $ff, $ff, $ff, $ff, $00, $00, $00, $03, $ff, $ff, $ff, $ff, $00, $00, $00
.byte $80, $80

.org $b7d9
.byte $80, $00

.segment "BANKB"
.org $a929
	; Invert difficulty modes
	lda HardMode
	beq + ; Was bne +
	asl $00
+
	rts

.org $ae4a
.byte $20, $12, $01, $0e, $04, $0f, $0d, $09, $1a, $05, $12, $20

.org $b02f
.byte $12, $1c

.segment "BANKD"
; The title screen background palette is at abbe-abcc

.org $aac0
.byte $11, $2c, $15, $0f, $30, $2c, $15, $26, $26, $27, $15

; The title screen attributes map is at b2f1-b330

.org $b31a
.byte $5a, $99, $55, $55, $55, $55, $55, $66, $aa, $08, $00, $00, $01, $05, $55, $65
.byte $a5

; End of title screen attributes map at b330

; The title screen tile map is at b351-b710 (32x30). For some reason the rows are stored in reverse order, so the first row in the ROM is the bottom row.

REL_ORG_BASE $b351

; Clear the field
REL_TILE_RECT_FILL 0, 0, 32, 14, 0, 1
REL_TILE_RECT_FILL 0, 14, 24, 17, 0, 1
REL_TILE_RECT_FILL 0, 17, 20, 30, 0, 1

; Default title logo
;;; TODO: Move this to an IPS?
TITLE_REL_TILE 24, 4
.byte $49, $4a, $4b, $4c, $4d

TITLE_REL_TILE 18, 5
.byte $c0, $00, $00, $00, $00, $58, $59, $5a, $5b, $5c, $5d

TITLE_REL_TILE 23, 6
.byte $68, $69, $6a, $6b, $6c, $6d, $6e

TITLE_REL_TILE 4, 7
.byte $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $1f, $4f
.byte $50, $51, $52, $53, $54, $55, $56, $57, $4e

TITLE_REL_TILE 2, 8
.byte $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e
.byte $2f, $5f, $60, $61, $62, $63, $64, $65, $66, $67

TITLE_REL_TILE 3, 9
.byte $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $3f
.byte $6f, $70, $71, $72, $73, $74, $75, $76, $77

TITLE_REL_TILE 3, 10
.byte $30, $31, $32, $33, $34, $35, $36, $37, $38, $ac, $ad, $3b, $3c, $ae, $3e, $b9
.byte $00, $00, $00, $40, $78, $78, $78, $78, $79, $7a

TITLE_REL_TILE 5, 11
.byte $42, $43, $44, $45, $46, $47, $48, $af, $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7
.byte $00, $41, $7b, $7b, $7b, $7b, $7c, $7d

; Difficulties in their altered positions
TITLE_REL_TILE 8, 19
.byte $ce, $cf, $d2, $cd, $c1, $cc ; "NORMAL"

TITLE_REL_TILE 8, 21
.byte $c5, $c1, $d3, $d9 ; "EASY"

; End of title screen tile map at b710

.segment "BANKE"

; Change last byte of Table_BossRushBGColor ??
.org $84a2
.byte $0a ; Was $21 (??)

.segment "BANKF"
.org $e97f
	; Invert difficulty modes
	lda HardMode
	beq + ; Was bne +
	asl $00
+
	rts

.org $f26a
	; Invert difficulty modes
	lda HardMode
	bne $f2b6 ; Was beq $f2b6
