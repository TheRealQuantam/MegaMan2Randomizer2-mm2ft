.include "mm2r.inc"

.segment "BANKE"

.org $8911 ; Mega Man Walk, Air X-Velocity Integer
	.byte 3, 3

.org $891c ; Mega Man Walk, Air X-Velocity Fraction
	.byte 0, 0

.org $86df ; Mega Man Ladder Climb Up Integer
	.byte 1

.org $871e ; Mega Man Ladder Climb Down Integer
	.byte $fe

.segment "BANKF"

.org $d497 ; Buster Projectile X-Velocity Integer (J: d494)
	.byte 8
