.segment "RODATA"

.scope GrassData
; ----------------------------------- ;
; metatile defs max 128 tiles 128*2=256)
MetatileTop:
  .byte $00,$00
  .byte $08,$09
  .byte $0A,$0B
  .byte $0C,$0D
  .byte $0E,$0F
  .byte $28,$29
  .byte $2A,$2B
  .byte $2C,$2D
  .byte $2E,$2F
  .byte $01,$01
  .byte $8C,$8D
  .byte $8E,$8F
  .byte $AC,$AD
  .byte $AE,$AF
  .byte $CC,$CD
  .byte $CE,$CF
  .byte $EC,$ED
  .byte $EE,$EF
  .byte $B8,$B8
  .byte $02,$03
  .byte $15,$15
  .byte $42,$43
  .byte $44,$45
  .byte $57,$57
  .byte $C2,$C3
  .byte $E2,$E3

MetatileBottom:
  .byte $00,$00
  .byte $18,$19
  .byte $1A,$1B
  .byte $1C,$1D
  .byte $1E,$1F
  .byte $38,$39
  .byte $3A,$3B
  .byte $3C,$3D
  .byte $3E,$3F
  .byte $01,$01
  .byte $9C,$9D
  .byte $9E,$9F
  .byte $BC,$BD
  .byte $BE,$BF
  .byte $DC,$DD
  .byte $DE,$DF
  .byte $FC,$FD
  .byte $FE,$FF
  .byte $B8,$B8
  .byte $12,$13
  .byte $15,$15
  .byte $52,$53
  .byte $54,$55
  .byte $57,$57
  .byte $D2,$D3
  .byte $F2,$F3

Screen1:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$10,$11,$00,$00,$00,$00,$15,$16,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$0E,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$0C,$0D,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$0A,$0B,$00,$00,$00,$00,$00,$00,$00,$10,$11,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0E,$0F,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$0D,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$0B,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$05,$06,$07,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$01,$02,$03,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

Screen1Attrib:
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55

Screen2:
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$13,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$19,$00,$00,$00,$00
  .byte $00,$00,$13,$00,$00,$00,$00,$00,$00,$00,$00,$18,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$13,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$13,$00,$00,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$19,$00,$00,$00,$00,$00,$00,$00,$00
  .byte $00,$00,$00,$00,$00,$00,$00,$18,$00,$00,$00,$00,$13,$00,$00,$00
  .byte $00,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
Screen2Attrib:
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55
  .byte $55,$55,$55,$55,$55,$55,$55,$55

ScreensLow:
  .byte <Screen1
  .byte <Screen2
  .byte <Screen1
  .byte <Screen2
  .byte <Screen1
  .byte <Screen2
  .byte <Screen1
  .byte <Screen2
  .byte <Screen1
  .byte <Screen2
  .byte <Screen1
  .byte <Screen2

ScreensHigh:
  .byte >Screen1
  .byte >Screen2
  .byte >Screen1
  .byte >Screen2
  .byte >Screen1
  .byte >Screen2
  .byte >Screen1
  .byte >Screen2
  .byte >Screen1
  .byte >Screen2
  .byte >Screen1
  .byte >Screen2

AttribsLow:
  .byte <Screen1Attrib
  .byte <Screen2Attrib
  .byte <Screen1Attrib
  .byte <Screen2Attrib
  .byte <Screen1Attrib
  .byte <Screen2Attrib
  .byte <Screen1Attrib
  .byte <Screen2Attrib
  .byte <Screen1Attrib
  .byte <Screen2Attrib
  .byte <Screen1Attrib
  .byte <Screen2Attrib

AttribsHigh:
  .byte >Screen1Attrib
  .byte >Screen2Attrib
  .byte >Screen1Attrib
  .byte >Screen2Attrib
  .byte >Screen1Attrib
  .byte >Screen2Attrib
  .byte >Screen1Attrib
  .byte >Screen2Attrib
  .byte >Screen1Attrib
  .byte >Screen2Attrib
  .byte >Screen1Attrib
  .byte >Screen2Attrib

PaletteTable:
; bg
  .byte $21,$07,$17,$27
  .byte $21,$0f,$22,$20
  .byte $21,$04,$14,$34
  .byte $21,$19,$29,$39

; sprites
  .byte $21,$00,$10,$20 ; grey
  .byte $21,$09,$1a,$3a ; green
  .byte $21,$17,$27,$38 ; orange
  .byte $21,$15,$25,$35 ; pink

.endscope
