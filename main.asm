;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12016 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _Level2
	.globl _Level1
	.globl _level_timer
	.globl _Level1ENV
	.globl _setupENV
	.globl _isgameover
	.globl _endscreen
	.globl _interuptLCD
	.globl _laserblast
	.globl _collisioncheck
	.globl _checkcollision
	.globl _score
	.globl _movecharacters2
	.globl _movecharacters1
	.globl _ohjoy
	.globl _pause
	.globl _if_can_move
	.globl _laser_fire
	.globl _explosion
	.globl _died
	.globl _engine
	.globl _reset_player
	.globl _hide_player
	.globl _storealiens
	.globl _alien_lasers
	.globl _setup_alien_laser
	.globl _move_lasers
	.globl _setuplaser
	.globl _movealiens2
	.globl _movealiens1
	.globl _setupalienship2
	.globl _setupalienship1
	.globl _setupalien2
	.globl _setupalien1
	.globl _setupplayer
	.globl _movegamecharacter
	.globl _splashscreen
	.globl _fade_in
	.globl _fade_out
	.globl _performancedelay
	.globl _gridpos
	.globl _rand
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _printf
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _enable_interrupts
	.globl _waitpad
	.globl _joypad
	.globl _delay
	.globl _add_LCD
	.globl _restart
	.globl _timer
	.globl _level
	.globl _z
	.globl _gameover
	.globl _lives
	.globl _topscore
	.globl _bestscore
	.globl _currentscore
	.globl _scr
	.globl _background_test_tiles
	.globl _alien_fire
	.globl _fire
	.globl _laser_active
	.globl _max_laser
	.globl _i
	.globl _spritesize
	.globl _alien_laser
	.globl _laser
	.globl _alienship2
	.globl _alienship1
	.globl _alien2
	.globl _alien1
	.globl _player
	.globl _collisionmap
	.globl _scry
	.globl _scrx
	.globl _y
	.globl _x
	.globl _gridy
	.globl _gridx
	.globl _blanktiles
	.globl _blankmap
	.globl _splashtiles
	.globl _splashmap
	.globl _backgroundtiles
	.globl _background
	.globl _windowmap
	.globl _GameSprites
	.globl _blankmap_tile
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_GameSprites::
	.ds 384
_windowmap::
	.ds 5
_background::
	.ds 720
_backgroundtiles::
	.ds 272
_splashmap::
	.ds 360
_splashtiles::
	.ds 832
_blankmap::
	.ds 360
_blanktiles::
	.ds 16
_gridx::
	.ds 2
_gridy::
	.ds 2
_x::
	.ds 2
_y::
	.ds 2
_scrx::
	.ds 2
_scry::
	.ds 2
_collisionmap::
	.ds 1440
_player::
	.ds 28
_alien1::
	.ds 28
_alien2::
	.ds 28
_alienship1::
	.ds 28
_alienship2::
	.ds 28
_laser::
	.ds 28
_alien_laser::
	.ds 28
_spritesize::
	.ds 1
_i::
	.ds 1
_max_laser::
	.ds 2
_laser_active::
	.ds 2
_fire::
	.ds 1
_alien_fire::
	.ds 2
_background_test_tiles::
	.ds 7
_scr::
	.ds 2
_currentscore::
	.ds 2
_bestscore::
	.ds 2
_topscore::
	.ds 2
_lives::
	.ds 2
_gameover::
	.ds 2
_z::
	.ds 2
_level::
	.ds 2
_timer::
	.ds 2
_restart::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;GameSprites.c:26: unsigned char GameSprites[] =
	ld	hl, #_GameSprites
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0002)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0003)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0005)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0006)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0007)
	ld	(hl), #0x03
	ld	hl, #(_GameSprites + 0x0008)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0009)
	ld	(hl), #0x03
	ld	hl, #(_GameSprites + 0x000a)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x000b)
	ld	(hl), #0x83
	ld	hl, #(_GameSprites + 0x000c)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x000d)
	ld	(hl), #0x82
	ld	hl, #(_GameSprites + 0x000e)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x000f)
	ld	(hl), #0xc6
	ld	hl, #(_GameSprites + 0x0010)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0011)
	ld	(hl), #0xef
	ld	hl, #(_GameSprites + 0x0012)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0014)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0015)
	ld	(hl), #0x3f
	ld	hl, #(_GameSprites + 0x0016)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0017)
	ld	(hl), #0x0f
	ld	hl, #(_GameSprites + 0x0018)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0019)
	ld	(hl), #0x07
	ld	hl, #(_GameSprites + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x001b)
	ld	(hl), #0x03
	ld	hl, #(_GameSprites + 0x001c)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x001d)
	ld	(hl), #0x02
	ld	hl, #(_GameSprites + 0x001e)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0020)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0022)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0023)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0024)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0025)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0026)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0027)
	ld	(hl), #0xc0
	ld	hl, #(_GameSprites + 0x0028)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0029)
	ld	(hl), #0xc0
	ld	hl, #(_GameSprites + 0x002a)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x002b)
	ld	(hl), #0xc1
	ld	hl, #(_GameSprites + 0x002c)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x002d)
	ld	(hl), #0x41
	ld	hl, #(_GameSprites + 0x002e)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x002f)
	ld	(hl), #0x63
	ld	hl, #(_GameSprites + 0x0030)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0031)
	ld	(hl), #0xf7
	ld	hl, #(_GameSprites + 0x0032)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0033)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0034)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0035)
	ld	(hl), #0xfc
	ld	hl, #(_GameSprites + 0x0036)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0037)
	ld	(hl), #0xf0
	ld	hl, #(_GameSprites + 0x0038)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0039)
	ld	(hl), #0xe0
	ld	hl, #(_GameSprites + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x003b)
	ld	(hl), #0xc0
	ld	hl, #(_GameSprites + 0x003c)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x003d)
	ld	(hl), #0x40
	ld	hl, #(_GameSprites + 0x003e)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x004a)
	ld	(hl), #0x06
	ld	hl, #(_GameSprites + 0x004b)
	ld	(hl), #0x06
	ld	hl, #(_GameSprites + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x004d)
	ld	(hl), #0x1f
	ld	hl, #(_GameSprites + 0x004e)
	ld	(hl), #0x19
	ld	hl, #(_GameSprites + 0x004f)
	ld	(hl), #0x66
	ld	hl, #(_GameSprites + 0x0050)
	ld	(hl), #0x1f
	ld	hl, #(_GameSprites + 0x0051)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0052)
	ld	(hl), #0x06
	ld	hl, #(_GameSprites + 0x0053)
	ld	(hl), #0x79
	ld	hl, #(_GameSprites + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0055)
	ld	(hl), #0x3f
	ld	hl, #(_GameSprites + 0x0056)
	ld	(hl), #0x0f
	ld	hl, #(_GameSprites + 0x0057)
	ld	(hl), #0x1f
	ld	hl, #(_GameSprites + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0059)
	ld	(hl), #0x0f
	ld	hl, #(_GameSprites + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x005b)
	ld	(hl), #0x07
	ld	hl, #(_GameSprites + 0x005c)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x005d)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x005e)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x006a)
	ld	(hl), #0x60
	ld	hl, #(_GameSprites + 0x006b)
	ld	(hl), #0x60
	ld	hl, #(_GameSprites + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x006d)
	ld	(hl), #0xf8
	ld	hl, #(_GameSprites + 0x006e)
	ld	(hl), #0x98
	ld	hl, #(_GameSprites + 0x006f)
	ld	(hl), #0x66
	ld	hl, #(_GameSprites + 0x0070)
	ld	(hl), #0xf8
	ld	hl, #(_GameSprites + 0x0071)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0072)
	ld	(hl), #0x60
	ld	hl, #(_GameSprites + 0x0073)
	ld	(hl), #0x9e
	ld	hl, #(_GameSprites + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0075)
	ld	(hl), #0xfe
	ld	hl, #(_GameSprites + 0x0076)
	ld	(hl), #0xf0
	ld	hl, #(_GameSprites + 0x0077)
	ld	(hl), #0xf8
	ld	hl, #(_GameSprites + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0079)
	ld	(hl), #0xf0
	ld	hl, #(_GameSprites + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x007b)
	ld	(hl), #0xe0
	ld	hl, #(_GameSprites + 0x007c)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x007d)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x007e)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0083)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0084)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0085)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0086)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0087)
	ld	(hl), #0xbf
	ld	hl, #(_GameSprites + 0x0088)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0089)
	ld	(hl), #0x9f
	ld	hl, #(_GameSprites + 0x008a)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x008b)
	ld	(hl), #0x8f
	ld	hl, #(_GameSprites + 0x008c)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x008d)
	ld	(hl), #0x07
	ld	hl, #(_GameSprites + 0x008e)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x008f)
	ld	(hl), #0x03
	ld	hl, #(_GameSprites + 0x0090)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0091)
	ld	(hl), #0x02
	ld	hl, #(_GameSprites + 0x0092)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0093)
	ld	(hl), #0x02
	ld	hl, #(_GameSprites + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0095)
	ld	(hl), #0x03
	ld	hl, #(_GameSprites + 0x0096)
	ld	(hl), #0x02
	ld	hl, #(_GameSprites + 0x0097)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0098)
	ld	(hl), #0x02
	ld	hl, #(_GameSprites + 0x0099)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x009b)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x009c)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x009d)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x009e)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00a3)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x00a4)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x00a5)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x00a6)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x00a7)
	ld	(hl), #0xfd
	ld	hl, #(_GameSprites + 0x00a8)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x00a9)
	ld	(hl), #0xf9
	ld	hl, #(_GameSprites + 0x00aa)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x00ab)
	ld	(hl), #0xf1
	ld	hl, #(_GameSprites + 0x00ac)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x00ad)
	ld	(hl), #0xe0
	ld	hl, #(_GameSprites + 0x00ae)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00af)
	ld	(hl), #0xc0
	ld	hl, #(_GameSprites + 0x00b0)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00b1)
	ld	(hl), #0x40
	ld	hl, #(_GameSprites + 0x00b2)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00b3)
	ld	(hl), #0x40
	ld	hl, #(_GameSprites + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00b5)
	ld	(hl), #0xc0
	ld	hl, #(_GameSprites + 0x00b6)
	ld	(hl), #0x40
	ld	hl, #(_GameSprites + 0x00b7)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00b8)
	ld	(hl), #0x40
	ld	hl, #(_GameSprites + 0x00b9)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00bb)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00bc)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00bd)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00be)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00c4)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00c5)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00c6)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00c7)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00c8)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00c9)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00ca)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00cb)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00cc)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00cd)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00ce)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00cf)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00d0)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00d1)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00e4)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00e5)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00e6)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00e7)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00e8)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00e9)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00ea)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00eb)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00ec)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00ed)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00ee)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00ef)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00f0)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00f1)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0107)
	ld	(hl), #0x0e
	ld	hl, #(_GameSprites + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0109)
	ld	(hl), #0x4f
	ld	hl, #(_GameSprites + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x010b)
	ld	(hl), #0x79
	ld	hl, #(_GameSprites + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x010d)
	ld	(hl), #0x3f
	ld	hl, #(_GameSprites + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x010f)
	ld	(hl), #0x1f
	ld	hl, #(_GameSprites + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0111)
	ld	(hl), #0x1b
	ld	hl, #(_GameSprites + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0113)
	ld	(hl), #0x3e
	ld	hl, #(_GameSprites + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0115)
	ld	(hl), #0x1f
	ld	hl, #(_GameSprites + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0117)
	ld	(hl), #0x03
	ld	hl, #(_GameSprites + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x012d)
	ld	(hl), #0x60
	ld	hl, #(_GameSprites + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x012f)
	ld	(hl), #0xe0
	ld	hl, #(_GameSprites + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0131)
	ld	(hl), #0xc0
	ld	hl, #(_GameSprites + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0133)
	ld	(hl), #0xc8
	ld	hl, #(_GameSprites + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0135)
	ld	(hl), #0xf8
	ld	hl, #(_GameSprites + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0137)
	ld	(hl), #0xcc
	ld	hl, #(_GameSprites + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0139)
	ld	(hl), #0x6c
	ld	hl, #(_GameSprites + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x013b)
	ld	(hl), #0x7e
	ld	hl, #(_GameSprites + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x013d)
	ld	(hl), #0x06
	ld	hl, #(_GameSprites + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0143)
	ld	(hl), #0x01
	ld	hl, #(_GameSprites + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0145)
	ld	(hl), #0x03
	ld	hl, #(_GameSprites + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0147)
	ld	(hl), #0x27
	ld	hl, #(_GameSprites + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0149)
	ld	(hl), #0x3f
	ld	hl, #(_GameSprites + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x014b)
	ld	(hl), #0x39
	ld	hl, #(_GameSprites + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x014d)
	ld	(hl), #0x7a
	ld	hl, #(_GameSprites + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x014f)
	ld	(hl), #0xef
	ld	hl, #(_GameSprites + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0151)
	ld	(hl), #0xcb
	ld	hl, #(_GameSprites + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0153)
	ld	(hl), #0x7d
	ld	hl, #(_GameSprites + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0155)
	ld	(hl), #0x1f
	ld	hl, #(_GameSprites + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0157)
	ld	(hl), #0x37
	ld	hl, #(_GameSprites + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0159)
	ld	(hl), #0x18
	ld	hl, #(_GameSprites + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0165)
	ld	(hl), #0x80
	ld	hl, #(_GameSprites + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0167)
	ld	(hl), #0x60
	ld	hl, #(_GameSprites + 0x0168)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0169)
	ld	(hl), #0xd0
	ld	hl, #(_GameSprites + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x016b)
	ld	(hl), #0xf4
	ld	hl, #(_GameSprites + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x016d)
	ld	(hl), #0x7e
	ld	hl, #(_GameSprites + 0x016e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x016f)
	ld	(hl), #0xcf
	ld	hl, #(_GameSprites + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0171)
	ld	(hl), #0xdf
	ld	hl, #(_GameSprites + 0x0172)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0173)
	ld	(hl), #0xea
	ld	hl, #(_GameSprites + 0x0174)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0175)
	ld	(hl), #0x78
	ld	hl, #(_GameSprites + 0x0176)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0177)
	ld	(hl), #0xa8
	ld	hl, #(_GameSprites + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0179)
	ld	(hl), #0xf0
	ld	hl, #(_GameSprites + 0x017a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x017b)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x017c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x017d)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x017e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x017f)
	ld	(hl), #0x00
;windowmap.c:3: unsigned char windowmap[] =
	ld	hl, #_windowmap
	ld	(hl), #0x1d
	ld	hl, #(_windowmap + 0x0001)
	ld	(hl), #0x0d
	ld	hl, #(_windowmap + 0x0002)
	ld	(hl), #0x19
	ld	hl, #(_windowmap + 0x0003)
	ld	(hl), #0x1c
	ld	hl, #(_windowmap + 0x0004)
	ld	(hl), #0x0f
