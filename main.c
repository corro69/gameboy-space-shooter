#include <gb/gb.h>
#include <stdio.h>
#include <gb/font.h>
#include <stdlib.h>
#include "GameCharacter.c"
#include "GameSprites.c"
#include "windowmap.c"
#include "background.c"
#include "backgroundtiles.c"
#include <rand.h>
#include <stdbool.h>
#include "splashmap.c"
#include "splashtiles.c"
//#include "blankmap.c"
#include "blanktiles.c"
#include "collisionmap.c"

struct GameCharacter player;
struct GameCharacter alien1;
struct GameCharacter alien2;
struct GameCharacter alienship1;
struct GameCharacter laser;

UBYTE spritesize = 8;

void splashscreen(){
    set_bkg_data(0, 52, splashtiles);
    set_bkg_tiles(0,0,20,18,splashmap);
    SHOW_BKG;
    DISPLAY_ON;
    delay(1000);
    printf("\n \n \n \n \n     Level One \n \n \n \n \n ===Press Start===");
    waitpad(J_START);
}

void performancedelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }
}

///////////////////////////////
//Character setup
//////////////////////////////
void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
    move_sprite(character->spriteids[0],x,y);
    move_sprite(character->spriteids[2], x + spritesize, y);
    move_sprite(character->spriteids[1], x, y + spritesize);
    move_sprite(character->spriteids[3], x + spritesize, y + spritesize);
}

void setupplayer(){
    player.x = 80;
    player.y = 100;
    player.width = 16;
    player.height = 16;
   
    set_sprite_tile(0,0);
    player.spriteids[0] = 0;
    set_sprite_tile(1,1);
    player.spriteids[1] = 1;
    set_sprite_tile(2,2);
    player.spriteids[2] = 2;
    set_sprite_tile(3,3);
    player.spriteids[3] = 3;

    movegamecharacter(&player, player.x,player.y); 
}

void setupalien1(){
    alien1.x = 30;
    alien1.y = 0;
    alien1.width = 16;
    alien1.height = 16;

    set_sprite_tile(4,4);
    alien1.spriteids[0] = 4;
    set_sprite_tile(5,5);
    alien1.spriteids[1] = 5;
    set_sprite_tile(6,6);
    alien1.spriteids[2] = 6;
    set_sprite_tile(7,7);
    alien1.spriteids[3] = 7;

//    set_sprite_prop(4, S_PRIORITY);
//    set_sprite_prop(5, S_PRIORITY);
//    set_sprite_prop(6, S_PRIORITY);
//    set_sprite_prop(7, S_PRIORITY);

    movegamecharacter(& alien1, alien1.x, alien1.y);
}

void setupalien2(){
    alien2.x = 150;
    alien2.y = 0;
    alien2.width = 16;
    alien2.height = 16;

    set_sprite_tile(8,4);
    alien2.spriteids[0] = 8;
    set_sprite_tile(9,5);
    alien2.spriteids[1] = 9;
    set_sprite_tile(10,6);
    alien2.spriteids[2] = 10;
    set_sprite_tile(11,7);
    alien2.spriteids[3] = 11;

    movegamecharacter(&alien2, alien2.x, alien2.y);
}

void setupalienship1(){
    alienship1.x = 80;
    alienship1.y = 0;
    alienship1.width = 16;
    alienship1.height = 16;
   
    set_sprite_tile(16,8);
    alienship1.spriteids[0] = 16;
    set_sprite_tile(17,9);
    alienship1.spriteids[1] = 17;
    set_sprite_tile(18,10);
    alienship1.spriteids[2] = 18;
    set_sprite_tile(19,11);
    alienship1.spriteids[3] = 19;

    movegamecharacter(&alienship1, alienship1.x,alienship1.y); 
}

void movealiens1(){
    alien1.y += 1;
    alien1.x += 2;

    alienship1.y += 4;

    alien2.y += 1;
    alien2.x -= 2;

        if(alien1.y >= 144){
            alien1.y = 0;
            alien1.x = rand();
        }
        if(alien1.x > 140){
            alien1.x -= 2;
        }
        if(alien2.x < 20){
            alien2.x += 2;
        }

        if(alien2.y >= 144){
            alien2.y = 0;
            alien2.x = rand();
        }
        if(alien2.x < 20){
            alien2.x += 2;
        }
        if(alien2.x > 140){
            alien2.x -= 2;
        }

        if(alienship1.y >= 144){
            alienship1.y = 0;
            alienship1.x = rand();
        }
        if(alienship1.x < 20){
            alienship1.x = 20;
        }
        if(alienship1.x > 140){
            alienship1.x = 140;
        }
}

