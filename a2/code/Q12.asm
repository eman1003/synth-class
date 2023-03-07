; Q12: Made for the Ricoh 2A03 microprocessor used in Nintendo Entertainment System. Generated with assistance from Fami Studio

music_data_untitled:
	.db 1
	.dw .instruments
	.dw .samples-4
	.dw .song0ch0,.song0ch1,.song0ch2,.song0ch3,.song0ch4 ; 00 : Song 1
	.db LOW(.tempo_env_1_mid), HIGH(.tempo_env_1_mid), 0, 0

.instruments:
	.dw .env1,.env2,.env3,.env0 ; 00 : Instrument 1

.samples:

.env0:
	.db $00,$c0,$7f,$00,$02
.env1:
	.db $00,$cf,$7f,$00,$02
.env2:
	.db $c0,$7f,$00,$01
.env3:
	.db $7f,$00,$00

.tempo_env_1_mid:
	.db $03,$05,$80

.song0ch0:
.song0ch0loop:
	.db $46, LOW(.tempo_env_1_mid), HIGH(.tempo_env_1_mid), $ff, $ff, $bf, $47, $ff, $ff, $bf, $47, $ff, $ff, $bf, $47, $ff, $ff
	.db $bf, $47, $80
.song0ref22:
	.db $24, $b9, $22, $b9, $20, $f5, $00, $a5, $22, $91, $24, $91, $47, $25, $b9, $24, $b9, $22, $e1, $00, $e1, $47, $24, $b9
	.db $22, $b9, $20, $f5, $00, $a5, $22, $91, $24, $91, $47, $25, $b9, $24, $b9, $22, $a5, $20, $cd, $27, $b9, $00, $91, $47
	.db $25, $b9, $2c, $b9, $2a, $b9, $29, $b9, $00, $a5, $28, $87, $29, $87, $2a, $87, $2b, $87, $47, $2c, $a5, $27, $a5, $24
	.db $a5, $25, $a5, $00, $87, $23, $87, $22, $87, $21, $87, $20, $a5, $1d, $97, $1b, $99, $19, $97, $47
	.db $41, $24
	.dw .song0ref22
	.db $1b, $cd, $14, $87, $00, $87, $14, $87, $00, $87, $14, $91, $00, $b9, $47, $ff, $ff, $bf, $47, $ff, $ff, $bf, $42
	.dw .song0ch0loop
.song0ch1:
.song0ch1loop:
	.db $76, $80
.song0ref145:
	.db $20, $91, $25, $91, $27, $91, $29, $91, $2c, $91, $29, $91, $27, $91, $25, $91, $20, $91, $25, $91, $27, $91, $29, $91
	.db $2c, $91, $31, $91, $2c, $91, $27, $91
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
.song0ref198:
	.db $25, $91, $2a, $91, $2c, $91, $2e, $91, $31, $91, $2e, $91, $2c, $91, $2a, $91, $25, $91, $2a, $91, $2c, $91, $2e, $91
	.db $31, $91, $36, $91, $31, $91, $2c, $91
	.db $41, $20
	.dw .song0ref198
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
	.db $41, $20
	.dw .song0ref145
	.db $20, $91, $25, $91, $27, $91, $29, $91, $2c, $91, $29, $91, $27, $91, $25, $91, $20, $91, $1b, $91, $24, $87, $00, $87
	.db $24, $87, $00, $87, $24, $91, $00, $b9, $ff, $ff, $bf, $ff, $ff, $bf, $42
	.dw .song0ch1loop
.song0ch2:
.song0ch2loop:
	.db $ff, $ff, $bf, $ff, $ff, $bf, $80
.song0ref291:
	.db $14, $91, $00, $a5, $0f, $91, $00, $a5, $08, $91, $00, $e1, $0f, $91, $00, $91, $14, $91, $00, $91, $14, $91, $00, $a5
	.db $0f, $91, $00, $a5, $08, $91, $00, $e1, $0f, $91, $00, $91, $14, $91, $00, $91
	.db $41, $28
	.dw .song0ref291
	.db $41, $28
	.dw .song0ref291
	.db $19, $91, $00, $a5, $14, $91, $00, $a5, $08, $91, $00, $e1, $14, $91, $00, $91, $19, $91, $00, $91, $19, $91, $00, $a5
	.db $14, $91, $00, $a5, $08, $91, $00, $e1, $14, $91, $00, $91, $19, $91, $00, $91
	.db $41, $28
	.dw .song0ref291
	.db $14, $91, $00, $a5, $0f, $91, $00, $a5, $08, $91, $00, $e1, $0f, $91, $00, $91, $14, $91, $00, $91, $14, $91, $00, $a5
	.db $0f, $91, $00, $a5, $08, $91, $00, $b9, $08, $87, $00, $87, $08, $87, $00, $87, $08, $91, $00, $b9, $ff, $ff, $bf, $ff
	.db $ff, $bf, $42
	.dw .song0ch2loop
.song0ch3:
.song0ch3loop:
	.db $ff, $ff, $bf, $ff, $ff, $bf, $80
.song0ref441:
	.db $14, $83, $00, $8b, $19, $85, $00, $89, $14, $83, $00, $8b, $19, $85, $00, $89, $14, $83, $00, $8b, $19, $85, $00, $89
	.db $14, $83, $00, $8b, $19, $85, $00, $89, $14, $83, $00, $8b, $19, $85, $00, $89, $14, $83, $00, $8b, $19, $85, $00, $89
	.db $14, $83, $00, $8b, $19, $85, $00, $89, $14, $83, $00, $8b, $19, $85, $00, $19, $85, $00
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $42
	.dw .song0ref441
	.db $41, $28
	.dw .song0ref441
	.db $19, $87, $00, $87, $19, $87, $00, $87, $19, $91, $00, $b9, $ff, $ff, $bf, $ff, $ff, $bf, $42
	.dw .song0ch3loop
.song0ch4:
.song0ch4loop:
	.db $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf
	.db $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf, $ff, $ff, $bf
	.db $42
	.dw .song0ch4loop
