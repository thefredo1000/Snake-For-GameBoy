;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12016 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setupApple
	.globl _setupSnake
	.globl _moveSnakeDown
	.globl _moveSnakeUp
	.globl _moveSnakeRight
	.globl _moveSnakeLeft
	.globl _performDelay
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _gameRunning
	.globl _lastDir
	.globl _apple
	.globl _snake
	.globl _GameSprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_GameSprites::
	.ds 64
_snake::
	.ds 25
_apple::
	.ds 4
_lastDir::
	.ds 1
_gameRunning::
	.ds 1
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
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0011)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0012)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0014)
	ld	(hl), #0xbd
	ld	hl, #(_GameSprites + 0x0015)
	ld	(hl), #0xc3
	ld	hl, #(_GameSprites + 0x0016)
	ld	(hl), #0xbd
	ld	hl, #(_GameSprites + 0x0017)
	ld	(hl), #0xc3
	ld	hl, #(_GameSprites + 0x0018)
	ld	(hl), #0xbd
	ld	hl, #(_GameSprites + 0x0019)
	ld	(hl), #0xc3
	ld	hl, #(_GameSprites + 0x001a)
	ld	(hl), #0xbd
	ld	hl, #(_GameSprites + 0x001b)
	ld	(hl), #0xc3
	ld	hl, #(_GameSprites + 0x001c)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x001d)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x001e)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x001f)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0022)
	ld	(hl), #0x3c
	ld	hl, #(_GameSprites + 0x0023)
	ld	(hl), #0x3c
	ld	hl, #(_GameSprites + 0x0024)
	ld	(hl), #0x42
	ld	hl, #(_GameSprites + 0x0025)
	ld	(hl), #0x7e
	ld	hl, #(_GameSprites + 0x0026)
	ld	(hl), #0xbd
	ld	hl, #(_GameSprites + 0x0027)
	ld	(hl), #0xc3
	ld	hl, #(_GameSprites + 0x0028)
	ld	(hl), #0xbd
	ld	hl, #(_GameSprites + 0x0029)
	ld	(hl), #0xc3
	ld	hl, #(_GameSprites + 0x002a)
	ld	(hl), #0x81
	ld	hl, #(_GameSprites + 0x002b)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x002c)
	ld	(hl), #0x99
	ld	hl, #(_GameSprites + 0x002d)
	ld	(hl), #0xff
	ld	hl, #(_GameSprites + 0x002e)
	ld	(hl), #0x66
	ld	hl, #(_GameSprites + 0x002f)
	ld	(hl), #0x66
	ld	hl, #(_GameSprites + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_GameSprites + 0x003f)
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
;main.c:15: void performDelay(UINT8 numloops){
;	---------------------------------
; Function performDelay
; ---------------------------------
_performDelay::
;main.c:17: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:18: wait_vbl_done();
	call	_wait_vbl_done
;main.c:17: for(i = 0; i < numloops; i++){
	inc	c
;main.c:20: }
	jr	00103$
;main.c:23: void moveSnakeLeft() {
;	---------------------------------
; Function moveSnakeLeft
; ---------------------------------
_moveSnakeLeft::
;main.c:24: snake.x -= 8;
	ld	de, #_snake + 21
	ld	a, (de)
	add	a, #0xf8
	ld	(de), a
;main.c:25: move_sprite(1, snake.x, snake.y);
	ld	hl, #_snake + 22
	ld	b, (hl)
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:25: move_sprite(1, snake.x, snake.y);
;main.c:26: }
	ret
;main.c:27: void moveSnakeRight() {
;	---------------------------------
; Function moveSnakeRight
; ---------------------------------
_moveSnakeRight::
;main.c:28: snake.x += 8;
	ld	de, #_snake + 21
	ld	a, (de)
	add	a, #0x08
	ld	(de), a
;main.c:29: move_sprite(1, snake.x, snake.y);   
	ld	hl, #_snake + 22
	ld	b, (hl)
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:29: move_sprite(1, snake.x, snake.y);   
;main.c:30: }
	ret
;main.c:31: void moveSnakeUp() {
;	---------------------------------
; Function moveSnakeUp
; ---------------------------------
_moveSnakeUp::
;main.c:32: snake.y -= 8;
	ld	hl, #_snake + 22
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:33: move_sprite(1, snake.x, snake.y);
	ld	b, (hl)
	ld	hl, #_snake + 21
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:33: move_sprite(1, snake.x, snake.y);
;main.c:34: }
	ret
;main.c:35: void moveSnakeDown() {
;	---------------------------------
; Function moveSnakeDown
; ---------------------------------
_moveSnakeDown::
;main.c:36: snake.y += 8;
	ld	hl, #_snake + 22
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:37: move_sprite(1, snake.x, snake.y);
	ld	b, (hl)
	ld	hl, #_snake + 21
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:37: move_sprite(1, snake.x, snake.y);
;main.c:38: }
	ret
;main.c:40: void setupSnake() {
;	---------------------------------
; Function setupSnake
; ---------------------------------
_setupSnake::
;main.c:41: snake.x = 8;
	ld	hl, #(_snake + 0x0015)
	ld	(hl), #0x08
;main.c:42: snake.y = 16;
	ld	bc, #_snake + 22
	ld	a, #0x10
	ld	(bc), a
;main.c:43: snake.height = 8;
	ld	hl, #(_snake + 0x0018)
	ld	(hl), #0x08
;main.c:44: snake.width = 8;
	ld	hl, #(_snake + 0x0017)
	ld	(hl), #0x08
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x01
;main.c:48: move_sprite(1, snake.x, snake.y);
	ld	a, (bc)
	ld	b, a
	ld	hl, #(_snake + 0x0015)
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:48: move_sprite(1, snake.x, snake.y);
;main.c:49: }
	ret
;main.c:51: void setupApple() {
;	---------------------------------
; Function setupApple
; ---------------------------------
_setupApple::
;main.c:53: apple.x = 80;
	ld	hl, #_apple
	ld	(hl), #0x50
;main.c:54: apple.y = 80;
	ld	bc, #_apple + 1
	ld	a, #0x50
	ld	(bc), a
;main.c:55: apple.height = 8;
	ld	hl, #(_apple + 0x0003)
	ld	(hl), #0x08
;main.c:56: apple.width = 8;
	ld	hl, #(_apple + 0x0002)
	ld	(hl), #0x08
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x02
;main.c:60: move_sprite(2, apple.x, apple.y);
	ld	a, (bc)
	ld	b, a
	ld	hl, #_apple
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0008)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:60: move_sprite(2, apple.x, apple.y);
;main.c:61: }
	ret