int max_laser = 3;
int laser_active = 0;
bool fire;
int alien_fire = 0;

void setuplaser(){
    laser.x = 0;
    laser.y = 0;
    laser.width = 16;
    laser.height = 16;

    set_sprite_tile(24,12);
    laser.spriteids[0] = 24;
    set_sprite_tile(25,13);
    laser.spriteids[1] = 25;
    set_sprite_tile(26,14);
    laser.spriteids[2] = 26;
    set_sprite_tile(27,15);
    laser.spriteids[3] = 27;

    movegamecharacter(&laser, laser.x, laser.y);
}

void move_lasers(){
        laser.y -= 25;
    if(laser.y > 150){
        laser.y = 0;
        fire = FALSE;
        laser_active -= 1;
    }
}

void alien_lasers(){
        laser.x = alienship1.x;
        laser.y = alienship1.y + 5;

        NR10_REG = 0x2F;
        NR11_REG = 0x4C;
        NR12_REG = 0xF8;
        NR13_REG = 0x33;
        NR14_REG = 0xC7;

        laser.y += 5;
    
    if(laser.y <= 0){
        laser.y = 0;
    }
}

void storealiens(){
    alienship1.x = 0;
    alienship1.y = 0;
    
    alien1.x = 0;
    alien1.y = 0;

    alien2.x = 0;
    alien2.y = 0;
}

void hide_player(){
    player.x = 0;
    player.y = 0;
}

void reset_player(){
    player.x = 80;
    player.y = 100;
}

/////////////////////////////////
// SOUNDS
/////////////////////////////////
void engine(){
    NR41_REG = 0x36;
    NR42_REG = 0x70;
    NR43_REG = 0x98;
    NR44_REG = 0x80;
}

void died(){
    NR10_REG = 0x3B;
    NR11_REG = 0x44;
    NR12_REG = 0xF7;
    NR13_REG = 0x74;
    NR14_REG = 0xC5;

    storealiens();
    hide_player();
    delay(1000);
    reset_player();
}

void explosion(){
//   NR41_REG = 0x3F;
//   NR42_REG = 0xF9;
//   NR43_REG = 0x6F;
//   NR44_REG = 0xC0;

    NR41_REG = 0x09;
    NR42_REG = 0x89;
    NR43_REG = 0x89;
    NR44_REG = 0xC0;

//    NR41_REG = 0x09;
//    NR42_REG = 0x89;
//    NR43_REG = 0x89;
//    NR44_REG = 0xC0;

//    NR10_REG = 0x74;
//    NR11_REG = 0x83;
//    NR12_REG = 0x69;
//    NR13_REG = 0x92;
//    NR14_REG = 0x85;

//    NR21_REG = 0x81;
//    NR22_REG = 0x84;
//    NR23_REG = 0x96;
//    NR24_REG = 0x86;
}

////////////////////////////
///MAP Detection--- I can only get this to work on a stationary background---
///////////////////////////
unsigned char blankmap[1] = {0x00};
unsigned char background_test_tiles[7] = {0x26,0x27,0x2A,0x2B,0x2F,0x31,0x34};

UBYTE if_can_move(UINT8 newplayerX, UINT8 newplayerY){
    UINT16 indexTLx, indexTLy, tileindexTL;
    UBYTE result;

    indexTLx = (newplayerX - 8) /8;
    indexTLy = (newplayerY - 16) /8;
    
    tileindexTL = 20 * indexTLy + indexTLx;

//   result = background[tileindexTL] == blankmap[0];  
    result = background[tileindexTL] == !background_test_tiles[0,1,2,3,4,5,6]; 
    return result;
}

/////////////////////////////////
//Controls 
////////////////////////////////
void pause(){

//    clearbackground();

//    set_bkg_data(0, 52, splashtiles);
//    set_bkg_tiles(0,0,20,18,splashmap);

    waitpad(J_START);

 //   clearbackground();
}

