///findBottommostChunk(chunkBlueprint);
var chunkBlueprint = argument0;

gridWidth = ds_grid_width(chunkBlueprint);
gridHeight = ds_grid_height(chunkBlueprint);
            
// bottommost
for(var row=gridHeight; row>=0; row--) {
    for(var col=0; col<gridWidth; col++) {
        var tile = ds_grid_get(chunkBlueprint, col, row);
        if (tile != EMPTY) {
            return row;
        }
    }
}

return -1;