;background.c:25: unsigned char background[] =
	ld	hl, #_background
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0001)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x000d)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x000e)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0012)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0013)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0014)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0015)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0020)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0021)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0022)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0023)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0026)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0027)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0028)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x0029)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0034)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0035)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0036)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0037)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x003a)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x003b)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x003c)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x003d)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0048)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0049)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x004a)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x004b)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x004e)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x004f)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x0050)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x0051)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x005c)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x005d)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x005e)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x005f)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0062)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0063)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0064)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0065)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0070)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0071)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0072)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x0073)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0076)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0077)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0078)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0079)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0084)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0085)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0086)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0087)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x008a)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x008b)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x008c)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x008d)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0099)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x009a)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x009e)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x009f)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x00a0)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x00a1)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00b2)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x00b3)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x00b4)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x00b5)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00c6)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x00c7)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x00c8)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x00c9)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00da)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x00db)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x00dc)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x00dd)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ee)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x00ef)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x00f0)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x00f1)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0102)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0103)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0104)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0105)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x010e)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x010f)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0116)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0117)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0118)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0119)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0121)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0122)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0123)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0124)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x012a)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x012b)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x012c)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x012d)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0135)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0136)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0137)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0138)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x013e)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x013f)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x0140)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x0141)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0149)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x014a)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x014b)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x014c)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0152)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0153)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0154)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0155)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x015d)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x015e)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x015f)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x0160)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0166)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0167)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0168)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0169)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x016b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x016d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x016e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x016f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0171)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0172)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0173)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0174)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0175)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0176)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0177)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0179)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x017a)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x017b)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x017c)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x017d)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x017e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x017f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0180)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0181)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0182)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0183)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0184)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0185)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0186)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0187)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0188)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0189)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x018a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x018b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x018c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x018d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x018e)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x018f)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x0190)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x0191)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0192)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0193)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0194)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0195)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0196)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0197)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0198)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0199)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x019a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x019b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x019c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x019d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x019e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x019f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01a0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01a1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01a2)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x01a3)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x01a4)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x01a5)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x01a6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01a7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01a8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01a9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01aa)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ab)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ac)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ad)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ae)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01af)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01b0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01b1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01b2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01b3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01b4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01b5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01b6)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x01b7)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x01b8)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x01b9)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x01ba)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01bb)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01bc)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01bd)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01be)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01bf)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01c9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ca)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x01cb)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x01cc)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x01cd)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x01ce)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01cf)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01d9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01da)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01db)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01dc)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01dd)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01de)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x01df)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x01e0)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x01e1)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x01e2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01e3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01e4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01e5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01e6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01e7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01e8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01e9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ea)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01eb)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ec)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ed)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ee)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ef)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01f0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01f1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01f2)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x01f3)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x01f4)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x01f5)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x01f6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01f7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01f8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01f9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01fa)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x01fb)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x01fc)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01fd)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01fe)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x01ff)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0200)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0201)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0202)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0203)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0204)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0205)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0206)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0207)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x0208)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x0209)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x020a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x020b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x020c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x020d)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x020e)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x020f)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0210)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0211)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0212)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0213)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0214)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0215)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0216)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0217)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0218)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0219)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x021a)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x021b)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x021c)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x021d)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x021e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x021f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0220)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0221)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0222)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0223)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0224)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0225)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0226)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0227)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0228)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0229)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x022a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x022b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x022c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x022d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x022e)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x022f)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0230)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0231)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x0232)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0233)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0234)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0235)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0236)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0237)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x0238)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x0239)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x023a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x023b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x023c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x023d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x023e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x023f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0240)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0241)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0242)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x0243)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0244)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x0245)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0246)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0247)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0248)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0249)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x024a)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x024b)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x024c)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x024d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x024e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x024f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0250)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0251)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0252)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0253)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0254)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0255)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0256)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0257)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x0258)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x0259)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x025a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x025b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x025c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x025d)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x025e)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x025f)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x0260)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0261)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0262)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0263)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0264)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0265)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0266)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0267)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0268)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0269)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x026a)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x026b)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x026c)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x026d)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x026e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x026f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0270)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0271)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0272)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x0273)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x0274)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x0275)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0276)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0277)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0278)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0279)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x027a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x027b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x027c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x027d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x027e)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x027f)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0280)
	ld	(hl), #0x27
	ld	hl, #(_background + 0x0281)
	ld	(hl), #0x29
	ld	hl, #(_background + 0x0282)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0283)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0284)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0285)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0286)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x0287)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0288)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0289)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x028a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x028b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x028c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x028d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x028e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x028f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0290)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0291)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0292)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x0293)
	ld	(hl), #0x31
	ld	hl, #(_background + 0x0294)
	ld	(hl), #0x2a
	ld	hl, #(_background + 0x0295)
	ld	(hl), #0x2c
	ld	hl, #(_background + 0x0296)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0297)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0298)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x0299)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x029a)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x029b)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x029c)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x029d)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x029e)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x029f)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02a0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02a1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02a2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02a3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02a4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02a5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02a6)
	ld	(hl), #0x32
	ld	hl, #(_background + 0x02a7)
	ld	(hl), #0x34
	ld	hl, #(_background + 0x02a8)
	ld	(hl), #0x2b
	ld	hl, #(_background + 0x02a9)
	ld	(hl), #0x2d
	ld	hl, #(_background + 0x02aa)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02ab)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02ac)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02ad)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02ae)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02af)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02b9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02ba)
	ld	(hl), #0x33
	ld	hl, #(_background + 0x02bb)
	ld	(hl), #0x2f
	ld	hl, #(_background + 0x02bc)
	ld	(hl), #0x26
	ld	hl, #(_background + 0x02bd)
	ld	(hl), #0x28
	ld	hl, #(_background + 0x02be)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02bf)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c0)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c1)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c2)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c3)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c4)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c5)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c6)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c7)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c8)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02c9)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02ca)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02cb)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02cc)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02cd)
	ld	(hl), #0x00
	ld	hl, #(_background + 0x02ce)
	ld	(hl), #0x2e
	ld	hl, #(_background + 0x02cf)
	ld	(hl), #0x31
;backgroundtiles.c:26: unsigned char backgroundtiles[] =
	ld	hl, #_backgroundtiles
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0010)
	ld	(hl), #0xf3
	ld	hl, #(_backgroundtiles + 0x0011)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x0012)
	ld	(hl), #0xc7
	ld	hl, #(_backgroundtiles + 0x0013)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtiles + 0x0014)
	ld	(hl), #0xcf
	ld	hl, #(_backgroundtiles + 0x0015)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x0016)
	ld	(hl), #0xc1
	ld	hl, #(_backgroundtiles + 0x0017)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x0018)
	ld	(hl), #0x85
	ld	hl, #(_backgroundtiles + 0x0019)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x001a)
	ld	(hl), #0xcd
	ld	hl, #(_backgroundtiles + 0x001b)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x001c)
	ld	(hl), #0xd9
	ld	hl, #(_backgroundtiles + 0x001d)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x001e)
	ld	(hl), #0xf9
	ld	hl, #(_backgroundtiles + 0x001f)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x0020)
	ld	(hl), #0xd3
	ld	hl, #(_backgroundtiles + 0x0021)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x0022)
	ld	(hl), #0x8f
	ld	hl, #(_backgroundtiles + 0x0023)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x0024)
	ld	(hl), #0xb9
	ld	hl, #(_backgroundtiles + 0x0025)
	ld	(hl), #0xc6
	ld	hl, #(_backgroundtiles + 0x0026)
	ld	(hl), #0xb5
	ld	hl, #(_backgroundtiles + 0x0027)
	ld	(hl), #0xce
	ld	hl, #(_backgroundtiles + 0x0028)
	ld	(hl), #0xcd
	ld	hl, #(_backgroundtiles + 0x0029)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x002a)
	ld	(hl), #0xf9
	ld	hl, #(_backgroundtiles + 0x002b)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x002c)
	ld	(hl), #0xc7
	ld	hl, #(_backgroundtiles + 0x002d)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtiles + 0x002e)
	ld	(hl), #0xc1
	ld	hl, #(_backgroundtiles + 0x002f)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x0030)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0032)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtiles + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0034)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtiles + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0036)
	ld	(hl), #0x8f
	ld	hl, #(_backgroundtiles + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0038)
	ld	(hl), #0xc9
	ld	hl, #(_backgroundtiles + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x003a)
	ld	(hl), #0xe1
	ld	hl, #(_backgroundtiles + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x003c)
	ld	(hl), #0xe2
	ld	hl, #(_backgroundtiles + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x003e)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0040)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtiles + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0042)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0044)
	ld	(hl), #0xe3
	ld	hl, #(_backgroundtiles + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0046)
	ld	(hl), #0xc1
	ld	hl, #(_backgroundtiles + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0048)
	ld	(hl), #0xc3
	ld	hl, #(_backgroundtiles + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x004a)
	ld	(hl), #0xd6
	ld	hl, #(_backgroundtiles + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x004c)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x004e)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtiles + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0050)
	ld	(hl), #0x95
	ld	hl, #(_backgroundtiles + 0x0051)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x0052)
	ld	(hl), #0x9d
	ld	hl, #(_backgroundtiles + 0x0053)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x0054)
	ld	(hl), #0xf9
	ld	hl, #(_backgroundtiles + 0x0055)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x0056)
	ld	(hl), #0xc3
	ld	hl, #(_backgroundtiles + 0x0057)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x0058)
	ld	(hl), #0x8f
	ld	hl, #(_backgroundtiles + 0x0059)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x005a)
	ld	(hl), #0xcf
	ld	hl, #(_backgroundtiles + 0x005b)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x005c)
	ld	(hl), #0x9f
	ld	hl, #(_backgroundtiles + 0x005d)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtiles + 0x005e)
	ld	(hl), #0xc7
	ld	hl, #(_backgroundtiles + 0x005f)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtiles + 0x0060)
	ld	(hl), #0xc9
	ld	hl, #(_backgroundtiles + 0x0061)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtiles + 0x0062)
	ld	(hl), #0xcc
	ld	hl, #(_backgroundtiles + 0x0063)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtiles + 0x0064)
	ld	(hl), #0xcc
	ld	hl, #(_backgroundtiles + 0x0065)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtiles + 0x0066)
	ld	(hl), #0xfb
	ld	hl, #(_backgroundtiles + 0x0067)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x0068)
	ld	(hl), #0xf7
	ld	hl, #(_backgroundtiles + 0x0069)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtiles + 0x006a)
	ld	(hl), #0x8f
	ld	hl, #(_backgroundtiles + 0x006b)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x006c)
	ld	(hl), #0xe3
	ld	hl, #(_backgroundtiles + 0x006d)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x006e)
	ld	(hl), #0xf3
	ld	hl, #(_backgroundtiles + 0x006f)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x0070)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtiles + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0072)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0074)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtiles + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0076)
	ld	(hl), #0x38
	ld	hl, #(_backgroundtiles + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0078)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtiles + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x007a)
	ld	(hl), #0x31
	ld	hl, #(_backgroundtiles + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x007c)
	ld	(hl), #0xc4
	ld	hl, #(_backgroundtiles + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x007e)
	ld	(hl), #0x06
	ld	hl, #(_backgroundtiles + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0080)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtiles + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0082)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0084)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtiles + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0086)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtiles + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0088)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtiles + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x008a)
	ld	(hl), #0x78
	ld	hl, #(_backgroundtiles + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x008c)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtiles + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x008e)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtiles + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0090)
	ld	(hl), #0x1f
	ld	hl, #(_backgroundtiles + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0092)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0096)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtiles + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x0098)
	ld	(hl), #0x83
	ld	hl, #(_backgroundtiles + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x009a)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x009c)
	ld	(hl), #0x1f
	ld	hl, #(_backgroundtiles + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x009e)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtiles + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00a0)
	ld	(hl), #0xc7
	ld	hl, #(_backgroundtiles + 0x00a1)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x00a2)
	ld	(hl), #0xf3
	ld	hl, #(_backgroundtiles + 0x00a3)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtiles + 0x00a4)
	ld	(hl), #0x71
	ld	hl, #(_backgroundtiles + 0x00a5)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtiles + 0x00a6)
	ld	(hl), #0xfb
	ld	hl, #(_backgroundtiles + 0x00a7)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x00a8)
	ld	(hl), #0xc3
	ld	hl, #(_backgroundtiles + 0x00a9)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x00aa)
	ld	(hl), #0x9b
	ld	hl, #(_backgroundtiles + 0x00ab)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtiles + 0x00ac)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x00ad)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtiles + 0x00ae)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtiles + 0x00af)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtiles + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00c0)
	ld	(hl), #0x37
	ld	hl, #(_backgroundtiles + 0x00c1)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtiles + 0x00c2)
	ld	(hl), #0x93
	ld	hl, #(_backgroundtiles + 0x00c3)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtiles + 0x00c4)
	ld	(hl), #0xc3
	ld	hl, #(_backgroundtiles + 0x00c5)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x00c6)
	ld	(hl), #0x61
	ld	hl, #(_backgroundtiles + 0x00c7)
	ld	(hl), #0x1f
	ld	hl, #(_backgroundtiles + 0x00c8)
	ld	(hl), #0x3b
	ld	hl, #(_backgroundtiles + 0x00c9)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x00ca)
	ld	(hl), #0x37
	ld	hl, #(_backgroundtiles + 0x00cb)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtiles + 0x00cc)
	ld	(hl), #0xef
	ld	hl, #(_backgroundtiles + 0x00cd)
	ld	(hl), #0x1f
	ld	hl, #(_backgroundtiles + 0x00ce)
	ld	(hl), #0xe7
	ld	hl, #(_backgroundtiles + 0x00cf)
	ld	(hl), #0x1f
	ld	hl, #(_backgroundtiles + 0x00d0)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtiles + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00d2)
	ld	(hl), #0x31
	ld	hl, #(_backgroundtiles + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00d4)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtiles + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00d6)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtiles + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00d8)
	ld	(hl), #0x11
	ld	hl, #(_backgroundtiles + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00da)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtiles + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00dc)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtiles + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00de)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00e0)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00e2)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00e4)
	ld	(hl), #0x87
	ld	hl, #(_backgroundtiles + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00e6)
	ld	(hl), #0x93
	ld	hl, #(_backgroundtiles + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00e8)
	ld	(hl), #0x9b
	ld	hl, #(_backgroundtiles + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00ea)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00ec)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtiles + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtiles + 0x00f0)
	ld	(hl), #0xf1
	ld	hl, #(_backgroundtiles + 0x00f1)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtiles + 0x00f2)
	ld	(hl), #0xfd
	ld	hl, #(_backgroundtiles + 0x00f3)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtiles + 0x00f4)
	ld	(hl), #0xe5
	ld	hl, #(_backgroundtiles + 0x00f5)
	ld	(hl), #0x1b
	ld	hl, #(_backgroundtiles + 0x00f6)
	ld	(hl), #0xd1
	ld	hl, #(_backgroundtiles + 0x00f7)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x00f8)
	ld	(hl), #0xdd
	ld	hl, #(_backgroundtiles + 0x00f9)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x00fa)
	ld	(hl), #0xc7
	ld	hl, #(_backgroundtiles + 0x00fb)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x00fc)
	ld	(hl), #0xf7
	ld	hl, #(_backgroundtiles + 0x00fd)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtiles + 0x00fe)
	ld	(hl), #0x9b
	ld	hl, #(_backgroundtiles + 0x00ff)
	ld	(hl), #0x67
	ld	hl, #(_backgroundtiles + 0x0100)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtiles + 0x0101)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtiles + 0x0102)
	ld	(hl), #0xa3
	ld	hl, #(_backgroundtiles + 0x0103)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtiles + 0x0104)
	ld	(hl), #0xb3
	ld	hl, #(_backgroundtiles + 0x0105)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtiles + 0x0106)
	ld	(hl), #0xdf
	ld	hl, #(_backgroundtiles + 0x0107)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x0108)
	ld	(hl), #0xc3
	ld	hl, #(_backgroundtiles + 0x0109)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtiles + 0x010a)
	ld	(hl), #0xf9
	ld	hl, #(_backgroundtiles + 0x010b)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x010c)
	ld	(hl), #0xf9
	ld	hl, #(_backgroundtiles + 0x010d)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtiles + 0x010e)
	ld	(hl), #0xc7
	ld	hl, #(_backgroundtiles + 0x010f)
	ld	(hl), #0x3f
