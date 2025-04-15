/// setup_grids

global.blueprintGridWidth  = 30; // how many chunks(rooms) a map can be wide
global.blueprintGridHeight = 30; // how many chunks(rooms) a map can be tall
global.chunkBlueprint = ds_grid_create(global.blueprintGridWidth, global.blueprintGridHeight);

global.gridWidth  = (global.blueprintGridWidth * global.chunkWidth);   // the actual final global.GRID width 
global.gridHeight = (global.blueprintGridHeight * global.chunkHeight); // the actual final global.GRID height

global.cellWidth  = 16;
global.cellHeight = 16;
global.gamespeed  = 60;

global.gridOffsetX = 0; // (global.cellWidth  * 3);
global.gridOffsetY = 0; // (global.cellHeight * 3);

// these get overridden anyway
global.GRID         = ds_grid_create(global.gridWidth, global.gridHeight); 
global.FLOOR_GRID   = ds_grid_create(global.gridWidth, global.gridHeight);
ds_grid_clear(global.GRID, EMPTY);
ds_grid_clear(global.FLOOR_GRID, EMPTY);