void ohjoy(){

        if(joypad() & J_LEFT){
 //           if(if_can_move(player.x -3, player.y)){
            player.x -= 3;
            movegamecharacter(&player, player.x, player.y);
//        }
               if(player.x <= 20){
                   player.x = 20; 
                } 
        }

        if(joypad() & J_RIGHT){
//           if(if_can_move(player.x +16, player.y)){
            player.x += 3;
            movegamecharacter(&player, player.x, player.y);
//        }
               if(player.x >= 140){
                   player.x = 140;
                }
        }

        if(joypad()& J_UP){
//            if(if_can_move(player.x, player.y -3)){
            player.y -= 3;
            movegamecharacter(&player, player.x, player.y);
//        }
               if(player.y <= 30){
                    player.y = 30;
            }
        }

        if(joypad()& J_DOWN){
//            if(if_can_move(player.x, player.y +16)){
            player.y += 3;
            movegamecharacter(&player, player.x, player.y);
//        }
               if(player.y >= 130){
                    player.y = 130;
            }
        }

        if(joypad() & J_A && !fire){
            if(laser_active < max_laser){
                laser_active += 1;
                laser.x = player.x;
                laser.y = player.y - 5;
                fire = TRUE;

                NR10_REG = 0x2F;
                NR11_REG = 0x4C;
                NR12_REG = 0xF8;
                NR13_REG = 0x33;
                NR14_REG = 0xC7;
            }
        }

        if(joypad() & J_START){
            pause();
        }  

        if(!(joypad()& J_UP)){
//            if(if_can_move(player.x, player.y +16)){
            player.y += 1;
            movegamecharacter(&player, player.x, player.y);
//        }
            if(player.y >= 130){
                player.y = 130;
            }
        }
}

void movecharacters(){

        movegamecharacter(&alien1, alien1.x, alien1.y);
        movegamecharacter(&alien2, alien2.x, alien2.y);
        movegamecharacter(&alienship1, alienship1.x, alienship1.y);
//        movegamecharacter(&alienship2, alienship2.x, alienship2.y);
        movegamecharacter(&laser,laser.x, laser.y);
}

//////////////////////////////////
// Collision Detection and scoring
/////////////////////////////////
int scr = 0;
UINT8 currentscore[1] = {0};
UINT8 bestscore[1] = {0};
int topscore = 0;
int lives = 3;

void score(){
    scr += 10;
}

UBYTE checkcollision(struct GameCharacter* one, struct GameCharacter* two){
    return(one->x >= two->x && one->x <= two->x + two->width) && (one->y >= two->y && one->y <= two->y + two->height) || (two->x >= one->x && two->x <= one->x + one->width) && (two->y >= one->y && two->y <= one-> y+ one->height);
}

void collisioncheck(){
    if(checkcollision(&player,&alien1)){
        alien1.x = 0;
        alien1.y = 0;
        died();
        lives -= 1;
    }
    else if(checkcollision(&player, &alien2)){
        alien2.x = 0;
        alien2.y = 0;
        died();
        lives -= 1;
    } 
    else if(checkcollision(&player, &alienship1)){
        alienship1.x = 0;
        alienship1.y = 0;
        died();
        lives -= 1;
    }
}

void laserblast(){
    if(checkcollision(&laser, &alien1)){
            explosion();
            score();
            alien1.x = 0;
            alien1.y = 0;
        }

    if(checkcollision(&laser, &alien2)){
            explosion();
            score();
            alien2.x = 0;
            alien2.y = 0;
        }

    if(checkcollision(&laser, &alienship1)){
            explosion();
            score();
            score();
            alienship1.x = 0;
            alienship1.y = 0;
        }

 //   if(checkcollision(&laser, &alienship2)){
 //       explosion();
 //       score();
 //       score();
 //       alienship2.x = 0;
 //       alienship2.y = 0;
 //   }
}

void interuptLCD(){
    HIDE_WIN;
}

void setupENV(){
    ENABLE_RAM_MBC1;
    
    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;

    font_t min_font;
    font_init();
    min_font = font_load(font_min);
    font_set(min_font);

    set_bkg_data(37,16,backgroundtiles);
    set_bkg_tiles(0,0,20,36,background);
    set_win_tiles(0,0,5,1,windowmap);
    move_win(7,135);

    set_sprite_data(0,20, GameSprites);
    setupplayer();
    setupalien1();
    setupalien2();
    setupalienship1();
    setuplaser();

    SHOW_WIN;
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    add_LCD(interuptLCD);
    enable_interrupts();
    set_interrupts(VBL_IFLAG | LCD_IFLAG);
}

void gotogxy(UBYTE x, UBYTE y);

////////////////////////////
///Level End and Gameover
////////////////////////////
int gameover = 0;

void isgameover(){
    if(lives == 0){
        storealiens();
        gameover = 1;
    }
}

void endscreen(){
    delay(100);
    printf("\n \n \n \n \n === GAME OVER === \n \n \n \n \n === %d",scr);
}
////////////////////////////
///MAIN
////////////////////////////
void main(){

    splashscreen();

    setupENV();

    while(!gameover){

        collisioncheck();
            
        scroll_bkg(0,-3);

        ohjoy();

        laserblast();

        movealiens1();
        
        movecharacters();

        move_lasers();

        isgameover();

        performancedelay(2);
    }

    while(gameover){

        endscreen();
    }


}