;splashmap.c:25: unsigned char splashmap[] =
	ld	hl, #_splashmap
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0068)
	ld	(hl), #0x04
	ld	hl, #(_splashmap + 0x0069)
	ld	(hl), #0x06
	ld	hl, #(_splashmap + 0x006a)
	ld	(hl), #0x08
	ld	hl, #(_splashmap + 0x006b)
	ld	(hl), #0x0a
	ld	hl, #(_splashmap + 0x006c)
	ld	(hl), #0x0c
	ld	hl, #(_splashmap + 0x006d)
	ld	(hl), #0x0e
	ld	hl, #(_splashmap + 0x006e)
	ld	(hl), #0x10
	ld	hl, #(_splashmap + 0x006f)
	ld	(hl), #0x12
	ld	hl, #(_splashmap + 0x0070)
	ld	(hl), #0x14
	ld	hl, #(_splashmap + 0x0071)
	ld	(hl), #0x16
	ld	hl, #(_splashmap + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x007c)
	ld	(hl), #0x05
	ld	hl, #(_splashmap + 0x007d)
	ld	(hl), #0x07
	ld	hl, #(_splashmap + 0x007e)
	ld	(hl), #0x09
	ld	hl, #(_splashmap + 0x007f)
	ld	(hl), #0x0b
	ld	hl, #(_splashmap + 0x0080)
	ld	(hl), #0x0d
	ld	hl, #(_splashmap + 0x0081)
	ld	(hl), #0x0f
	ld	hl, #(_splashmap + 0x0082)
	ld	(hl), #0x11
	ld	hl, #(_splashmap + 0x0083)
	ld	(hl), #0x13
	ld	hl, #(_splashmap + 0x0084)
	ld	(hl), #0x15
	ld	hl, #(_splashmap + 0x0085)
	ld	(hl), #0x17
	ld	hl, #(_splashmap + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0090)
	ld	(hl), #0x01
	ld	hl, #(_splashmap + 0x0091)
	ld	(hl), #0x02
	ld	hl, #(_splashmap + 0x0092)
	ld	(hl), #0x03
	ld	hl, #(_splashmap + 0x0093)
	ld	(hl), #0x01
	ld	hl, #(_splashmap + 0x0094)
	ld	(hl), #0x01
	ld	hl, #(_splashmap + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00b7)
	ld	(hl), #0x04
	ld	hl, #(_splashmap + 0x00b8)
	ld	(hl), #0x06
	ld	hl, #(_splashmap + 0x00b9)
	ld	(hl), #0x1c
	ld	hl, #(_splashmap + 0x00ba)
	ld	(hl), #0x1e
	ld	hl, #(_splashmap + 0x00bb)
	ld	(hl), #0x20
	ld	hl, #(_splashmap + 0x00bc)
	ld	(hl), #0x22
	ld	hl, #(_splashmap + 0x00bd)
	ld	(hl), #0x24
	ld	hl, #(_splashmap + 0x00be)
	ld	(hl), #0x26
	ld	hl, #(_splashmap + 0x00bf)
	ld	(hl), #0x28
	ld	hl, #(_splashmap + 0x00c0)
	ld	(hl), #0x2a
	ld	hl, #(_splashmap + 0x00c1)
	ld	(hl), #0x14
	ld	hl, #(_splashmap + 0x00c2)
	ld	(hl), #0x16
	ld	hl, #(_splashmap + 0x00c3)
	ld	(hl), #0x30
	ld	hl, #(_splashmap + 0x00c4)
	ld	(hl), #0x32
	ld	hl, #(_splashmap + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00cb)
	ld	(hl), #0x05
	ld	hl, #(_splashmap + 0x00cc)
	ld	(hl), #0x07
	ld	hl, #(_splashmap + 0x00cd)
	ld	(hl), #0x1d
	ld	hl, #(_splashmap + 0x00ce)
	ld	(hl), #0x1f
	ld	hl, #(_splashmap + 0x00cf)
	ld	(hl), #0x21
	ld	hl, #(_splashmap + 0x00d0)
	ld	(hl), #0x23
	ld	hl, #(_splashmap + 0x00d1)
	ld	(hl), #0x25
	ld	hl, #(_splashmap + 0x00d2)
	ld	(hl), #0x27
	ld	hl, #(_splashmap + 0x00d3)
	ld	(hl), #0x29
	ld	hl, #(_splashmap + 0x00d4)
	ld	(hl), #0x2b
	ld	hl, #(_splashmap + 0x00d5)
	ld	(hl), #0x15
	ld	hl, #(_splashmap + 0x00d6)
	ld	(hl), #0x17
	ld	hl, #(_splashmap + 0x00d7)
	ld	(hl), #0x31
	ld	hl, #(_splashmap + 0x00d8)
	ld	(hl), #0x33
	ld	hl, #(_splashmap + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_splashmap + 0x0167)
	ld	(hl), #0x00
;splashtiles.c:26: unsigned char splashtiles[] =
	ld	hl, #_splashtiles
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0044)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x0045)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x0046)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0047)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0048)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0049)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x004a)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x004b)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x004c)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x004d)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x004e)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x004f)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0050)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0051)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0058)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0059)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x005a)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x005b)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x005c)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x005d)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0064)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0065)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0066)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0067)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0068)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0069)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0070)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x0071)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x0072)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0073)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0074)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0075)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0076)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0077)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0078)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0079)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x007a)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x007b)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x007c)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x007d)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0084)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x0085)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x0086)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0087)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0088)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0089)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x008a)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x008b)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x008c)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x008d)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x008e)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x008f)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0090)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0091)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0092)
	ld	(hl), #0x09
	ld	hl, #(_splashtiles + 0x0093)
	ld	(hl), #0x09
	ld	hl, #(_splashtiles + 0x0094)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0095)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0096)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0097)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0098)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0099)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x009a)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x009b)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x009c)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x009d)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x009e)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x009f)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00a4)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x00a5)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x00a6)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x00a7)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x00a8)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x00a9)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x00aa)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x00ab)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x00ac)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x00ad)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x00ae)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x00af)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x00b0)
	ld	(hl), #0x7c
	ld	hl, #(_splashtiles + 0x00b1)
	ld	(hl), #0x7c
	ld	hl, #(_splashtiles + 0x00b2)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x00b3)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00c0)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x00c1)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x00c2)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x00c3)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x00c4)
	ld	(hl), #0x05
	ld	hl, #(_splashtiles + 0x00c5)
	ld	(hl), #0x05
	ld	hl, #(_splashtiles + 0x00c6)
	ld	(hl), #0x0d
	ld	hl, #(_splashtiles + 0x00c7)
	ld	(hl), #0x0d
	ld	hl, #(_splashtiles + 0x00c8)
	ld	(hl), #0x09
	ld	hl, #(_splashtiles + 0x00c9)
	ld	(hl), #0x09
	ld	hl, #(_splashtiles + 0x00ca)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00cb)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00cc)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x00cd)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x00ce)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x00cf)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x00d0)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x00d1)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x00d2)
	ld	(hl), #0x27
	ld	hl, #(_splashtiles + 0x00d3)
	ld	(hl), #0x27
	ld	hl, #(_splashtiles + 0x00d4)
	ld	(hl), #0x3c
	ld	hl, #(_splashtiles + 0x00d5)
	ld	(hl), #0x3c
	ld	hl, #(_splashtiles + 0x00d6)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x00d7)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x00d8)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x00d9)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x00da)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x00db)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x00dc)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x00dd)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x00de)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x00df)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x00e8)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x00e9)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x00ea)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x00eb)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x00ec)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x00ed)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x00ee)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x00ef)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x00f0)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x00f1)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x00f2)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x00f3)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x00f4)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00f5)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00f6)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00f7)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00f8)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00f9)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00fa)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00fb)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x00fc)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x00fd)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x00fe)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x00ff)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0104)
	ld	(hl), #0x3f
	ld	hl, #(_splashtiles + 0x0105)
	ld	(hl), #0x3f
	ld	hl, #(_splashtiles + 0x0106)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x0107)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x0108)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0109)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x010a)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x010b)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x010c)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x010d)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x010e)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x010f)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x0110)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x0111)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x0112)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x0113)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x0114)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0115)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0116)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x0117)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x0118)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0119)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x011a)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x011b)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x011c)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x011d)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x011e)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x011f)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0124)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x0125)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x0126)
	ld	(hl), #0x3c
	ld	hl, #(_splashtiles + 0x0127)
	ld	(hl), #0x3c
	ld	hl, #(_splashtiles + 0x0128)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x0129)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x012a)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x012b)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0138)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0139)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x013a)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x013b)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x013c)
	ld	(hl), #0x38
	ld	hl, #(_splashtiles + 0x013d)
	ld	(hl), #0x38
	ld	hl, #(_splashtiles + 0x013e)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x013f)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0142)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x0143)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x0144)
	ld	(hl), #0x38
	ld	hl, #(_splashtiles + 0x0145)
	ld	(hl), #0x38
	ld	hl, #(_splashtiles + 0x0146)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0147)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0148)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0149)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x014a)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x014b)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x014c)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x014d)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x014e)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x014f)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0150)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x0151)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x0152)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0153)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0154)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0155)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0156)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0157)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0158)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0159)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x015a)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x015b)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x015c)
	ld	(hl), #0x1f
	ld	hl, #(_splashtiles + 0x015d)
	ld	(hl), #0x1f
	ld	hl, #(_splashtiles + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0160)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0161)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0162)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x0163)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0167)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0168)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0169)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x016b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x016d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x016e)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x016f)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0171)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0172)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0173)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0174)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0175)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0176)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0177)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0179)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x017a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x017b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x017c)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x017d)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x017e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x017f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0180)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0181)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0182)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0183)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0184)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0185)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0186)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0187)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0188)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0189)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x018a)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x018b)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x018c)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x018d)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x018e)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x018f)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x0190)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0191)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0192)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0193)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0194)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0195)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0196)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0197)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0198)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0199)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x019a)
	ld	(hl), #0x1c
	ld	hl, #(_splashtiles + 0x019b)
	ld	(hl), #0x1c
	ld	hl, #(_splashtiles + 0x019c)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x019d)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x019e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x019f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01a0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01a1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01a2)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x01a3)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x01a4)
	ld	(hl), #0x3c
	ld	hl, #(_splashtiles + 0x01a5)
	ld	(hl), #0x3c
	ld	hl, #(_splashtiles + 0x01a6)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01a7)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01a8)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01a9)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01aa)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01ab)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01ac)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01ad)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01ae)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x01af)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x01b0)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b1)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b2)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b3)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b4)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b5)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b6)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b7)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b8)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01b9)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01ba)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x01bb)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x01bc)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x01bd)
	ld	(hl), #0xe0
	ld	hl, #(_splashtiles + 0x01be)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01bf)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01c0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01c1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01c2)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01c3)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01c4)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01c5)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01c6)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01c7)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01c8)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01c9)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01ca)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01cb)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01cc)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01cd)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01ce)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01cf)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01d0)
	ld	(hl), #0x3f
	ld	hl, #(_splashtiles + 0x01d1)
	ld	(hl), #0x3f
	ld	hl, #(_splashtiles + 0x01d2)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01d3)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01d4)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01d5)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01d6)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01d7)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01d8)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01d9)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01da)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01db)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01dc)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01dd)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x01de)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01df)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e2)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e3)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e4)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e5)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e6)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e7)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01e8)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01e9)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01ea)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01eb)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01ec)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01ed)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01ee)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01ef)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01f0)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x01f1)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x01f2)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01f3)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01f4)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01f5)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x01f6)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01f7)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01f8)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01f9)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01fa)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01fb)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01fc)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01fd)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x01fe)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x01ff)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0200)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0201)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0202)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x0203)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x0204)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x0205)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x0206)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0207)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0208)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0209)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x020a)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x020b)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x020c)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x020d)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x020e)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x020f)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0210)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0211)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0212)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0213)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0214)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0215)
	ld	(hl), #0x20
	ld	hl, #(_splashtiles + 0x0216)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0217)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0218)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0219)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x021a)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x021b)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x021c)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x021d)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x021e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x021f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0220)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0221)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0222)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0223)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0224)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x0225)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x0226)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0227)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0228)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0229)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x022a)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x022b)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x022c)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x022d)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x022e)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x022f)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x0230)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0231)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0232)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0233)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0234)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0235)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0236)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0237)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0238)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0239)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x023a)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x023b)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x023c)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x023d)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x023e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x023f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0240)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0241)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0242)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0243)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0244)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x0245)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x0246)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x0247)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x0248)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0249)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x024a)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x024b)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x024c)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x024d)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x024e)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x024f)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0250)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0251)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0252)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0253)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0254)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x0255)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x0256)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x0257)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x0258)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x0259)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x025a)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x025b)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x025c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x025d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x025e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x025f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0260)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0261)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0262)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0263)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0264)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0265)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0266)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x0267)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x0268)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0269)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x026a)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x026b)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x026c)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x026d)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x026e)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x026f)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0270)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0271)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0272)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0273)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0274)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0275)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0276)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0277)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0278)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x0279)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x027a)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x027b)
	ld	(hl), #0xf8
	ld	hl, #(_splashtiles + 0x027c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x027d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x027e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x027f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0280)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0281)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0282)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0283)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0284)
	ld	(hl), #0xff
	ld	hl, #(_splashtiles + 0x0285)
	ld	(hl), #0xff
	ld	hl, #(_splashtiles + 0x0286)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0287)
	ld	(hl), #0x04
	ld	hl, #(_splashtiles + 0x0288)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0289)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x028a)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x028b)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x028c)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x028d)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x028e)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x028f)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0290)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0291)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0292)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0293)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0294)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0295)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0296)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0297)
	ld	(hl), #0x02
	ld	hl, #(_splashtiles + 0x0298)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x0299)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x029a)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x029b)
	ld	(hl), #0x01
	ld	hl, #(_splashtiles + 0x029c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x029d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x029e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x029f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a2)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a3)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a4)
	ld	(hl), #0xfc
	ld	hl, #(_splashtiles + 0x02a5)
	ld	(hl), #0xfc
	ld	hl, #(_splashtiles + 0x02a6)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a7)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a8)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02a9)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02aa)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ab)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ac)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ad)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ae)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02af)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b2)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b3)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b4)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b5)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b6)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b7)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b8)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02b9)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ba)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02bb)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02bc)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02bd)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02be)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02bf)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02c0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02c1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02c2)
	ld	(hl), #0x3f
	ld	hl, #(_splashtiles + 0x02c3)
	ld	(hl), #0x3f
	ld	hl, #(_splashtiles + 0x02c4)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x02c5)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x02c6)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x02c7)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x02c8)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x02c9)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x02ca)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x02cb)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x02cc)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x02cd)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x02ce)
	ld	(hl), #0x1c
	ld	hl, #(_splashtiles + 0x02cf)
	ld	(hl), #0x1c
	ld	hl, #(_splashtiles + 0x02d0)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x02d1)
	ld	(hl), #0x07
	ld	hl, #(_splashtiles + 0x02d2)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x02d3)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x02d4)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x02d5)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x02d6)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x02d7)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x02d8)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x02d9)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x02da)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x02db)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x02dc)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x02dd)
	ld	(hl), #0x0e
	ld	hl, #(_splashtiles + 0x02de)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x02df)
	ld	(hl), #0x03
	ld	hl, #(_splashtiles + 0x02e0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02e1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02e2)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x02e3)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x02e4)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x02e5)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x02e6)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x02e7)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x02e8)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02e9)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ea)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02eb)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ec)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ed)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ee)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02ef)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f0)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f1)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f2)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x02f3)
	ld	(hl), #0xf0
	ld	hl, #(_splashtiles + 0x02f4)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f5)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f6)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f7)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f8)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02f9)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02fa)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02fb)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02fc)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02fd)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x02fe)
	ld	(hl), #0xfe
	ld	hl, #(_splashtiles + 0x02ff)
	ld	(hl), #0xfe
	ld	hl, #(_splashtiles + 0x0300)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0301)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0302)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0303)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0304)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0305)
	ld	(hl), #0x0f
	ld	hl, #(_splashtiles + 0x0306)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0307)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0308)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x0309)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x030a)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x030b)
	ld	(hl), #0x10
	ld	hl, #(_splashtiles + 0x030c)
	ld	(hl), #0x13
	ld	hl, #(_splashtiles + 0x030d)
	ld	(hl), #0x13
	ld	hl, #(_splashtiles + 0x030e)
	ld	(hl), #0x13
	ld	hl, #(_splashtiles + 0x030f)
	ld	(hl), #0x13
	ld	hl, #(_splashtiles + 0x0310)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0311)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0312)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0313)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0314)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0315)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0316)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0317)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0318)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x0319)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x031a)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x031b)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x031c)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x031d)
	ld	(hl), #0x08
	ld	hl, #(_splashtiles + 0x031e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x031f)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0320)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0321)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0322)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0323)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x0324)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0325)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0326)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x0327)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x0328)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x0329)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x032a)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x032b)
	ld	(hl), #0x40
	ld	hl, #(_splashtiles + 0x032c)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x032d)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x032e)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x032f)
	ld	(hl), #0x80
	ld	hl, #(_splashtiles + 0x0330)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0331)
	ld	(hl), #0xc0
	ld	hl, #(_splashtiles + 0x0332)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x0333)
	ld	(hl), #0x60
	ld	hl, #(_splashtiles + 0x0334)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0335)
	ld	(hl), #0x30
	ld	hl, #(_splashtiles + 0x0336)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0337)
	ld	(hl), #0x18
	ld	hl, #(_splashtiles + 0x0338)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x0339)
	ld	(hl), #0x0c
	ld	hl, #(_splashtiles + 0x033a)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x033b)
	ld	(hl), #0x06
	ld	hl, #(_splashtiles + 0x033c)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x033d)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x033e)
	ld	(hl), #0x00
	ld	hl, #(_splashtiles + 0x033f)
	ld	(hl), #0x00
