#include <gb/gb.h>
#include <stdio.h>

#include "splashmap.c"
#include "splashtiles.c"


   

void main{

    set_bkg_data(0, 13, splashtiles);
    set_bkg_tiles(0,0,20,18,splashmap);


    SHOW_BKG;
    DISPLAY_ON;

    waitpad(J_START);

}
