///walkRight()

var targetColumn = getColumnFromX(bbox_right+walkSpeed);
var targetRow = getRowFromY(y);

if (inBounds(targetColumn, targetRow)) {
    if  (ds_grid_get(global.FLOOR_GRID, targetColumn, targetRow) != EMPTY) 
    and (ds_grid_get(global.GRID, targetColumn, targetRow) == EMPTY) {
        x += walkSpeed;
    }
}