;blankmap.c:25: unsigned char blankmap[] =
	ld	hl, #_blankmap
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0090)
	ld	(hl), #0x01
	ld	hl, #(_blankmap + 0x0091)
	ld	(hl), #0x02
	ld	hl, #(_blankmap + 0x0092)
	ld	(hl), #0x03
	ld	hl, #(_blankmap + 0x0093)
	ld	(hl), #0x01
	ld	hl, #(_blankmap + 0x0094)
	ld	(hl), #0x01
	ld	hl, #(_blankmap + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_blankmap + 0x0167)
	ld	(hl), #0x00
;blanktiles.c:26: unsigned char blanktiles[] =
	ld	hl, #_blanktiles
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_blanktiles + 0x000f)
	ld	(hl), #0x00
;collisionmap.c:1: unsigned int gridx, gridy, x, y, scrx, scry = 0;
	ld	hl, #_scry
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;collisionmap.c:3: int collisionmap[720] = {
	ld	hl, #_collisionmap
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0002)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0004)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0006)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0008)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x000a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x000c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x000e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0010)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0012)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0014)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0016)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0018)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x001a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x001c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x001e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0020)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0022)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0024)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0026)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0028)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x002a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x002c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x002e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0030)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0032)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0034)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0036)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0038)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x003a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x003c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x003e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0040)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0042)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0044)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0046)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0048)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x004a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x004c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x004e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0050)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0052)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0054)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0056)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0058)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x005a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x005c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x005e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0060)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0062)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0064)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0066)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0068)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x006a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x006c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x006e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0070)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0072)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0074)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0076)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0078)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x007a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x007c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x007e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0080)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0082)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0084)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0086)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0088)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x008a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x008c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x008e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0090)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0092)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0094)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0096)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0098)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x009a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x009c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x009e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00a0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00a2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00a4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00a6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00a8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00aa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00ac)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00ae)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00b0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00b2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00b4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00b6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00b8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00ba)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00bc)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00be)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00c0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00c2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00c4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00c6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00c8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00ca)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00cc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00ce)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00d0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00d2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00d4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00d6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00d8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00da)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00dc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00de)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00e0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00e2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00e4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00e6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00e8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00ea)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00ec)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00ee)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00f0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00f2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x00f4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00f6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00f8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00fa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00fc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x00fe)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0100)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0102)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0104)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0106)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0108)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x010a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x010c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x010e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0110)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0112)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0114)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0116)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0118)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x011a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x011c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x011e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0120)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0122)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0124)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0126)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0128)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x012a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x012c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x012e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0130)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0132)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0134)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0136)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0138)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x013a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x013c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x013e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0140)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0142)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0144)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0146)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0148)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x014a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x014c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x014e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0150)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0152)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0154)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0156)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0158)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x015a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x015c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x015e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0160)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0162)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0164)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0166)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0168)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x016a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x016c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x016e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0170)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0172)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0174)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0176)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0178)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x017a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x017c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x017e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0180)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0182)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0184)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0186)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0188)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x018a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x018c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x018e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0190)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0192)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0194)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0196)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0198)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x019a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x019c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x019e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01a0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01a2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01a4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01a6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01a8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01aa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01ac)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01ae)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01b0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01b2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01b4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01b6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01b8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01ba)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01bc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01be)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01c0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01c2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01c4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01c6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01c8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01ca)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01cc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01ce)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01d0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01d2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01d4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01d6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01d8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01da)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01dc)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01de)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01e0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01e2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x01e4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01e6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01e8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01ea)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01ec)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01ee)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01f0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01f2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01f4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01f6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01f8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01fa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01fc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x01fe)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0200)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0202)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0204)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0206)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0208)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x020a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x020c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x020e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0210)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0212)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0214)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0216)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0218)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x021a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x021c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x021e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0220)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0222)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0224)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0226)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0228)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x022a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x022c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x022e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0230)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0232)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0234)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0236)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0238)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x023a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x023c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x023e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0240)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0242)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0244)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0246)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0248)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x024a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x024c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x024e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0250)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0252)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0254)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0256)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0258)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x025a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x025c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x025e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0260)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0262)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0264)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0266)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0268)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x026a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x026c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x026e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0270)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0272)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0274)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0276)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0278)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x027a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x027c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x027e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0280)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0282)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0284)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0286)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0288)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x028a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x028c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x028e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0290)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0292)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0294)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0296)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0298)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x029a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x029c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x029e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02a0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02a2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02a4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02a6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02a8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02aa)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02ac)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02ae)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02b0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02b2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02b4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02b6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02b8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02ba)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02bc)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02be)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02c0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02c2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02c4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02c6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02c8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02ca)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02cc)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02ce)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02d0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02d2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02d4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02d6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02d8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02da)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02dc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02de)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02e0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02e2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02e4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02e6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02e8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02ea)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02ec)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02ee)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02f0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02f2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02f4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02f6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02f8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02fa)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x02fc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x02fe)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0300)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0302)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0304)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0306)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0308)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x030a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x030c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x030e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0310)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0312)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0314)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0316)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0318)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x031a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x031c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x031e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0320)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0322)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0324)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0326)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0328)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x032a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x032c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x032e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0330)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0332)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0334)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0336)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0338)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x033a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x033c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x033e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0340)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0342)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0344)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0346)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0348)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x034a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x034c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x034e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0350)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0352)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0354)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0356)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0358)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x035a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x035c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x035e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0360)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0362)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0364)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0366)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0368)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x036a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x036c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x036e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0370)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0372)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0374)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0376)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0378)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x037a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x037c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x037e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0380)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0382)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0384)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0386)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0388)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x038a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x038c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x038e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0390)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0392)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0394)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0396)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0398)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x039a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x039c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x039e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03a0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03a2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03a4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03a6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03a8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03aa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03ac)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03ae)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03b0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03b2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03b4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03b6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03b8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03ba)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03bc)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03be)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03c0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03c2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03c4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03c6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03c8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03ca)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03cc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03ce)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03d0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03d2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03d4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03d6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03d8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03da)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03dc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03de)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03e0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03e2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03e4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03e6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03e8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03ea)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03ec)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03ee)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03f0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03f2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03f4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03f6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x03f8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03fa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03fc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x03fe)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0400)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0402)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0404)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0406)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0408)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x040a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x040c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x040e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0410)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0412)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0414)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0416)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0418)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x041a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x041c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x041e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0420)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0422)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0424)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0426)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0428)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x042a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x042c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x042e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0430)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0432)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0434)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0436)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0438)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x043a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x043c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x043e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0440)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0442)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0444)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0446)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0448)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x044a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x044c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x044e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0450)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0452)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0454)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0456)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0458)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x045a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x045c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x045e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0460)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0462)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0464)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0466)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0468)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x046a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x046c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x046e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0470)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0472)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0474)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0476)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0478)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x047a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x047c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x047e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0480)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0482)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0484)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0486)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0488)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x048a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x048c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x048e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0490)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0492)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0494)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0496)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0498)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x049a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x049c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x049e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04a0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04a2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04a4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04a6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04a8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04aa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04ac)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04ae)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04b0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04b2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04b4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04b6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04b8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04ba)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04bc)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04be)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04c0)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04c2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04c4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04c6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04c8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04ca)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04cc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04ce)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04d0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04d2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04d4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04d6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04d8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04da)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04dc)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04de)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04e0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04e2)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04e4)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04e6)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04e8)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04ea)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04ec)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04ee)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04f0)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04f2)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04f4)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04f6)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04f8)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04fa)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x04fc)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x04fe)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0500)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0502)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0504)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0506)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0508)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x050a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x050c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x050e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0510)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0512)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0514)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0516)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0518)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x051a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x051c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x051e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0520)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0522)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0524)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0526)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0528)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x052a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x052c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x052e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0530)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0532)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0534)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0536)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0538)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x053a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x053c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x053e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0540)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0542)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0544)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0546)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0548)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x054a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x054c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x054e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0550)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0552)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0554)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0556)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0558)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x055a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x055c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x055e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0560)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0562)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0564)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0566)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0568)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x056a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x056c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x056e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0570)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0572)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0574)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0576)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x0578)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x057a)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x057c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x057e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0580)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0582)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0584)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0586)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0588)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x058a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x058c)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x058e)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0590)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0592)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0594)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0596)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x0598)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x059a)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #(_collisionmap + 0x059c)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #(_collisionmap + 0x059e)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:34: UBYTE spritesize = 8;
	ld	hl, #_spritesize
	ld	(hl), #0x08
;main.c:323: int max_laser = 3;
	ld	hl, #_max_laser
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
;main.c:324: int laser_active = 0;
	ld	hl, #_laser_active
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:326: int alien_fire = 0;
	ld	hl, #_alien_fire
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:483: unsigned char background_test_tiles[7] = {0x26,0x27,0x2A,0x2B,0x2F,0x31,0x34};
	ld	hl, #_background_test_tiles
	ld	(hl), #0x26
	ld	hl, #(_background_test_tiles + 0x0001)
	ld	(hl), #0x27
	ld	hl, #(_background_test_tiles + 0x0002)
	ld	(hl), #0x2a
	ld	hl, #(_background_test_tiles + 0x0003)
	ld	(hl), #0x2b
	ld	hl, #(_background_test_tiles + 0x0004)
	ld	(hl), #0x2f
	ld	hl, #(_background_test_tiles + 0x0005)
	ld	(hl), #0x31
	ld	hl, #(_background_test_tiles + 0x0006)
	ld	(hl), #0x34
;main.c:595: int scr = 0;
	ld	hl, #_scr
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:596: int currentscore[1] = {0};
	ld	hl, #_currentscore
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:597: int bestscore[1] = {0};
	ld	hl, #_bestscore
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:598: int topscore = 0;
	ld	hl, #_topscore
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:599: int lives = 3;
	ld	hl, #_lives
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
;main.c:600: int gameover = 0;
	ld	hl, #_gameover
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:601: int z = -3;
	ld	hl, #_z
	ld	(hl), #0xfd
	inc	hl
	ld	(hl), #0xff
;main.c:602: int level = 1;
	ld	hl, #_level
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;main.c:603: int timer = 0;
	ld	hl, #_timer
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:714: int restart = 1;
	ld	hl, #_restart
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;collisionmap.c:42: long gridpos(int addx, int addy){
;	---------------------------------
; Function gridpos
; ---------------------------------
_gridpos::
;collisionmap.c:43: gridx = (x/8) + addx;
	ld	hl, #_x + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	add	a, c
	ld	hl, #_gridx
	ld	(hl), a
	ld	a, d
	adc	a, b
	inc	hl
	ld	(hl), a
;collisionmap.c:44: gridy = (y/8) + addy;
	ld	hl, #_y + 1
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	add	a, c
	ld	hl, #_gridy
	ld	(hl), a
	ld	a, d
	adc	a, b
	inc	hl
;collisionmap.c:45: return  collisionmap[((20*gridy) + gridx)];
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_gridx
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	de, #_collisionmap
	add	hl, de
	ld	a, (hl+)
	ld	c, (hl)
	ld	e, a
	ld	a, c
	ld	d, a
	rla
	sbc	a, a
	ld	l, a
	ld	h, a
;collisionmap.c:46: }
	ret
