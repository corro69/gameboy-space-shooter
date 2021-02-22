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

struct GameCharacter player;
struct GameCharacter alien1;
struct GameCharacter alien2;
struct GameCharacter alienship1;
struct GameCharacter laser;

UBYTE spritesize = 8;

void movegamecharacter(struct GameCharacter* character, UINT8 x, UINT8 y){
    move_sprite(character->spriteids[0],x,y);
    move_sprite(character->spriteids[2], x + spritesize, y);
    move_sprite(character->spriteids[1], x, y + spritesize);
    move_sprite(character->spriteids[3], x + spritesize, y + spritesize);
}

void performancedelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }
}

void setupplayer(){
    player.x = 80;
    player.y = 130;
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
    alienship1.x = 100;
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

    alienship1.y += 2;
//    alienship2.y += 1;

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
}


#define MAX_LASERS 4
#define laser_active 0
bool fire;

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
    }
}

void ohjoy(){

        if(joypad() & J_LEFT){
            player.x -= 2;
            movegamecharacter(&player, player.x, player.y); 
                if(player.x <= 20){
                    player.x = 20; 
                } 
        }

        if(joypad() & J_RIGHT){
            player.x += 2;
            movegamecharacter(&player, player.x, player.y);
                if(player.x >= 140){
                    player.x = 140;
                }
        }

        if(joypad()& J_UP){
            player.y -= 2;
            movegamecharacter(&player, player.x, player.y);
               if(player.y <= 60){
                    player.y = 60;
            }
        }

        if(joypad()& J_DOWN){
            player.y += 2;
            movegamecharacter(&player, player.x, player.y);
               if(player.y >= 130){
                    player.y = 130;
            }
        }

        if(joypad() & J_A && !fire){
            if(laser_active < 3){
                laser.x = player.x;
                laser.y = player.y - 5;
                fire = TRUE;
                laser_active + 1;

                NR10_REG = 0x2F;
                NR11_REG = 0x4C;
                NR12_REG = 0xF8;
                NR13_REG = 0x33;
                NR14_REG = 0xC7;
            }
        }
}

UBYTE checkcollision(struct GameCharacter* one, struct GameCharacter* two){
    return(one->x >= two->x && one->x <= two->x + two->width) && (one->y >= two->y && one->y <= two->y + two->height) || (two->x >= one->x && two->x <= one->x + one->width) && (two->y >= one->y && two->y <= one-> y+ one->height);
}

void explosion(){
    NR41_REG = 0x3F;
    NR42_REG = 0xF9;
    NR43_REG = 0x6F;
    NR44_REG = 0xC0;
}

void laserblast(){
    if(checkcollision(&laser, &alien1)){
            explosion();
            alien1.x = 0;
            alien1.y = 0;
        }

    if(checkcollision(&laser, &alien2)){
            explosion();
            alien2.x = 0;
            alien2.y = 0;
        }

    if(checkcollision(&laser, &alienship1)){
            explosion();
            alienship1.x = 0;
            alienship1.y =0;
        }
}

void main(){

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

    while(!checkcollision(&player,&alien1) && !checkcollision(&player, &alien2) && !checkcollision(&player, &alienship1)){
               
        scroll_bkg(0,-4);

        ohjoy();

        laserblast();

        movealiens1();
        
        movegamecharacter(&alien1, alien1.x, alien1.y);
        movegamecharacter(&alien2, alien2.x, alien2.y);
        movegamecharacter(&alienship1, alienship1.x, alienship1.y);
        movegamecharacter(&laser,laser.x, laser.y);

        move_lasers();

        performancedelay(2);
    }
    NR10_REG = 0x3B;
    NR11_REG = 0x44;
    NR12_REG = 0xF7;
    NR13_REG = 0x74;
    NR14_REG = 0xC5;
    printf("\n \n \n \n \n === GAME OVER ===");
}