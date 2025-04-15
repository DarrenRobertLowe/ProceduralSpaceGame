///findLeftmostChunk(chunkBlueprint);
var chunkBlueprint = argument0;

gridWidth  = ds_grid_width(chunkBlueprint);
gridHeight = ds_grid_height(chunkBlueprint);
            
// leftmost
for(var col=0; col<gridWidth; col++) {
    for(var row=0; row<gridHeight; row++) {
        var tile = ds_grid_get(chunkBlueprint, col, row);
        if (tile != EMPTY) {
            return col;
        }
    }
}

return -1;