;main.c:38: void performancedelay(UINT8 numloops){
;	---------------------------------
; Function performancedelay
; ---------------------------------
_performancedelay::
;main.c:40: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:41: wait_vbl_done();
	call	_wait_vbl_done
;main.c:40: for(i = 0; i < numloops; i++){
	inc	c
;main.c:43: }
	jr	00103$
;main.c:45: void fade_out(){
;	---------------------------------
; Function fade_out
; ---------------------------------
_fade_out::
;main.c:46: for(i=0;i<4;i++){
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;main.c:47: switch (i){
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;main.c:48: case 0/* constant-expression */:
00101$:
;main.c:49: BGP_REG = 0xE4;/* code */
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;main.c:50: break;
	jr	00105$
;main.c:51: case 1:
00102$:
;main.c:52: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;main.c:53: break;
	jr	00105$
;main.c:54: case 2:
00103$:
;main.c:55: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;main.c:56: break;
	jr	00105$
;main.c:57: case 3:
00104$:
;main.c:58: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
;main.c:60: }
00105$:
;main.c:61: performancedelay(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performancedelay
	inc	sp
;main.c:46: for(i=0;i<4;i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00107$
;main.c:63: }
	ret
;main.c:65: void fade_in(){
;	---------------------------------
; Function fade_in
; ---------------------------------
_fade_in::
;main.c:66: for(i=0;i<4;i++){
	ld	hl, #_i
	ld	(hl), #0x00
00107$:
;main.c:67: switch (i){
	ld	a, (#_i)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_i)
	dec	a
	jr	Z, 00102$
	ld	a, (#_i)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_i)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;main.c:68: case 0/* constant-expression */:
00101$:
;main.c:69: BGP_REG = 0xFF;/* code */
	ld	a, #0xff
	ldh	(_BGP_REG+0),a
;main.c:70: break;
	jr	00105$
;main.c:71: case 1:
00102$:
;main.c:72: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG+0),a
;main.c:73: break;
	jr	00105$
;main.c:74: case 2:
00103$:
;main.c:75: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG+0),a
;main.c:76: break;
	jr	00105$
;main.c:77: case 3:
00104$:
;main.c:78: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG+0),a
;main.c:79: }
00105$:
;main.c:80: performancedelay(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performancedelay
	inc	sp
;main.c:66: for(i=0;i<4;i++){
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00107$
;main.c:82: }
	ret
;main.c:91: void splashscreen(){
;	---------------------------------
; Function splashscreen
; ---------------------------------
_splashscreen::
;main.c:92: set_bkg_data(0, 52, splashtiles);
	ld	hl, #_splashtiles
	push	hl
	ld	a, #0x34
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:93: set_bkg_tiles(0,0,20,18,splashmap);
	ld	hl, #_splashmap
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:94: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:95: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:96: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
;main.c:97: fade_out();
	call	_fade_out
;main.c:98: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
;main.c:99: printf("\n \n \n \n \n \n \n \n \n \n ===Press Start===");
	ld	hl, #___str_0
	push	hl
	call	_printf
	add	sp, #2
;main.c:100: fade_in();
	call	_fade_in
;main.c:101: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:102: fade_out();
	call	_fade_out
;main.c:103: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
;main.c:104: }
	ret
___str_0:
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " ===Press Start==="
	.db 0x00
;main.c:109: void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
;	---------------------------------
; Function movegamecharacter
; ---------------------------------
_movegamecharacter::
	add	sp, #-3
;main.c:110: move_sprite(character->spriteids[0],x,y);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:111: move_sprite(character->spriteids[2], x + spritesize, y);
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, c
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:112: move_sprite(character->spriteids[1], x, y + spritesize);
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	l, e
	ld	h, d
	inc	hl
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	dec	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:113: move_sprite(character->spriteids[3], x + spritesize, y + spritesize);
	dec	hl
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:113: move_sprite(character->spriteids[3], x + spritesize, y + spritesize);
;main.c:114: }
	add	sp, #3
	ret
;main.c:116: void setupplayer(){
;	---------------------------------
; Function setupplayer
; ---------------------------------
_setupplayer::
;main.c:117: player.x = 80;
	ld	bc, #_player+0
	ld	hl, #(_player + 0x0018)
	ld	(hl), #0x50
;main.c:118: player.y = 100;
	ld	hl, #(_player + 0x0019)
	ld	(hl), #0x64
;main.c:119: player.width = 16;
	ld	hl, #(_player + 0x001a)
	ld	(hl), #0x10
;main.c:120: player.height = 16;
	ld	hl, #(_player + 0x001b)
	ld	(hl), #0x10
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;main.c:123: player.spriteids[0] = 0;
	xor	a, a
	ld	(bc), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x01
;main.c:125: player.spriteids[1] = 1;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x01
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x02
;main.c:127: player.spriteids[2] = 2;
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x02
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), #0x03
;main.c:129: player.spriteids[3] = 3;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x03
;main.c:131: movegamecharacter(&player, player.x,player.y); 
	ld	a, (#(_player + 0x0019) + 0)
	ld	hl, #(_player + 0x0018)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:132: }
	ret
;main.c:134: void setupalien1(){
;	---------------------------------
; Function setupalien1
; ---------------------------------
_setupalien1::
;main.c:135: alien1.x = 30;
	ld	bc, #_alien1+0
	ld	hl, #(_alien1 + 0x0018)
	ld	(hl), #0x1e
;main.c:136: alien1.y = 0;
	ld	hl, #(_alien1 + 0x0019)
	ld	(hl), #0x00
;main.c:137: alien1.width = 16;
	ld	hl, #(_alien1 + 0x001a)
	ld	(hl), #0x10
;main.c:138: alien1.height = 16;
	ld	hl, #(_alien1 + 0x001b)
	ld	(hl), #0x10
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0012)
	ld	(hl), #0x04
;main.c:141: alien1.spriteids[0] = 4;
	ld	a, #0x04
	ld	(bc), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0016)
	ld	(hl), #0x05
;main.c:143: alien1.spriteids[1] = 5;
	ld	hl, #(_alien1 + 0x0001)
	ld	(hl), #0x05
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x001a)
	ld	(hl), #0x06
;main.c:145: alien1.spriteids[2] = 6;
	ld	hl, #(_alien1 + 0x0002)
	ld	(hl), #0x06
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x001e)
	ld	(hl), #0x07
;main.c:147: alien1.spriteids[3] = 7;
	ld	hl, #(_alien1 + 0x0003)
	ld	(hl), #0x07
;main.c:154: movegamecharacter(& alien1, alien1.x, alien1.y);
	ld	a, (#(_alien1 + 0x0019) + 0)
	ld	hl, #(_alien1 + 0x0018)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:155: }
	ret
;main.c:157: void setupalien2(){
;	---------------------------------
; Function setupalien2
; ---------------------------------
_setupalien2::
;main.c:158: alien2.x = 150;
	ld	bc, #_alien2+0
	ld	hl, #(_alien2 + 0x0018)
	ld	(hl), #0x96
;main.c:159: alien2.y = 0;
	ld	hl, #(_alien2 + 0x0019)
	ld	(hl), #0x00
;main.c:160: alien2.width = 16;
	ld	hl, #(_alien2 + 0x001a)
	ld	(hl), #0x10
;main.c:161: alien2.height = 16;
	ld	hl, #(_alien2 + 0x001b)
	ld	(hl), #0x10
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0022)
	ld	(hl), #0x04
;main.c:164: alien2.spriteids[0] = 8;
	ld	a, #0x08
	ld	(bc), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0026)
	ld	(hl), #0x05
;main.c:166: alien2.spriteids[1] = 9;
	ld	hl, #(_alien2 + 0x0001)
	ld	(hl), #0x09
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x002a)
	ld	(hl), #0x06
;main.c:168: alien2.spriteids[2] = 10;
	ld	hl, #(_alien2 + 0x0002)
	ld	(hl), #0x0a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x002e)
	ld	(hl), #0x07
;main.c:170: alien2.spriteids[3] = 11;
	ld	hl, #(_alien2 + 0x0003)
	ld	(hl), #0x0b
;main.c:172: movegamecharacter(&alien2, alien2.x, alien2.y);
	ld	a, (#(_alien2 + 0x0019) + 0)
	ld	hl, #(_alien2 + 0x0018)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:173: }
	ret
;main.c:175: void setupalienship1(){
;	---------------------------------
; Function setupalienship1
; ---------------------------------
_setupalienship1::
;main.c:176: alienship1.x = 80;
	ld	bc, #_alienship1+0
	ld	hl, #(_alienship1 + 0x0018)
	ld	(hl), #0x50
;main.c:177: alienship1.y = 0;
	ld	hl, #(_alienship1 + 0x0019)
	ld	(hl), #0x00
;main.c:178: alienship1.width = 16;
	ld	hl, #(_alienship1 + 0x001a)
	ld	(hl), #0x10
;main.c:179: alienship1.height = 16;
	ld	hl, #(_alienship1 + 0x001b)
	ld	(hl), #0x10
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0042)
	ld	(hl), #0x08
;main.c:182: alienship1.spriteids[0] = 16;
	ld	a, #0x10
	ld	(bc), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0046)
	ld	(hl), #0x09
;main.c:184: alienship1.spriteids[1] = 17;
	ld	hl, #(_alienship1 + 0x0001)
	ld	(hl), #0x11
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x004a)
	ld	(hl), #0x0a
;main.c:186: alienship1.spriteids[2] = 18;
	ld	hl, #(_alienship1 + 0x0002)
	ld	(hl), #0x12
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x004e)
	ld	(hl), #0x0b
;main.c:188: alienship1.spriteids[3] = 19;
	ld	hl, #(_alienship1 + 0x0003)
	ld	(hl), #0x13
;main.c:190: movegamecharacter(&alienship1, alienship1.x,alienship1.y); 
	ld	a, (#(_alienship1 + 0x0019) + 0)
	ld	hl, #(_alienship1 + 0x0018)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:191: }
	ret
;main.c:193: void setupalienship2(){
;	---------------------------------
; Function setupalienship2
; ---------------------------------
_setupalienship2::
;main.c:194: alienship2.x = 100;
	ld	bc, #_alienship2+0
	ld	hl, #(_alienship2 + 0x0018)
	ld	(hl), #0x64
;main.c:195: alienship2.y = 0;
	ld	hl, #(_alienship2 + 0x0019)
	ld	(hl), #0x00
;main.c:196: alienship2.width = 16;
	ld	hl, #(_alienship2 + 0x001a)
	ld	(hl), #0x10
;main.c:197: alienship2.height = 16;
	ld	hl, #(_alienship2 + 0x001b)
	ld	(hl), #0x10
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0082)
	ld	(hl), #0x08
;main.c:200: alienship2.spriteids[0] = 32;
	ld	a, #0x20
	ld	(bc), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0086)
	ld	(hl), #0x09
;main.c:202: alienship2.spriteids[1] = 33;
	ld	hl, #(_alienship2 + 0x0001)
	ld	(hl), #0x21
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x008a)
	ld	(hl), #0x0a
;main.c:204: alienship2.spriteids[2] = 34;
	ld	hl, #(_alienship2 + 0x0002)
	ld	(hl), #0x22
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x008e)
	ld	(hl), #0x0b
;main.c:206: alienship2.spriteids[3] = 35;
	ld	hl, #(_alienship2 + 0x0003)
	ld	(hl), #0x23
