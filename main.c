#include <gb/gb.h>
#include <rand.h>
#include <stdio.h>
#include "Snake.c"
#include "Apple.c"
#include "GameSprites.c"


struct Snake snake;
struct Apple apple;
enum directions {LEFT = 0, RIGHT = 1, UP = 2, DOWN = 3};
UINT8 lastDir;  // 0 = left, 1 = right, 2 = up, 3 = down
UBYTE gameRunning;

void performDelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}


void moveSnakeLeft() {
    snake.x -= 8;
    move_sprite(1, snake.x, snake.y);
}
void moveSnakeRight() {
    snake.x += 8;
    move_sprite(1, snake.x, snake.y);   
}
void moveSnakeUp() {
    snake.y -= 8;
    move_sprite(1, snake.x, snake.y);
}
void moveSnakeDown() {
    snake.y += 8;
    move_sprite(1, snake.x, snake.y);
}

void setupSnake() {
    snake.x = 8;
    snake.y = 16;
    snake.height = 8;
    snake.width = 8;

    set_sprite_tile(1, 1);

    move_sprite(1, snake.x, snake.y);
}

void setupApple() {
    
    apple.x = 80;
    apple.y = 80;
    apple.height = 8;
    apple.width = 8;

    set_sprite_tile(2, 2);

    move_sprite(2, apple.x, apple.y);
}

void main() {  
    initrand(DIV_REG);

    lastDir = 1;

    set_sprite_data(0, 3, GameSprites);
	set_sprite_tile(0,0);            /* defines the tiles numbers */

    setupSnake();
    setupApple();


    SHOW_SPRITES;
    DISPLAY_ON;

    gameRunning = 1;

    while(gameRunning) {
        
        if(joypad() & J_LEFT){
            moveSnakeLeft();
            lastDir = 0;
        } else if (joypad() & J_RIGHT) {
            moveSnakeRight();
            lastDir = 1;
        } else if (joypad() & J_UP) {
            moveSnakeUp();
            lastDir = 2;
        } else if (joypad() & J_DOWN) {
            moveSnakeDown();
            lastDir = 3;
        } else if(!joypad()) {
            switch (lastDir)
            {
            case LEFT:
                moveSnakeLeft();
                break;
            case RIGHT:
                moveSnakeRight();
                break;
            case UP:
                moveSnakeUp();
                break;
            case DOWN:
                moveSnakeDown();
                break;
            
            }
        }

        if((snake.x >= apple.x && snake.x <= apple.x + apple.width) && (snake.y >= apple.y && snake.y <= apple.y + apple.height) || (apple.x >= snake.x && apple.x <= snake.x + snake.width) && (apple.y >= snake.y && apple.y <= snake.y + snake.height)){
            UINT8 xMax = 20;
            UINT8 xRand = rand();
            UINT8 yMax = 18;
            UINT8 yRand = rand();

            apple.x = ((xRand % xMax) + 1) * 8;
            apple.y = ((yRand % yMax) + 2) * 8;
            move_sprite(2, apple.x, apple.y);
        } else if (snake.x > 160 || snake.y > 144) {
            gameRunning = 0;
        }

       performDelay(8); 
    }
         
}
