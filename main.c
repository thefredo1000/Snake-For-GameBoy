#include <gb/gb.h>
#include <stdio.h>
#include "Snake.c"
#include "GameSprites.c"

struct Snake snake;
enum directions {LEFT = 0, RIGHT = 1, UP = 2, DOWN = 3};
UINT8 lastDir;  // 0 = left, 1 = right, 2 = up, 3 = down

void performDelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void createSnake() {
    snake.x = 8;
    snake.y = 16;
    snake.height = 8;
    snake.width = 8;

    set_sprite_tile(1, 1);

    move_sprite(1, snake.x, snake.y);
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

void main() {  

    lastDir = 1;

    set_sprite_data(0, 2, GameSprites);
	set_sprite_tile(0,0);            /* defines the tiles numbers */

    createSnake();


    SHOW_SPRITES;
    DISPLAY_ON;
    while(1) {
        
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

       performDelay(7); 
    }
         
}
