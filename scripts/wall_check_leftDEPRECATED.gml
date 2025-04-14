/// wall_check_left(instance id);
/* Checks for a wall to the left of the given instance.
 * NOTE: The instance must be a grid object with a column and row.
 * Returns instance id of wall or -1 if none exists
 */

var instance = argument0;
var left = noone;
var targetColumn = noone;

if !(object_is_ancestor(instance.object_index, GRID_OBJECT)) {
    error("Called wall_check_left on a non GRID_OBJECT ancestor! " + string(instance));
    return false;
}

// get the right contents from the wall grid
var targetColumn = instance.column - 1;
if (targetColumn < global.gridWidth) {
    leftWall = (ds_grid_get(global.WALL_GRID, targetColumn, row))
}

// return the wall id if it exists
if (instance_exists(leftWall)) {
    if (isTypeOf(leftWall, WALL)) {
        return leftWall;
    }
}