;main.c:63: void main() {  
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-8
;main.c:64: initrand(DIV_REG);
	ldh	a, (_DIV_REG+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	add	sp, #2
;main.c:66: lastDir = 1;
	ld	hl, #_lastDir
	ld	(hl), #0x01
;main.c:68: set_sprite_data(0, 3, GameSprites);
	ld	hl, #_GameSprites
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;main.c:71: setupSnake();
	call	_setupSnake
;main.c:72: setupApple();
	call	_setupApple
;main.c:75: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:76: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:78: gameRunning = 1;
	ld	hl, #_gameRunning
	ld	(hl), #0x01
;main.c:80: while(gameRunning) {
00133$:
	ld	a, (#_gameRunning)
	or	a, a
	jp	Z, 00138$
;main.c:82: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00118$
;main.c:83: moveSnakeLeft();
	call	_moveSnakeLeft
;main.c:84: lastDir = 0;
	ld	hl, #_lastDir
	ld	(hl), #0x00
	jr	00119$
00118$:
;main.c:85: } else if (joypad() & J_RIGHT) {
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00115$
;main.c:86: moveSnakeRight();
	call	_moveSnakeRight
;main.c:87: lastDir = 1;
	ld	hl, #_lastDir
	ld	(hl), #0x01
	jr	00119$
00115$:
;main.c:88: } else if (joypad() & J_UP) {
	call	_joypad
	bit	2, e
	jr	Z, 00112$
;main.c:89: moveSnakeUp();
	call	_moveSnakeUp
;main.c:90: lastDir = 2;
	ld	hl, #_lastDir
	ld	(hl), #0x02
	jr	00119$
00112$:
;main.c:91: } else if (joypad() & J_DOWN) {
	call	_joypad
	bit	3, e
	jr	Z, 00109$
;main.c:92: moveSnakeDown();
	call	_moveSnakeDown
;main.c:93: lastDir = 3;
	ld	hl, #_lastDir
	ld	(hl), #0x03
	jr	00119$
00109$:
;main.c:94: } else if(!joypad()) {
	call	_joypad
	ld	a, e
	or	a, a
	jr	NZ, 00119$
;main.c:95: switch (lastDir)
	ld	a, (#_lastDir)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_lastDir)
	dec	a
	jr	Z, 00102$
	ld	a, (#_lastDir)
	sub	a, #0x02
	jr	Z, 00103$
	ld	a, (#_lastDir)
	sub	a, #0x03
	jr	Z, 00104$
	jr	00119$
;main.c:97: case LEFT:
00101$:
;main.c:98: moveSnakeLeft();
	call	_moveSnakeLeft
;main.c:99: break;
	jr	00119$
;main.c:100: case RIGHT:
00102$:
;main.c:101: moveSnakeRight();
	call	_moveSnakeRight
;main.c:102: break;
	jr	00119$
;main.c:103: case UP:
00103$:
;main.c:104: moveSnakeUp();
	call	_moveSnakeUp
;main.c:105: break;
	jr	00119$
;main.c:106: case DOWN:
00104$:
;main.c:107: moveSnakeDown();
	call	_moveSnakeDown
;main.c:110: }
00119$:
;main.c:113: if((snake.x >= apple.x && snake.x <= apple.x + apple.width) && (snake.y >= apple.y && snake.y <= apple.y + apple.height) || (apple.x >= snake.x && apple.x <= snake.x + snake.width) && (apple.y >= snake.y && apple.y <= snake.y + snake.height)){
	ld	a, (#(_snake + 0x0015) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_apple + 0)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#3
	sub	a, (hl)
	jr	C, 00132$
	ld	a, (#(_apple + 0x0002) + 0)
	ld	d, #0x00
;c
	ld	e, a
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
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
	jr	Z, 00238$
	bit	7, d
	jr	NZ, 00239$
	cp	a, a
	jr	00239$
00238$:
	bit	7, d
	jr	Z, 00239$
	scf
00239$:
	jr	C, 00132$
	ld	hl, #(_snake + 0x0016)
	ld	c, (hl)
	ld	hl, #(_apple + 0x0001)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00132$
	ld	e, b
	ld	d, #0x00
	ld	a, (#_apple + 3)
	ld	h, #0x00
	ld	l, a
	add	hl, de
	ld	b, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
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
	jp	NC, 00123$
00132$:
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	jp	C, 00124$
	ld	a, (#(_snake + 0x0017) + 0)
	ld	d, #0x00
;c
	ld	e, a
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00242$
	bit	7, d
	jr	NZ, 00243$
	cp	a, a
	jr	00243$
00242$:
	bit	7, d
	jr	Z, 00243$
	scf
00243$:
	jp	C, 00124$
	ld	a, (#(_apple + 0x0001) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #(_snake + 0x0016)
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	jp	C, 00124$
	inc	hl
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl), a
	ld	a, (#(_snake + 0x0018) + 0)
	inc	hl
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
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00244$
	bit	7, d
	jr	NZ, 00245$
	cp	a, a
	jr	00245$
00244$:
	bit	7, d
	jr	Z, 00245$
	scf
00245$:
	jr	C, 00124$
00123$:
;main.c:115: UINT8 xRand = rand();
	call	_rand
	ld	b, e
;main.c:117: UINT8 yRand = rand();
	push	bc
	call	_rand
	pop	bc
	ldhl	sp,	#6
	ld	(hl), e
;main.c:119: apple.x = ((xRand % xMax) + 1) * 8;
	ld	a, #0x14
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	add	sp, #2
	ldhl	sp,	#7
	ld	(hl), e
	inc	(hl)
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	(#_apple),a
;main.c:120: apple.y = ((yRand % yMax) + 2) * 8;
	ld	a, #0x12
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	__moduchar
	add	sp, #2
	ldhl	sp,	#7
	ld	(hl), e
	inc	(hl)
	inc	(hl)
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
	ld	de, #(_apple + 0x0001)
	ld	a, (hl)
	ld	(de), a
;main.c:121: move_sprite(2, apple.x, apple.y);
	ld	a, (hl-)
	ld	(hl), a
	ld	a, (#_apple + 0)
	ldhl	sp,	#7
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	de, #(_shadow_OAM + 0x0008)
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
	ld	de, #(_shadow_OAM + 0x0009)
	inc	hl
	ld	a, (hl)
	ld	(de), a
;main.c:121: move_sprite(2, apple.x, apple.y);
	jr	00125$
00124$:
;main.c:122: } else if (snake.x > 160 || snake.y > 144) {
	ld	a, #0xa0
	ldhl	sp,	#0
	sub	a, (hl)
	jr	C, 00120$
	ld	hl, #(_snake + 0x0016)
	ld	c, (hl)
	ld	a, #0x90
	sub	a, c
	jr	NC, 00125$
00120$:
;main.c:123: gameRunning = 0;
	ld	hl, #_gameRunning
	ld	(hl), #0x00
00125$:
;main.c:126: performDelay(8); 
	ld	a, #0x08
	push	af
	inc	sp
	call	_performDelay
	inc	sp
	jp	00133$
00138$:
;main.c:129: }
	add	sp, #8
	ret
	.area _CODE
	.area _CABS (ABS)
