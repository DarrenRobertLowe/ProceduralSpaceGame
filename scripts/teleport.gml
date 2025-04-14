///teleport(instance id, column, row);
/* Teleports an instance to the given coords, updating the
 * grid in the process.
 * @Returns void
 */

instance = argument0;
column   = argument1;
row      = argument2;

if (instance_exists(instance)) {
    var oldColumn = instance.column;
    var oldRow = instance.row;
    
    instance.column = column;
    instance.row = row;
    
    if (ds_grid_get(global.GRID, oldColumn, oldRow) == instance) {
        ds_grid_set(global.GRID, oldColumn, oldRow, EMPTY);
    }
    
    ds_grid_set(global.GRID, column, row, instance);
    
    instance.x = getXFromColumn(column);
    instance.y = getYFromRow(row);
}
