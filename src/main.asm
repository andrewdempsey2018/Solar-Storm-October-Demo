.include "macros.asm"
.include "constants.inc" 
.include "header.inc"
.include "reset.asm"
.include "controllers.asm"
.include "load_row.asm"
.include "ClearOAM.asm"
.include "init_nametable.asm"
.include "load_levels.asm"
.include "player.asm"
.include "enemies.asm"
.include "enemy_bullets.asm"
.include "player_bullets.asm"
.include "gameplay_level.asm"
.include "lib/famitone2.s"

.segment "ZEROPAGE"
sleeping: .res 1
buttons_held: .res 1
buttons_pressed: .res 1
timer: .res 1

nametable_number: .res 1
row_address: .res 2
level_data: .res 2
scroll_y: .res 1
screen_counter: .res 1
prep_next_row: .res 1

metatile_row_number: .res 1

; --------------------------------------------------
; scratch area
; --------------------------------------------------
zp_scratch_00: .res 1
zp_scratch_01: .res 2
zp_scratch_01_lo = zp_scratch_01
zp_scratch_01_hi = zp_scratch_01+1
zp_scratch_02: .res 1
zp_scratch_03: .res 1
zp_scratch_04: .res 1

do_render: .res 1
do_scroll: .res 1

; --------------------------------------------------
; Pointers required for rendering levels
; --------------------------------------------------
layout_pointer: .res 2
metatile_top_pointer: .res 2
metatile_bottom_pointer: .res 2
attribs_pointer: .res 2
screens_lo_pointer: .res 2
screens_hi_pointer: .res 2
attribs_lo_pointer: .res 2
attribs_hi_pointer: .res 2
scene_number: .res 1

player_bullet_gfx: .res 1
player_bullet_palette: .res 1

.segment "BSS"
row_data: .res 64
attrib_data: .res 8

.segment "CODE"

.proc irq_handler
  rti
.endproc

.proc nmi_handler
  SAVE_REGISTERS

  lda #$00
  sta OAMADDR
  lda #$02
  sta OAMDMA
  lda #$00


; Timer - general purpose, used to trigger a variety 
; of events
; --------------------------------------------------
  inc timer

; --------------------------------------------------
; Player input reads
; --------------------------------------------------
  jsr read_controller

; --------------------------------------------------
; 
; --------------------------------------------------
  lda do_scroll
  cmp #$01
  bne dont_scroll

  dec scroll_y
  lda scroll_y
  cmp #255
  bne dont_reset_scroll_y
  lda #239
  sta scroll_y
  lda nametable_number
  eor #$02
  sta nametable_number
dont_reset_scroll_y:

NewRowCheck:
  lda scroll_y
  and #%00001111        ; multiple of 16
  bne NewRowCheckDone
  jsr load_row
  lda #$01
  sta prep_next_row

NewRowCheckDone:
dont_scroll:

  lda #$00
  sta PPUSCROLL         ; x scroll
  lda scroll_y
  sta PPUSCROLL         ; y scroll
                        
                        ; This is the PPU clean up section, so rendering the next frame starts properly.
  lda #%10010000        ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  eor nametable_number
  sta PPUCTRL

  lda do_render
  beq dont_render
  lda #%00011110        ; enable sprites, enable background, no clipping on left side
  sta PPUMASK
dont_render:

  lda #$00
  sta sleeping

  jsr FamiToneUpdate

  RESTORE_REGISTERS
  rti                   ; return from interrupt
.endproc

.proc main
; --------------------------------------------------
; turn off rendering
; --------------------------------------------------
  lda #0
  sta PPUCTRL
  sta PPUMASK
  sta PPUSCROLL
  sta PPUSCROLL

; --------------------------------------------------
; Load first screen
; --------------------------------------------------
  lda #$FF
  sta scene_number
  jsr load_levels

; --------------------------------------------------
; enable interrupts
; --------------------------------------------------
  cli

; --------------------------------------------------
; turn on NMIs, sprites use first pattern table
; turn on screen
; --------------------------------------------------                 
  lda #%10010000
  eor nametable_number
  sta PPUCTRL
  lda #%00011110
  sta PPUMASK

; --------------------------------------------------
; wait for another vblank before continuing
; --------------------------------------------------
  WAIT_VBLANK

; --------------------------------------------------
; Initialise FamiTone2.
; Play sound effect for initial demoncore screen.
; --------------------------------------------------
	lda NTSC_MODE_FAMITONE
	jsr FamiToneInit

	ldx #<sounds
	ldy #>sounds
	jsr FamiToneSfxInit
  lda #0
	ldx #FT_SFX_CH0
	jsr FamiToneSfxPlay

  ;;;hack player bullets
  lda #$01
  sta player_bullet_palette
  lda #$68
  sta player_bullet_gfx

mainloop:

  lda scene_number
  
  CMP #SCENE_NUMBER_DEMONCORE_SCREEN
  BEQ demoncore_screen
  CMP #SCENE_NUMBER_TITLE_SCREEN
  BEQ title_screen
  CMP #SCENE_NUMBER_LEVEL1_TEXT_SCREEN
  BEQ level1_title_screen
  CMP #SCENE_NUMBER_LEVEL1_GAMEPLAY_SCENE
  BEQ level1_gameplay_scene
  CMP #SCENE_NUMBER_LEVEL2_TEXT_SCREEN
  BEQ level2_title_screen
  CMP #SCENE_NUMBER_LEVEL2_GAMEPLAY_SCENE
  BEQ level2_gameplay_scene
  CMP #SCENE_NUMBER_LEVEL3_TEXT_SCREEN
  BEQ level3_title_screen
  CMP #SCENE_NUMBER_LEVEL3_GAMEPLAY_SCENE
  BEQ level3_gameplay_scene
  CMP #SCENE_NUMBER_BOSS_SCENE
  BEQ level3_boss_scene
  CMP #SCENE_NUMBER_ENDING_SCREEN
  BEQ ending_screen

demoncore_screen:
  jmp done
title_screen:
  jmp done
level1_title_screen:
  jmp done
level1_gameplay_scene:
  jsr gameplay_level1
  jmp done
level2_title_screen:
  jmp done
level2_gameplay_scene:
  jsr gameplay_level2
  jmp done
level3_title_screen:
  jmp done
level3_gameplay_scene:
  jsr gameplay_level3
  jmp done
level3_boss_scene:
  jsr gameplay_level3boss
  jmp done
ending_screen:

done:

; --------------------------------------------------
; For debug purposes.
; Load levels by pressing start
; --------------------------------------------------
  lda buttons_pressed
  and #BTN_START
  beq :+
  jsr load_levels
:

; --------------------------------------------------
; 
; --------------------------------------------------


  inc sleeping
sleep:
  lda sleeping
  bne sleep

  jmp mainloop
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "PRG"
BANK_SWITCH: .byte $FF

.segment "CHRROM_TEXT"
.incbin "../chr/text.chr"

.segment "CHRROM_TITLE"
.incbin "../chr/title.chr"

.segment "CHRROM_LEVEL1_BEACH"
.incbin "../chr/level1_beach.chr"

.segment "CHRROM_LEVEL2_GRASS"
.incbin "../chr/level2_grass.chr"

.segment "CHRROM_LEVEL3_STATION"
.incbin "../chr/level3_station.chr"

.segment "CHRROM_BOSS"
.incbin "../chr/boss.chr"