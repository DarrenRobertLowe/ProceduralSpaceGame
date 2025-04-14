///getWall(column, row);
/* Checks the given cell on global.WALL_GRID for a WALL.
 * Returns instance id of wall or -4 (noone) if none exists.
 * Note: An invalid input returns 0.
 */
var column  = argument0;
var row     = argument1;
var wall    = noone;

// check that the given cell is in bounds
if (inBounds(column, row)) {
    // get the contents of the valid cell
    wall = (ds_grid_get(global.GRID, column, row))
} else {
    return false;
}

// return the wall id if it exists
if (instance_exists(wall)) {
    if (wall.object_index == WALL) or (object_is_ancestor(wall.object_index, WALL)) {
        return wall;
    }
}

// no wall?
return noone;
