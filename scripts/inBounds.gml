///inBounds(column, row);
var column = argument0;
var row    = argument1;

if  (column >= 0)
and (row >= 0)
and (column < ds_grid_width(global.GRID) )
and (row < ds_grid_height(global.GRID) ) {
    return true;
}