;main.c:208: movegamecharacter(&alienship2, alienship2.x,alienship2.y); 
	ld	a, (#(_alienship2 + 0x0019) + 0)
	ld	hl, #(_alienship2 + 0x0018)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:209: }
	ret
;main.c:211: void movealiens1(){
;	---------------------------------
; Function movealiens1
; ---------------------------------
_movealiens1::
;main.c:212: alien1.y += 1;
	ld	a, (#(_alien1 + 0x0019) + 0)
	inc	a
	ld	(#(_alien1 + 0x0019)),a
;main.c:213: alien1.x += 2;
	ld	a, (#(_alien1 + 0x0018) + 0)
	add	a, #0x02
	ld	(#(_alien1 + 0x0018)),a
;main.c:215: alienship1.y += 4;
	ld	a, (#(_alienship1 + 0x0019) + 0)
	add	a, #0x04
	ld	(#(_alienship1 + 0x0019)),a
;main.c:217: alienship2.y += 4;
	ld	a, (#(_alienship2 + 0x0019) + 0)
	add	a, #0x04
	ld	(#(_alienship2 + 0x0019)),a
;main.c:219: alien2.y += 1;
	ld	a, (#(_alien2 + 0x0019) + 0)
	inc	a
	ld	(#(_alien2 + 0x0019)),a
;main.c:220: alien2.x -= 2;
	ld	bc, #_alien2 + 24
	ld	a, (bc)
	dec	a
	dec	a
	ld	(bc), a
;main.c:222: if(alien1.y >= 144){
	ld	a, (#(_alien1 + 0x0019) + 0)
	sub	a, #0x90
	jr	C, 00102$
;main.c:223: alien1.y = 0;
	ld	hl, #(_alien1 + 0x0019)
	ld	(hl), #0x00
;main.c:224: alien1.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(#(_alien1 + 0x0018)),a
00102$:
;main.c:213: alien1.x += 2;
	ld	hl, #(_alien1 + 0x0018)
	ld	l, (hl)
;main.c:226: if(alien1.x > 140){
	ld	a, #0x8c
	sub	a, l
	jr	NC, 00104$
;main.c:227: alien1.x -= 2;
	ld	a, l
	dec	a
	dec	a
	ld	(#(_alien1 + 0x0018)),a
00104$:
;main.c:220: alien2.x -= 2;
	ld	a, (bc)
;main.c:229: if(alien2.x < 20){
	cp	a, #0x14
	jr	NC, 00106$
;main.c:230: alien2.x += 2;
	add	a, #0x02
	ld	(bc), a
00106$:
;main.c:233: if(alien2.y >= 144){
	ld	a, (#(_alien2 + 0x0019) + 0)
	sub	a, #0x90
	jr	C, 00108$
;main.c:234: alien2.y = 0;
	ld	hl, #(_alien2 + 0x0019)
	ld	(hl), #0x00
;main.c:235: alien2.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(bc), a
00108$:
;main.c:220: alien2.x -= 2;
	ld	a, (bc)
;main.c:237: if(alien2.x < 20){
	cp	a, #0x14
	jr	NC, 00110$
;main.c:238: alien2.x += 2;
	add	a, #0x02
	ld	(bc), a
00110$:
;main.c:220: alien2.x -= 2;
	ld	a, (bc)
	ld	e, a
;main.c:240: if(alien2.x > 140){
	ld	a, #0x8c
	sub	a, e
	jr	NC, 00112$
;main.c:241: alien2.x -= 2;
	ld	a, e
	dec	a
	dec	a
	ld	(bc), a
00112$:
;main.c:244: if(alienship1.y >= 144){
	ld	hl, #(_alienship1 + 0x0019)
	ld	l, (hl)
;main.c:246: alienship1.x = rand();
	ld	bc, #_alienship1 + 24
;main.c:244: if(alienship1.y >= 144){
	ld	a, l
	sub	a, #0x90
	jr	C, 00114$
;main.c:245: alienship1.y = 0;
	ld	hl, #(_alienship1 + 0x0019)
	ld	(hl), #0x00
;main.c:246: alienship1.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(bc), a
00114$:
;main.c:248: if(alienship1.x < 20){
	ld	a, (bc)
	sub	a, #0x14
	jr	NC, 00116$
;main.c:249: alienship1.x = 20;
	ld	a, #0x14
	ld	(bc), a
00116$:
;main.c:251: if(alienship1.x > 140){
	ld	a, (bc)
	ld	e, a
;main.c:252: alienship1.x = 140;
	ld	a,#0x8c
	cp	a,e
	jr	NC, 00118$
	ld	(bc), a
00118$:
;main.c:255: if(alienship2.y >= 144){
	ld	hl, #(_alienship2 + 0x0019)
	ld	l, (hl)
;main.c:257: alienship2.x = rand();
	ld	bc, #_alienship2 + 24
;main.c:255: if(alienship2.y >= 144){
	ld	a, l
	sub	a, #0x90
	jr	C, 00120$
;main.c:256: alienship2.y = 0;
	ld	hl, #(_alienship2 + 0x0019)
	ld	(hl), #0x00
;main.c:257: alienship2.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(bc), a
00120$:
;main.c:259: if(alienship2.x < 20){
	ld	a, (bc)
	sub	a, #0x14
	jr	NC, 00122$
;main.c:260: alienship2.x = 20;
	ld	a, #0x14
	ld	(bc), a
00122$:
;main.c:262: if(alienship2.x > 140){
	ld	a, (bc)
	ld	e, a
;main.c:263: alienship2.x = 140;
	ld	a,#0x8c
	cp	a,e
	ret	NC
	ld	(bc), a
;main.c:265: }
	ret
;main.c:267: void movealiens2(){
;	---------------------------------
; Function movealiens2
; ---------------------------------
_movealiens2::
;main.c:268: alien1.y += 1;
	ld	a, (#(_alien1 + 0x0019) + 0)
	inc	a
	ld	(#(_alien1 + 0x0019)),a
;main.c:269: alien1.x += 2;
	ld	a, (#(_alien1 + 0x0018) + 0)
	add	a, #0x02
	ld	(#(_alien1 + 0x0018)),a
;main.c:271: alienship1.y += 4;
	ld	a, (#(_alienship1 + 0x0019) + 0)
	add	a, #0x04
	ld	(#(_alienship1 + 0x0019)),a
;main.c:273: alienship2.y += 4;
	ld	a, (#(_alienship2 + 0x0019) + 0)
	add	a, #0x04
	ld	(#(_alienship2 + 0x0019)),a
;main.c:275: alien2.y += 1;
	ld	a, (#(_alien2 + 0x0019) + 0)
	inc	a
	ld	(#(_alien2 + 0x0019)),a
;main.c:276: alien2.x -= 2;
	ld	bc, #_alien2 + 24
	ld	a, (bc)
	dec	a
	dec	a
	ld	(bc), a
;main.c:278: if(alien1.y >= 144){
	ld	a, (#(_alien1 + 0x0019) + 0)
	sub	a, #0x90
	jr	C, 00102$
;main.c:279: alien1.y = 0;
	ld	hl, #(_alien1 + 0x0019)
	ld	(hl), #0x00
;main.c:280: alien1.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(#(_alien1 + 0x0018)),a
00102$:
;main.c:269: alien1.x += 2;
	ld	hl, #(_alien1 + 0x0018)
	ld	l, (hl)
;main.c:282: if(alien1.x > 140){
	ld	a, #0x8c
	sub	a, l
	jr	NC, 00104$
;main.c:283: alien1.x -= 2;
	ld	a, l
	dec	a
	dec	a
	ld	(#(_alien1 + 0x0018)),a
00104$:
;main.c:276: alien2.x -= 2;
	ld	a, (bc)
;main.c:285: if(alien2.x < 20){
	cp	a, #0x14
	jr	NC, 00106$
;main.c:286: alien2.x += 2;
	add	a, #0x02
	ld	(bc), a
00106$:
;main.c:289: if(alien2.y >= 144){
	ld	a, (#(_alien2 + 0x0019) + 0)
	sub	a, #0x90
	jr	C, 00108$
;main.c:290: alien2.y = 0;
	ld	hl, #(_alien2 + 0x0019)
	ld	(hl), #0x00
;main.c:291: alien2.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(bc), a
00108$:
;main.c:276: alien2.x -= 2;
	ld	a, (bc)
;main.c:293: if(alien2.x < 20){
	cp	a, #0x14
	jr	NC, 00110$
;main.c:294: alien2.x += 2;
	add	a, #0x02
	ld	(bc), a
00110$:
;main.c:276: alien2.x -= 2;
	ld	a, (bc)
	ld	e, a
;main.c:296: if(alien2.x > 140){
	ld	a, #0x8c
	sub	a, e
	jr	NC, 00112$
;main.c:297: alien2.x -= 2;
	ld	a, e
	dec	a
	dec	a
	ld	(bc), a
00112$:
;main.c:300: if(alienship1.y >= 144){
	ld	hl, #(_alienship1 + 0x0019)
	ld	l, (hl)
;main.c:302: alienship1.x = rand();
	ld	bc, #_alienship1 + 24
;main.c:300: if(alienship1.y >= 144){
	ld	a, l
	sub	a, #0x90
	jr	C, 00114$
;main.c:301: alienship1.y = 0;
	ld	hl, #(_alienship1 + 0x0019)
	ld	(hl), #0x00
;main.c:302: alienship1.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(bc), a
00114$:
;main.c:304: if(alienship1.x < 20){
	ld	a, (bc)
	sub	a, #0x14
	jr	NC, 00116$
;main.c:305: alienship1.x = 20;
	ld	a, #0x14
	ld	(bc), a
00116$:
;main.c:307: if(alienship1.x > 140){
	ld	a, (bc)
	ld	e, a
;main.c:308: alienship1.x = 140;
	ld	a,#0x8c
	cp	a,e
	jr	NC, 00118$
	ld	(bc), a
00118$:
;main.c:311: if(alienship2.y >= 144){
	ld	hl, #(_alienship2 + 0x0019)
	ld	l, (hl)
;main.c:313: alienship2.x = rand();
	ld	bc, #_alienship2 + 24
;main.c:311: if(alienship2.y >= 144){
	ld	a, l
	sub	a, #0x90
	jr	C, 00120$
;main.c:312: alienship2.y = 0;
	ld	hl, #(_alienship2 + 0x0019)
	ld	(hl), #0x00
;main.c:313: alienship2.x = rand();
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	ld	(bc), a
00120$:
;main.c:315: if(alienship2.x < 20){
	ld	a, (bc)
	sub	a, #0x14
	jr	NC, 00122$
;main.c:316: alienship2.x = 20;
	ld	a, #0x14
	ld	(bc), a
00122$:
;main.c:318: if(alienship2.x > 140){
	ld	a, (bc)
	ld	e, a
;main.c:319: alienship2.x = 140;
	ld	a,#0x8c
	cp	a,e
	ret	NC
	ld	(bc), a
;main.c:321: }
	ret
;main.c:328: void setuplaser(){
;	---------------------------------
; Function setuplaser
; ---------------------------------
_setuplaser::
;main.c:329: laser.x = 0;
	ld	bc, #_laser+0
	ld	hl, #(_laser + 0x0018)
	ld	(hl), #0x00
;main.c:330: laser.y = 0;
	ld	hl, #(_laser + 0x0019)
	ld	(hl), #0x00
;main.c:331: laser.width = 16;
	ld	hl, #(_laser + 0x001a)
	ld	(hl), #0x10
;main.c:332: laser.height = 16;
	ld	hl, #(_laser + 0x001b)
	ld	(hl), #0x10
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0062)
	ld	(hl), #0x0c
;main.c:335: laser.spriteids[0] = 24;
	ld	a, #0x18
	ld	(bc), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0066)
	ld	(hl), #0x0d
;main.c:337: laser.spriteids[1] = 25;
	ld	hl, #(_laser + 0x0001)
	ld	(hl), #0x19
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x006a)
	ld	(hl), #0x0e
;main.c:339: laser.spriteids[2] = 26;
	ld	hl, #(_laser + 0x0002)
	ld	(hl), #0x1a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x006e)
	ld	(hl), #0x0f
;main.c:341: laser.spriteids[3] = 27;
	ld	hl, #(_laser + 0x0003)
	ld	(hl), #0x1b
;main.c:343: movegamecharacter(&laser, laser.x, laser.y);
	ld	a, (#(_laser + 0x0019) + 0)
	ld	hl, #(_laser + 0x0018)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:344: }
	ret
;main.c:346: void move_lasers(){
;	---------------------------------
; Function move_lasers
; ---------------------------------
_move_lasers::
;main.c:347: laser.y -= 25;
	ld	bc, #_laser+25
	ld	a, (bc)
	add	a, #0xe7
;main.c:348: if(laser.y > 150){
	ld	(bc), a
	ld	e, a
	ld	a, #0x96
	sub	a, e
	ret	NC
;main.c:349: laser.y = 0;
	xor	a, a
	ld	(bc), a
;main.c:350: fire = FALSE;
	ld	hl, #_fire
	ld	(hl), #0x00
;main.c:351: laser_active -= 1;
	ld	hl, #_laser_active + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:353: }
	ret
;main.c:355: void setup_alien_laser(){
;	---------------------------------
; Function setup_alien_laser
; ---------------------------------
_setup_alien_laser::
;main.c:356: alien_laser.x = 0;
	ld	bc, #_alien_laser+0
	ld	hl, #(_alien_laser + 0x0018)
	ld	(hl), #0x00
;main.c:357: alien_laser.y = 0;
	ld	hl, #(_alien_laser + 0x0019)
	ld	(hl), #0x00
;main.c:358: alien_laser.width = 16;
	ld	hl, #(_alien_laser + 0x001a)
	ld	(hl), #0x10
;main.c:359: alien_laser.height = 16;
	ld	hl, #(_alien_laser + 0x001b)
	ld	(hl), #0x10
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0072)
	ld	(hl), #0x0c
;main.c:362: alien_laser.spriteids[0] = 28;
	ld	a, #0x1c
	ld	(bc), a
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0076)
	ld	(hl), #0x0d
;main.c:364: alien_laser.spriteids[1] = 29;
	ld	hl, #(_alien_laser + 0x0001)
	ld	(hl), #0x1d
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x007a)
	ld	(hl), #0x0e
;main.c:366: alien_laser.spriteids[2] = 30;
	ld	hl, #(_alien_laser + 0x0002)
	ld	(hl), #0x1e
;/Users/dustinbrooks/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x007e)
	ld	(hl), #0x0f
;main.c:368: alien_laser.spriteids[3] = 31;
	ld	hl, #(_alien_laser + 0x0003)
	ld	(hl), #0x1f
;main.c:370: movegamecharacter(&alien_laser, alien_laser.x, alien_laser.y);
	ld	a, (#(_alien_laser + 0x0019) + 0)
	ld	hl, #(_alien_laser + 0x0018)
	ld	h, (hl)
	push	af
	inc	sp
	push	hl
	inc	sp
	push	bc
	call	_movegamecharacter
	add	sp, #4
;main.c:371: }
	ret
;main.c:373: void alien_lasers(){
;	---------------------------------
; Function alien_lasers
; ---------------------------------
_alien_lasers::
;main.c:374: if(alien_fire){
	ld	hl, #_alien_fire + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
;main.c:376: NR10_REG = 0x2F;
	ld	a, #0x2f
	ldh	(_NR10_REG+0),a
;main.c:377: NR11_REG = 0x4C;
	ld	a, #0x4c
	ldh	(_NR11_REG+0),a
;main.c:378: NR12_REG = 0xF8;
	ld	a, #0xf8
	ldh	(_NR12_REG+0),a
;main.c:379: NR13_REG = 0x33;
	ld	a, #0x33
	ldh	(_NR13_REG+0),a
;main.c:380: NR14_REG = 0xC7;
	ld	a, #0xc7
	ldh	(_NR14_REG+0),a
;main.c:382: alien_laser.x = alienship1.x;
	ld	bc, #_alien_laser + 24
	ld	a, (#(_alienship1 + 0x0018) + 0)
	ld	(bc), a
;main.c:383: alien_laser.y = alienship1.y + 5;
	ld	bc, #_alien_laser + 25
	ld	a, (#(_alienship1 + 0x0019) + 0)
	add	a, #0x05
	ld	(bc), a
;main.c:384: alien_laser.y += 25;
	ld	a, (bc)
	add	a, #0x19
	ld	(bc), a
;main.c:385: alien_fire += 1;
	inc	(hl)
	jr	NZ, 00117$
	inc	hl
	inc	(hl)
00117$:
00102$:
;main.c:388: if(alien_laser.y <= 0){
	ld	bc, #_alien_laser+25
	ld	a, (bc)
	or	a, a
	ret	NZ
;main.c:389: alien_laser.y = 0;
	xor	a, a
	ld	(bc), a
;main.c:390: alien_fire -= 0; 
;main.c:392: }
	ret
;main.c:394: void storealiens(){
;	---------------------------------
; Function storealiens
; ---------------------------------
_storealiens::
;main.c:395: alienship1.x = 0;
	ld	hl, #(_alienship1 + 0x0018)
	ld	(hl), #0x00
;main.c:396: alienship1.y = 0;
	ld	hl, #(_alienship1 + 0x0019)
	ld	(hl), #0x00
;main.c:398: alienship2.x = 0;
	ld	hl, #(_alienship2 + 0x0018)
	ld	(hl), #0x00
;main.c:399: alienship2.y = 0;
	ld	hl, #(_alienship2 + 0x0019)
	ld	(hl), #0x00
;main.c:401: alien1.x = 0;
	ld	hl, #(_alien1 + 0x0018)
	ld	(hl), #0x00
;main.c:402: alien1.y = 0;
	ld	hl, #(_alien1 + 0x0019)
	ld	(hl), #0x00
;main.c:404: alien2.x = 0;
	ld	hl, #(_alien2 + 0x0018)
	ld	(hl), #0x00
;main.c:405: alien2.y = 0;
	ld	hl, #(_alien2 + 0x0019)
	ld	(hl), #0x00
;main.c:406: }
	ret
;main.c:408: void hide_player(){
;	---------------------------------
; Function hide_player
; ---------------------------------
_hide_player::
;main.c:409: player.x = 0;
	ld	hl, #(_player + 0x0018)
	ld	(hl), #0x00
;main.c:410: player.y = 0;
	ld	hl, #(_player + 0x0019)
	ld	(hl), #0x00
;main.c:411: }
	ret
;main.c:413: void reset_player(){
;	---------------------------------
; Function reset_player
; ---------------------------------
_reset_player::
;main.c:414: player.x = 80;
	ld	hl, #(_player + 0x0018)
	ld	(hl), #0x50
;main.c:415: player.y = 100;
	ld	hl, #(_player + 0x0019)
	ld	(hl), #0x64
;main.c:416: }
	ret
;main.c:421: void engine(){
;	---------------------------------
; Function engine
; ---------------------------------
_engine::
;main.c:422: NR41_REG = 0x36;
	ld	a, #0x36
	ldh	(_NR41_REG+0),a
;main.c:423: NR42_REG = 0x70;
	ld	a, #0x70
	ldh	(_NR42_REG+0),a
;main.c:424: NR43_REG = 0x98;
	ld	a, #0x98
	ldh	(_NR43_REG+0),a
;main.c:425: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG+0),a
;main.c:426: }
	ret
;main.c:428: void died(){
;	---------------------------------
; Function died
; ---------------------------------
_died::
;main.c:429: NR10_REG = 0x3B;
	ld	a, #0x3b
	ldh	(_NR10_REG+0),a
;main.c:430: NR11_REG = 0x44;
	ld	a, #0x44
	ldh	(_NR11_REG+0),a
;main.c:431: NR12_REG = 0xF7;
	ld	a, #0xf7
	ldh	(_NR12_REG+0),a
;main.c:432: NR13_REG = 0x74;
	ld	a, #0x74
	ldh	(_NR13_REG+0),a
;main.c:433: NR14_REG = 0xC5;
	ld	a, #0xc5
	ldh	(_NR14_REG+0),a
;main.c:435: storealiens();
	call	_storealiens
;main.c:436: hide_player();
	call	_hide_player
;main.c:437: fade_out();
	call	_fade_out
;main.c:438: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
;main.c:439: reset_player();
	call	_reset_player
;main.c:440: fade_in();
;main.c:441: }
	jp  _fade_in
;main.c:443: void explosion(){
;	---------------------------------
; Function explosion
; ---------------------------------
_explosion::
;main.c:449: NR41_REG = 0x09;
	ld	a, #0x09
	ldh	(_NR41_REG+0),a
;main.c:450: NR42_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR42_REG+0),a
;main.c:451: NR43_REG = 0x89;
	ld	a, #0x89
	ldh	(_NR43_REG+0),a
;main.c:452: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG+0),a
;main.c:469: }
	ret
;main.c:471: void laser_fire(){
;	---------------------------------
; Function laser_fire
; ---------------------------------
_laser_fire::
;main.c:472: NR10_REG = 0x2F;
	ld	a, #0x2f
	ldh	(_NR10_REG+0),a
;main.c:473: NR11_REG = 0x4C;
	ld	a, #0x4c
	ldh	(_NR11_REG+0),a
;main.c:474: NR12_REG = 0xF8;
	ld	a, #0xf8
	ldh	(_NR12_REG+0),a
;main.c:475: NR13_REG = 0x33;
	ld	a, #0x33
	ldh	(_NR13_REG+0),a
;main.c:476: NR14_REG = 0xC7;
	ld	a, #0xc7
	ldh	(_NR14_REG+0),a
;main.c:477: }
	ret
;main.c:485: UBYTE if_can_move(UINT8 newplayerX, UINT8 newplayerY){
;	---------------------------------
; Function if_can_move
; ---------------------------------
_if_can_move::
	add	sp, #-6
;main.c:489: indexTLx = ((newplayerX - 8) /8);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	bit	7, b
	jr	Z, 00103$
;c
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xffff
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00103$:
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
;main.c:490: indexTLy = ((newplayerY - 16) /8);
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	bit	7, b
	jr	Z, 00104$
;c
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff7
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
00104$:
	ldhl	sp,#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:491: tileindexTL = (20 * indexTLy) + indexTLx; 
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	add	hl, bc
;main.c:492: result = background[tileindexTL] == !background_test_tiles[0,1,2,3,4,5,6];
	ld	bc,#_background
	add	hl,bc
	ld	c, (hl)
	ld	a, (#(_background_test_tiles + 0x0006) + 0)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	b, a
	ld	a, c
	sub	a, b
	ld	a, #0x01
	jr	Z, 00116$
	xor	a, a
00116$:
;main.c:495: return result;
	ld	e, a
;main.c:496: }
	add	sp, #6
	ret
_blankmap_tile:
	.db #0x00	;  0
;main.c:501: void pause(){
;	---------------------------------
; Function pause
; ---------------------------------
_pause::
;main.c:508: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:511: }
	ret
;main.c:513: void ohjoy(){
;	---------------------------------
; Function ohjoy
; ---------------------------------
_ohjoy::
;main.c:515: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00106$
;main.c:516: if(if_can_move(player.x -3, player.y)){
	ld	de, #_player + 25
	ld	a, (de)
	ld	h, a
	ld	bc, #_player + 24
	ld	a, (bc)
	add	a, #0xfd
	push	bc
	push	de
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_if_can_move
	add	sp, #2
	ld	a, e
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00102$
;main.c:517: player.x -= 3;
	ld	a, (bc)
	add	a, #0xfd
	ld	(bc), a
;main.c:518: movegamecharacter(&player, player.x, player.y);
	ld	a, (de)
	ld	d, a
	ld	a, (bc)
	ld	e, a
	push	bc
	push	de
	ld	hl, #_player
	push	hl
	call	_movegamecharacter
	add	sp, #4
	pop	bc
00102$:
;main.c:520: if(player.x <= 20){
	ld	a, (bc)
	ld	e, a
;main.c:521: player.x = 20; 
	ld	a,#0x14
	cp	a,e
	jr	C, 00106$
	ld	(bc), a
00106$:
;main.c:524: if(joypad() & J_RIGHT){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00112$
;main.c:525: if(if_can_move(player.x +3, player.y)){
	ld	hl, #(_player + 0x0019)
	ld	b, (hl)
	ld	a, (#(_player + 0x0018) + 0)
	add	a, #0x03
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_if_can_move
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00108$
;main.c:526: player.x += 3;
	ld	a, (#(_player + 0x0018) + 0)
	add	a, #0x03
	ld	(#(_player + 0x0018)),a
;main.c:527: movegamecharacter(&player, player.x, player.y);
	ld	hl, #(_player + 0x0019)
	ld	b, (hl)
	ld	hl, #(_player + 0x0018)
	ld	c, (hl)
	push	bc
	ld	hl, #_player
	push	hl
	call	_movegamecharacter
	add	sp, #4
00108$:
;main.c:529: if(player.x >= 140){
	ld	a, (#(_player + 0x0018) + 0)
	sub	a, #0x8c
	jr	C, 00112$
;main.c:530: player.x = 140;
	ld	hl, #(_player + 0x0018)
	ld	(hl), #0x8c
00112$:
;main.c:533: if(joypad()& J_UP){
	call	_joypad
	bit	2, e
	jr	Z, 00118$
;main.c:534: if(if_can_move(player.x, player.y -3)){
	ld	a, (#(_player + 0x0019) + 0)
	add	a, #0xfd
	ld	b, a
	ld	a, (#(_player + 0x0018) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_if_can_move
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00114$
;main.c:535: player.y -= 3;
	ld	a, (#(_player + 0x0019) + 0)
	add	a, #0xfd
	ld	(#(_player + 0x0019)),a
;main.c:536: movegamecharacter(&player, player.x, player.y);
	ld	hl, #(_player + 0x0019)
	ld	b, (hl)
	ld	hl, #(_player + 0x0018)
	ld	c, (hl)
	push	bc
	ld	hl, #_player
	push	hl
	call	_movegamecharacter
	add	sp, #4
00114$:
;main.c:538: if(player.y <= 30){
	ld	hl, #(_player + 0x0019)
	ld	c, (hl)
	ld	a, #0x1e
	sub	a, c
	jr	C, 00118$
;main.c:539: player.y = 30;
	ld	hl, #(_player + 0x0019)
	ld	(hl), #0x1e
00118$:
;main.c:542: if(joypad()& J_DOWN){
	call	_joypad
	bit	3, e
	jr	Z, 00124$
;main.c:543: if(if_can_move(player.x, player.y +3)){
	ld	a, (#(_player + 0x0019) + 0)
	add	a, #0x03
	ld	b, a
	ld	a, (#(_player + 0x0018) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_if_can_move
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00120$
;main.c:544: player.y += 3;
	ld	a, (#(_player + 0x0019) + 0)
	add	a, #0x03
	ld	(#(_player + 0x0019)),a
;main.c:545: movegamecharacter(&player, player.x, player.y);
	ld	hl, #(_player + 0x0019)
	ld	b, (hl)
	ld	hl, #(_player + 0x0018)
	ld	c, (hl)
	push	bc
	ld	hl, #_player
	push	hl
	call	_movegamecharacter
	add	sp, #4
00120$:
;main.c:547: if(player.y >= 130){
	ld	a, (#(_player + 0x0019) + 0)
	sub	a, #0x82
	jr	C, 00124$
;main.c:548: player.y = 130;
	ld	hl, #(_player + 0x0019)
	ld	(hl), #0x82
00124$:
;main.c:551: if(joypad() & J_A && !fire){
	call	_joypad
	bit	4, e
	jr	Z, 00128$
	ld	hl, #_fire
	bit	0, (hl)
	jr	NZ, 00128$
;main.c:552: if(laser_active < max_laser){
	ld	de, #_laser_active
	ld	hl, #_max_laser
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00240$
	bit	7, d
	jr	NZ, 00241$
	cp	a, a
	jr	00241$
00240$:
	bit	7, d
	jr	Z, 00241$
	scf
00241$:
	jr	NC, 00128$
;main.c:553: laser_active += 1;
	ld	hl, #_laser_active
	inc	(hl)
	jr	NZ, 00242$
	inc	hl
	inc	(hl)
00242$:
;main.c:554: laser.x = player.x;
	ld	bc, #_laser + 24
	ld	a, (#(_player + 0x0018) + 0)
	ld	(bc), a
;main.c:555: laser.y = player.y - 5;
	ld	bc, #_laser + 25
	ld	a, (#(_player + 0x0019) + 0)
	add	a, #0xfb
	ld	(bc), a
;main.c:556: fire = TRUE;
	ld	hl, #_fire
	ld	(hl), #0x01
;main.c:557: laser_fire();
	call	_laser_fire
00128$:
;main.c:560: if(joypad() & J_START){
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00131$
;main.c:561: pause();
	call	_pause
00131$:
;main.c:563: if(!(joypad()& J_UP)){
	call	_joypad
	bit	2, e
	ret	NZ
;main.c:564: if(if_can_move(player.x, player.y +1)){
	ld	a, (#(_player + 0x0019) + 0)
	ld	b, a
	inc	b
	ld	a, (#(_player + 0x0018) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_if_can_move
	add	sp, #2
	ld	a, e
	or	a, a
	jr	Z, 00133$
;main.c:565: player.y += 1;
	ld	a, (#(_player + 0x0019) + 0)
	inc	a
	ld	(#(_player + 0x0019)),a
;main.c:566: movegamecharacter(&player, player.x, player.y);
	ld	hl, #(_player + 0x0019)
	ld	c, (hl)
	ld	hl, #(_player + 0x0018)
	ld	l, (hl)
	ld	a, c
	push	af
	ld	a, l
	inc	sp
	push	af
	inc	sp
	ld	hl, #_player
	push	hl
	call	_movegamecharacter
	add	sp, #4
00133$:
;main.c:568: if(player.y >= 130){
	ld	a, (#(_player + 0x0019) + 0)
	sub	a, #0x82
	ret	C
;main.c:569: player.y = 130;
	ld	hl, #(_player + 0x0019)
	ld	(hl), #0x82
;main.c:572: }
	ret
;main.c:574: void movecharacters1(){
;	---------------------------------
; Function movecharacters1
; ---------------------------------
_movecharacters1::
;main.c:575: movegamecharacter(&alien1, alien1.x, alien1.y);
	ld	hl, #_alien1 + 25
	ld	b, (hl)
	ld	hl, #_alien1 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alien1
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:576: movegamecharacter(&alien2, alien2.x, alien2.y);
	ld	hl, #_alien2 + 25
	ld	b, (hl)
	ld	hl, #_alien2 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alien2
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:577: movegamecharacter(&alienship1, alienship1.x, alienship1.y);
	ld	hl, #_alienship1 + 25
	ld	b, (hl)
	ld	hl, #_alienship1 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alienship1
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:578: movegamecharacter(&alienship2, alienship2.x, alienship2.y);
	ld	hl, #_alienship2 + 25
	ld	b, (hl)
	ld	hl, #_alienship2 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alienship2
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:579: movegamecharacter(&laser,laser.x, laser.y);
	ld	hl, #_laser + 25
	ld	b, (hl)
	ld	hl, #_laser + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_laser
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:580: movegamecharacter(&alien_laser, alien_laser.x, alien_laser.y);
	ld	hl, #_alien_laser + 25
	ld	b, (hl)
	ld	hl, #_alien_laser + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alien_laser
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:581: }
	ret
;main.c:583: void movecharacters2(){
;	---------------------------------
; Function movecharacters2
; ---------------------------------
_movecharacters2::
;main.c:584: movegamecharacter(&alien1, alien1.x, alien1.y);
	ld	hl, #_alien1 + 25
	ld	b, (hl)
	ld	hl, #_alien1 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alien1
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:585: movegamecharacter(&alien2, alien2.x, alien2.y);
	ld	hl, #_alien2 + 25
	ld	b, (hl)
	ld	hl, #_alien2 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alien2
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:586: movegamecharacter(&alienship1, alienship1.x, alienship1.y);
	ld	hl, #_alienship1 + 25
	ld	b, (hl)
	ld	hl, #_alienship1 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alienship1
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:587: movegamecharacter(&alienship2, alienship2.x, alienship2.y);
	ld	hl, #_alienship2 + 25
	ld	b, (hl)
	ld	hl, #_alienship2 + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alienship2
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:588: movegamecharacter(&laser,laser.x, laser.y);
	ld	hl, #_laser + 25
	ld	b, (hl)
	ld	hl, #_laser + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_laser
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:589: movegamecharacter(&alien_laser, alien_laser.x, alien_laser.y);
	ld	hl, #_alien_laser + 25
	ld	b, (hl)
	ld	hl, #_alien_laser + 24
	ld	c, (hl)
	push	bc
	ld	hl, #_alien_laser
	push	hl
	call	_movegamecharacter
	add	sp, #4
;main.c:590: }
	ret
;main.c:605: void score(){
;	---------------------------------
; Function score
; ---------------------------------
_score::
;main.c:606: scr += 10;
	ld	hl, #_scr
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;main.c:607: }
	ret
;main.c:609: UBYTE checkcollision(struct GameCharacter* one, struct GameCharacter* two){
;	---------------------------------
; Function checkcollision
; ---------------------------------
_checkcollision::
	add	sp, #-16
;main.c:610: return(one->x >= two->x && one->x <= two->x + two->width) && (one->y >= two->y && one->y <= two->y + two->height) || (two->x >= one->x && two->x <= one->x + one->width) && (two->y >= one->y && two->y <= one-> y+ one->height);
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
;c
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0018
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), e
;c
	pop	de
	push	de
	ld	hl, #0x0018
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0019
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
;c
	pop	de
	push	de
	ld	hl, #0x0019
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, (hl)
	jr	C, 00108$
;c
	pop	de
	push	de
	ld	hl, #0x001a
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00152$
	bit	7, d
	jr	NZ, 00153$
	cp	a, a
	jr	00153$
00152$:
	bit	7, d
	jr	Z, 00153$
	scf
00153$:
	jr	C, 00108$
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, c
	jr	C, 00108$
	ld	b, #0x00
;c
	pop	de
	push	de
	ld	hl, #0x001b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#15
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00154$
	bit	7, d
	jr	NZ, 00155$
	cp	a, a
	jr	00155$
00154$:
	bit	7, d
	jr	Z, 00155$
	scf
00155$:
	jp	NC, 00104$
00108$:
	ldhl	sp,	#5
	ld	a, (hl-)
	sub	a, (hl)
	jp	C, 00103$
;c
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001a
	add	hl, de
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00156$
	bit	7, d
	jr	NZ, 00157$
	cp	a, a
	jr	00157$
00156$:
	bit	7, d
	jr	Z, 00157$
	scf
00157$:
	jr	C, 00103$
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl), a
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, c
	jr	C, 00103$
	ldhl	sp,	#11
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl), a
;c
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001b
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
;c
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#9
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00158$
	bit	7, d
	jr	NZ, 00159$
	cp	a, a
	jr	00159$
00158$:
	bit	7, d
	jr	Z, 00159$
	scf
00159$:
	jr	NC, 00104$
00103$:
	xor	a, a
	ldhl	sp,	#15
	ld	(hl), a
	jr	00105$
00104$:
	ldhl	sp,	#15
	ld	(hl), #0x01
00105$:
	ldhl	sp,	#15
	ld	e, (hl)
;main.c:611: }
	add	sp, #16
	ret
;main.c:613: void collisioncheck(){
;	---------------------------------
; Function collisioncheck
; ---------------------------------
_collisioncheck::
;main.c:614: if(checkcollision(&player,&alien1)){
	ld	hl, #_alien1
	push	hl
	ld	hl, #_player
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00110$
;main.c:615: alien1.x = 0;
	ld	hl, #(_alien1 + 0x0018)
	ld	(hl), #0x00
;main.c:616: alien1.y = 0;
	ld	hl, #(_alien1 + 0x0019)
	ld	(hl), #0x00
;main.c:617: lives -= 1;
	ld	hl, #_lives + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:618: died();
	jp  _died
00110$:
;main.c:620: else if(checkcollision(&player, &alien2)){
	ld	hl, #_alien2
	push	hl
	ld	hl, #_player
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00107$
;main.c:621: alien2.x = 0;
	ld	bc, #_alien2 + 24
	xor	a, a
	ld	(bc), a
;main.c:622: alien2.y = 0;
	ld	hl, #(_alien2 + 0x0019)
	ld	(hl), #0x00
;main.c:623: lives -= 1;
	ld	hl, #_lives + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:624: died();
	jp  _died
00107$:
;main.c:626: else if(checkcollision(&player, &alienship1)){
	ld	hl, #_alienship1
	push	hl
	ld	hl, #_player
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00104$
;main.c:627: alienship1.x = 0;
	ld	hl, #(_alienship1 + 0x0018)
	ld	(hl), #0x00
;main.c:628: alienship1.y = 0;
	ld	hl, #(_alienship1 + 0x0019)
	ld	(hl), #0x00
;main.c:629: lives -= 1;
	ld	hl, #_lives + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:630: died();
	jp  _died
00104$:
;main.c:633: else if(checkcollision(&player, &alienship2)){
	ld	hl, #_alienship2
	push	hl
	ld	hl, #_player
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	ret	Z
;main.c:634: alienship2.x = 0;
	ld	hl, #(_alienship2 + 0x0018)
	ld	(hl), #0x00
;main.c:635: alienship2.y = 0;
	ld	hl, #(_alienship2 + 0x0019)
	ld	(hl), #0x00
;main.c:636: lives -= 1;
	ld	hl, #_lives + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	dec	hl
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:637: died();
;main.c:639: }
	jp  _died
;main.c:641: void laserblast(){
;	---------------------------------
; Function laserblast
; ---------------------------------
_laserblast::
;main.c:642: if(checkcollision(&laser, &alien1)){
	ld	hl, #_alien1
	push	hl
	ld	hl, #_laser
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00102$
;main.c:643: explosion();
	call	_explosion
;main.c:644: score();
	call	_score
;main.c:645: alien1.x = 0;
	ld	hl, #(_alien1 + 0x0018)
	ld	(hl), #0x00
;main.c:646: alien1.y = 0;
	ld	hl, #(_alien1 + 0x0019)
	ld	(hl), #0x00
00102$:
;main.c:648: if(checkcollision(&laser, &alien2)){
	ld	hl, #_alien2
	push	hl
	ld	hl, #_laser
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00104$
;main.c:649: explosion();
	call	_explosion
;main.c:650: score();
	call	_score
;main.c:651: alien2.x = 0;
	ld	hl, #(_alien2 + 0x0018)
	ld	(hl), #0x00
;main.c:652: alien2.y = 0;
	ld	hl, #(_alien2 + 0x0019)
	ld	(hl), #0x00
00104$:
;main.c:654: if(checkcollision(&laser, &alienship1)){
	ld	hl, #_alienship1
	push	hl
	ld	hl, #_laser
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	jr	Z, 00106$
;main.c:655: explosion();
	call	_explosion
;main.c:656: score();
	call	_score
;main.c:657: score();
	call	_score
;main.c:658: alienship1.x = 0;
	ld	hl, #(_alienship1 + 0x0018)
	ld	(hl), #0x00
;main.c:659: alienship1.y = 0;
	ld	hl, #(_alienship1 + 0x0019)
	ld	(hl), #0x00
00106$:
;main.c:661: if(checkcollision(&laser, &alienship2)){
	ld	hl, #_alienship2
	push	hl
	ld	hl, #_laser
	push	hl
	call	_checkcollision
	add	sp, #4
	ld	a, e
	or	a, a
	ret	Z
;main.c:662: explosion();
	call	_explosion
;main.c:663: score();
	call	_score
;main.c:664: score();
	call	_score
;main.c:665: alienship2.x = 0;
	ld	hl, #(_alienship2 + 0x0018)
	ld	(hl), #0x00
;main.c:666: alienship2.y = 0;
	ld	hl, #(_alienship2 + 0x0019)
	ld	(hl), #0x00
;main.c:668: }
	ret
;main.c:670: void interuptLCD(){
;	---------------------------------
; Function interuptLCD
; ---------------------------------
_interuptLCD::
;main.c:671: HIDE_WIN;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xdf
	ldh	(_LCDC_REG+0),a
;main.c:672: }
	ret
;main.c:679: void endscreen(){
;	---------------------------------
; Function endscreen
; ---------------------------------
_endscreen::
;main.c:681: set_bkg_tiles(0,0,20,18,blankmap);
	ld	hl, #_blankmap
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;/Users/dustinbrooks/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCX_REG+0),a
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:690: printf("\n \n \n \n \n === GAME OVER === \n \n \n \n \n === %d",scr);
	ld	hl, #_scr
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #___str_1
	push	hl
	call	_printf
	add	sp, #4
;main.c:692: fade_in();
	call	_fade_in
;main.c:694: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:695: }
	ret
___str_1:
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " === GAME OVER === "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " === %d"
	.db 0x00
;main.c:697: void isgameover(){
;	---------------------------------
; Function isgameover
; ---------------------------------
_isgameover::
;main.c:698: if(lives == 0){
	ld	hl, #_lives + 1
	ld	a, (hl-)
	or	a, (hl)
	ret	NZ
;/Users/dustinbrooks/gbdk/include/gb/gb.h:775: SCX_REG+=x, SCY_REG+=y;
;main.c:700: storealiens();
	call	_storealiens
;main.c:701: gameover = 1;
	ld	hl, #_gameover
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:702: level = 0;
	ld	hl, #_level
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:703: fade_out();
	call	_fade_out
;main.c:704: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
;main.c:711: }
	ret
;main.c:730: void setupENV(){
;	---------------------------------
; Function setupENV
; ---------------------------------
_setupENV::
;main.c:731: ENABLE_RAM_MBC1;
	ld	hl, #0x0000
	ld	(hl), #0x0a
;main.c:733: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;main.c:734: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;main.c:735: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG+0),a
;main.c:738: font_init();
	call	_font_init
;main.c:739: min_font = font_load(font_min);
	ld	hl, #_font_min
	push	hl
	call	_font_load
	add	sp, #2
;main.c:740: font_set(min_font);
	push	de
	call	_font_set
	add	sp, #2
;main.c:742: add_LCD(interuptLCD);
	ld	hl, #_interuptLCD
	push	hl
	call	_add_LCD
	add	sp, #2
;main.c:743: enable_interrupts();
	call	_enable_interrupts
;main.c:744: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;main.c:746: fade_in();
;main.c:747: }
	jp  _fade_in
;main.c:749: void Level1ENV(){
;	---------------------------------
; Function Level1ENV
; ---------------------------------
_Level1ENV::
;main.c:751: printf("\n \n \n \n \n \n \n \n \n       LEVEL %d", level );
	ld	hl, #_level
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #___str_2
	push	hl
	call	_printf
	add	sp, #4
;main.c:752: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
;main.c:754: set_bkg_data(37,16,backgroundtiles);
	ld	hl, #_backgroundtiles
	push	hl
	ld	de, #0x1025
	push	de
	call	_set_bkg_data
	add	sp, #4
;main.c:755: set_bkg_tiles(0,0,20,36,background);
	ld	hl, #_background
	push	hl
	ld	de, #0x2414
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:756: set_win_tiles(0,0,5,1,windowmap);
	ld	hl, #_windowmap
	push	hl
	ld	de, #0x0105
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;/Users/dustinbrooks/gbdk/include/gb/gb.h:893: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x87
	ldh	(_WY_REG+0),a
;main.c:759: set_sprite_data(0,24, GameSprites);
	ld	hl, #_GameSprites
	push	hl
	ld	a, #0x18
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:760: setupplayer();
	call	_setupplayer
;main.c:761: setupalien1();
	call	_setupalien1
;main.c:762: setupalien2();
	call	_setupalien2
;main.c:763: setupalienship1();
	call	_setupalienship1
;main.c:764: setupalienship2();
	call	_setupalienship2
;main.c:765: setuplaser();
	call	_setuplaser
;main.c:766: setup_alien_laser();
	call	_setup_alien_laser
;main.c:769: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:770: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:771: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:772: }
	ret
___str_2:
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii " "
	.db 0x0a
	.ascii "       LEVEL %d"
	.db 0x00
;main.c:774: void level_timer(){
;	---------------------------------
; Function level_timer
; ---------------------------------
_level_timer::
;main.c:775: timer += 1;
	ld	hl, #_timer
	inc	(hl)
	jr	NZ, 00110$
	inc	hl
	inc	(hl)
00110$:
;main.c:776: if(timer > 1000){
	ld	hl, #_timer
	ld	a, #0xe8
	sub	a, (hl)
	inc	hl
	ld	a, #0x03
	sbc	a, (hl)
	ld	a, #0x03
	ld	d, a
	bit	7, (hl)
	jr	Z, 00111$
	bit	7, d
	jr	NZ, 00112$
	cp	a, a
	jr	00112$
00111$:
	bit	7, d
	jr	Z, 00112$
	scf
00112$:
	ret	NC
;main.c:777: level += 1;
	ld	hl, #_level
	inc	(hl)
	jr	NZ, 00113$
	inc	hl
	inc	(hl)
00113$:
;main.c:778: fade_out();
	call	_fade_out
;main.c:779: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
;main.c:781: HIDE_BKG;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfe
	ldh	(_LCDC_REG+0),a
;main.c:782: HIDE_SPRITES;
	ldh	a, (_LCDC_REG+0)
	and	a, #0xfd
	ldh	(_LCDC_REG+0),a
;main.c:783: DISPLAY_OFF;
	call	_display_off
;main.c:784: endscreen();
;main.c:786: }
	jp  _endscreen
;main.c:788: void Level1(){
;	---------------------------------
; Function Level1
; ---------------------------------
_Level1::
;main.c:790: collisioncheck();
	call	_collisioncheck
;/Users/dustinbrooks/gbdk/include/gb/gb.h:775: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG+0)
	add	a, #0xfd
	ldh	(_SCY_REG+0),a
;main.c:794: ohjoy();
	call	_ohjoy
;main.c:796: laserblast();
	call	_laserblast
;main.c:798: movealiens1();
	call	_movealiens1
;main.c:800: movecharacters1();
	call	_movecharacters1
;main.c:802: move_lasers();
	call	_move_lasers
;main.c:806: isgameover();
	call	_isgameover
;main.c:808: performancedelay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performancedelay
	inc	sp
;main.c:809: }
	ret
;main.c:811: void Level2(){
;	---------------------------------
; Function Level2
; ---------------------------------
_Level2::
;main.c:813: collisioncheck();
	call	_collisioncheck
;/Users/dustinbrooks/gbdk/include/gb/gb.h:775: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG+0)
	add	a, #0xfd
	ldh	(_SCY_REG+0),a
;main.c:817: ohjoy();
	call	_ohjoy
;main.c:819: laserblast();
	call	_laserblast
;main.c:821: movealiens2();
	call	_movealiens2
;main.c:823: movecharacters2();
	call	_movecharacters2
;main.c:825: move_lasers();
	call	_move_lasers
;main.c:829: isgameover();
	call	_isgameover
;main.c:831: performancedelay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performancedelay
	inc	sp
;main.c:832: }
	ret
;main.c:837: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:839: while(1){
00111$:
;main.c:841: splashscreen();
	call	_splashscreen
;main.c:843: setupENV();
	call	_setupENV
;main.c:845: while(!gameover){
00107$:
	ld	hl, #_gameover + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00109$
;main.c:847: Level1ENV();
	call	_Level1ENV
;main.c:849: do{
00101$:
;main.c:850: Level1();
	call	_Level1
;main.c:852: }while(level == 1);
	ld	hl, #_level
	ld	a, (hl)
	dec	a
	inc	hl
	or	a, (hl)
	jr	Z, 00101$
;main.c:854: Level1ENV();
	call	_Level1ENV
;main.c:856: do{
00104$:
;main.c:857: Level2();
	call	_Level2
;main.c:859: }while(level == 2);
	ld	hl, #_level
	ld	a, (hl)
	sub	a, #0x02
	inc	hl
	or	a, (hl)
	jr	Z, 00104$
	jr	00107$
00109$:
;main.c:862: endscreen();
	call	_endscreen
;main.c:865: }
	jr	00111$
	.area _CODE
	.area _CABS (ABS)
