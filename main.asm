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
	.globl _moveSnakeDown
	.globl _moveSnakeUp
	.globl _moveSnakeRight
	.globl _moveSnakeLeft
	.globl _createSnake
	.globl _performDelay
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _lastDir
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
_lastDir::
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
;main.c:10: void performDelay(UINT8 numloops){
;	---------------------------------
; Function performDelay
; ---------------------------------
_performDelay::
;main.c:12: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:13: wait_vbl_done();
	call	_wait_vbl_done
;main.c:12: for(i = 0; i < numloops; i++){
	inc	c
;main.c:15: }
	jr	00103$
;main.c:17: void createSnake() {
;	---------------------------------
; Function createSnake
; ---------------------------------
_createSnake::
;main.c:18: snake.x = 8;
	ld	hl, #(_snake + 0x0015)
	ld	(hl), #0x08
;main.c:19: snake.y = 16;
	ld	bc, #_snake + 22
	ld	a, #0x10
	ld	(bc), a
;main.c:20: snake.height = 8;
	ld	hl, #(_snake + 0x0018)
	ld	(hl), #0x08
;main.c:21: snake.width = 8;
	ld	hl, #(_snake + 0x0017)
	ld	(hl), #0x08
;c:/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x01
;main.c:25: move_sprite(1, snake.x, snake.y);
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
;main.c:25: move_sprite(1, snake.x, snake.y);
;main.c:26: }
	ret
;main.c:28: void moveSnakeLeft() {
;	---------------------------------
; Function moveSnakeLeft
; ---------------------------------
_moveSnakeLeft::
;main.c:29: snake.x -= 8;
	ld	de, #_snake + 21
	ld	a, (de)
	add	a, #0xf8
	ld	(de), a
;main.c:30: move_sprite(1, snake.x, snake.y);
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
;main.c:30: move_sprite(1, snake.x, snake.y);
;main.c:31: }
	ret
;main.c:32: void moveSnakeRight() {
;	---------------------------------
; Function moveSnakeRight
; ---------------------------------
_moveSnakeRight::
;main.c:33: snake.x += 8;
	ld	de, #_snake + 21
	ld	a, (de)
	add	a, #0x08
	ld	(de), a
;main.c:34: move_sprite(1, snake.x, snake.y);   
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
;main.c:34: move_sprite(1, snake.x, snake.y);   
;main.c:35: }
	ret
;main.c:36: void moveSnakeUp() {
;	---------------------------------
; Function moveSnakeUp
; ---------------------------------
_moveSnakeUp::
;main.c:37: snake.y -= 8;
	ld	hl, #_snake + 22
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:38: move_sprite(1, snake.x, snake.y);
	ld	b, (hl)
	ld	hl, #_snake + 21
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:38: move_sprite(1, snake.x, snake.y);
;main.c:39: }
	ret
;main.c:40: void moveSnakeDown() {
;	---------------------------------
; Function moveSnakeDown
; ---------------------------------
_moveSnakeDown::
;main.c:41: snake.y += 8;
	ld	hl, #_snake + 22
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:42: move_sprite(1, snake.x, snake.y);
	ld	b, (hl)
	ld	hl, #_snake + 21
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;c:/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:42: move_sprite(1, snake.x, snake.y);
;main.c:43: }
	ret
;main.c:45: void main() {  
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:47: lastDir = 1;
	ld	hl, #_lastDir
	ld	(hl), #0x01
;main.c:49: set_sprite_data(0, 2, GameSprites);
	ld	hl, #_GameSprites
	push	hl
	ld	a, #0x02
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
;main.c:52: createSnake();
	call	_createSnake
;main.c:55: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:56: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:57: while(1) {
00121$:
;main.c:59: if(joypad() & J_LEFT){
	call	_joypad
	bit	1, e
	jr	Z, 00118$
;main.c:60: moveSnakeLeft();
	call	_moveSnakeLeft
;main.c:61: lastDir = 0;
	ld	hl, #_lastDir
	ld	(hl), #0x00
	jr	00119$
00118$:
;main.c:62: } else if (joypad() & J_RIGHT) {
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00115$
;main.c:63: moveSnakeRight();
	call	_moveSnakeRight
;main.c:64: lastDir = 1;
	ld	hl, #_lastDir
	ld	(hl), #0x01
	jr	00119$
00115$:
;main.c:65: } else if (joypad() & J_UP) {
	call	_joypad
	bit	2, e
	jr	Z, 00112$
;main.c:66: moveSnakeUp();
	call	_moveSnakeUp
;main.c:67: lastDir = 2;
	ld	hl, #_lastDir
	ld	(hl), #0x02
	jr	00119$
00112$:
;main.c:68: } else if (joypad() & J_DOWN) {
	call	_joypad
	bit	3, e
	jr	Z, 00109$
;main.c:69: moveSnakeDown();
	call	_moveSnakeDown
;main.c:70: lastDir = 3;
	ld	hl, #_lastDir
	ld	(hl), #0x03
	jr	00119$
00109$:
;main.c:71: } else if(!joypad()) {
	call	_joypad
	ld	a, e
	or	a, a
	jr	NZ, 00119$
;main.c:72: switch (lastDir)
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
;main.c:74: case LEFT:
00101$:
;main.c:75: moveSnakeLeft();
	call	_moveSnakeLeft
;main.c:76: break;
	jr	00119$
;main.c:77: case RIGHT:
00102$:
;main.c:78: moveSnakeRight();
	call	_moveSnakeRight
;main.c:79: break;
	jr	00119$
;main.c:80: case UP:
00103$:
;main.c:81: moveSnakeUp();
	call	_moveSnakeUp
;main.c:82: break;
	jr	00119$
;main.c:83: case DOWN:
00104$:
;main.c:84: moveSnakeDown();
	call	_moveSnakeDown
;main.c:87: }
00119$:
;main.c:90: performDelay(7); 
	ld	a, #0x07
	push	af
	inc	sp
	call	_performDelay
	inc	sp
;main.c:93: }
	jp	00121$
	.area _CODE
	.area _CABS (ABS)
