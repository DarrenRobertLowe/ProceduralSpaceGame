///spawn(column, row, object index);
/* Creates an instance of the supplied creature at
 * the given grid coordinates.
 *
 * @Returns id of spawned instance
 */

var column   = argument0;
var row      = argument1;
var object   = argument2;

var instance = instance_create(getXFromColumn(column), getYFromRow(row), object);
instance.column = column;
instance.row    = row;

return instance;
