///build(column, row, object index);
/* Creates an instance of the provided structure 
 * and adds it to its grid.
 *
 * @Returns id of building
 */

var column   = argument0;
var row      = argument1;
var object   = argument2;

if (object == EMPTY) {
    exit;
}

var instance = instance_create(getXFromColumn(column), getYFromRow(row), object);
instance.column = column;
instance.row    = row;
var grid = instance.grid;

if (ds_grid_get(grid, column, row) > 0) {
    var existing = ds_grid_get(grid, column, row);
    error("Warning! build() grid coords were already occupied! "
    + object_get_name(instance.object_index) +":"+ string(instance) + " replaced " + object_get_name(existing.object_index) +":" + string(existing)
    + " at " +string(column) + ":" + string(row));
}
ds_grid_set(grid, column, row, instance);

show_debug_message("Placed " +string(object_get_name(instance.object_index) + " at " +string(column) +":" +string(row)));

return instance;
