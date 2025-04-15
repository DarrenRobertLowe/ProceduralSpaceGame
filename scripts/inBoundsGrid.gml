///inBoundsGrid(grid, column, row);
var grid   = argument0;
var column = argument1;
var row    = argument2;

if  (column >= 0)
and (row >= 0)
and (column < ds_grid_width(grid) )
and (row < ds_grid_height(grid) ) {
    return true;
}
