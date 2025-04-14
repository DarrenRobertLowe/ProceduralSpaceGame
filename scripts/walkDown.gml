/// walkDown()
var targetColumn = getColumnFromX(x);
var targetRow = getRowFromY(bbox_bottom+walkSpeed);

if (inBounds(targetColumn, targetRow)) {
    if  (ds_grid_get(global.FLOOR_GRID, targetColumn, targetRow) != EMPTY) 
    and (ds_grid_get(global.GRID, targetColumn, targetRow) == EMPTY) {
        y += walkSpeed;
    }
}    
