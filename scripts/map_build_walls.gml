/// map_build_walls();
var gridWidth = ds_grid_width(global.GRID);
var gridHeight= ds_grid_height(global.GRID);

for (var c=0; c<gridWidth; c++){
    for (var r=0; r<gridHeight; r++){
        var tile = ds_grid_get(global.FLOOR_GRID, c, r);
        
        if (instance_exists(tile)) {
            if (tile.object_index == FLOOR) {
            
                // west
                if (ds_grid_get(global.FLOOR_GRID, c-1, r) == EMPTY) {
                    if (ds_grid_get(global.GRID, c-1, r) == EMPTY) {
                        build(c-1, r, WALL);
                    }
                }
                
                // east
                if (ds_grid_get(global.FLOOR_GRID, c+1, r) == EMPTY) {
                    if (ds_grid_get(global.GRID, c+1, r) == EMPTY) {
                        build(c+1, r, WALL);
                    }
                }
                
                // north
                if (ds_grid_get(global.FLOOR_GRID, c, r-1) == EMPTY) {
                    if (ds_grid_get(global.GRID, c, r-1) == EMPTY) {
                        build(c, r-1, WALL);
                    }
                }
                
                // south
                if (ds_grid_get(global.FLOOR_GRID, c, r+1) == EMPTY) {
                    if (ds_grid_get(global.GRID, c, r+1) == EMPTY) {
                        build(c, r+1, WALL);
                    }
                }
                
                // corners
                if (ds_grid_get(global.FLOOR_GRID, c-1, r+1) == EMPTY) {
                    if (ds_grid_get(global.GRID, c-1, r+1) == EMPTY) {
                        build(c-1, r+1, WALL);
                    }
                }
                
                
                if (ds_grid_get(global.FLOOR_GRID, c+1, r+1) == EMPTY) {
                    if (ds_grid_get(global.GRID, c+1, r+1) == EMPTY) {
                        build(c+1, r+1, WALL);
                    }
                }
                
                if (ds_grid_get(global.FLOOR_GRID, c-1, r-1) == EMPTY) {
                    if (ds_grid_get(global.GRID, c-1, r-1) == EMPTY) {
                        build(c-1, r-1, WALL);
                    }
                }
                
                if (ds_grid_get(global.FLOOR_GRID, c+1, r-1) == EMPTY) {
                    if (ds_grid_get(global.GRID, c+1, r-1) == EMPTY) {
                        build(c+1, r-1, WALL);
                    }
                }
                
                // next to the edge of the grid, become a wall
                if ((c-1) < 0)
                or ((c+1) >= gridWidth)
                or ((r-1) < 0)
                or ((r+1) >= gridHeight) {
                    build(c, r, WALL);
                }
            }
        }
    }
}
