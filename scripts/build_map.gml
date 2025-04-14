/// build_map()
// build the rooms
show_debug_message("******** MAP GENERATED - BUILDING *******");

// create a large grid to hold each room
ds_grid_clear(global.GRID, EMPTY);
var chunkWidth      = global.chunkWidth;
var chunkHeight     = global.chunkHeight;
var chunkBlueprint  = global.chunkBlueprint;
var blueprintWidth  = ds_grid_width(chunkBlueprint);
var blueprintHeight = ds_grid_height(chunkBlueprint);


// iterate through the finalMap
for (var blueprintColumn = 0; blueprintColumn < blueprintWidth; blueprintColumn++) {
    for (var blueprintRow = 0; blueprintRow < blueprintHeight; blueprintRow++) {
        // each cell represent a chunk with its own grid,
        // so now we need to build that. This is... not a fast
        // algorithm for doing this, but should be fine given the
        // small numbers involved.
        
        var chunk = ds_grid_get(chunkBlueprint, blueprintColumn, blueprintRow);
        
        if (chunk > 0) {
            show_debug_message("Chunk is: " + string(chunk));
            
            for (var innerColumn = 0; innerColumn < chunkWidth; innerColumn++) {
                for (var innerRow = 0; innerRow < chunkHeight; innerRow++) {
                    
                    var content = ds_grid_get(chunk.content, innerColumn, innerRow);
                    if (content != 0) { // 0 is void, 1 is floor, 2 is wall, etc
                        var targetColumn = ((blueprintColumn * chunkWidth)  + innerColumn);
                        var targetRow    = ((blueprintRow    * chunkHeight) + innerRow);
                        show_debug_message("blueprint coords: " +string(blueprintColumn) + ":" + string(blueprintRow));
                        show_debug_message("targetCol: " +string(targetColumn) + "  targetRow: " + string(targetRow));
                        build(targetColumn, targetRow, ds_list_find_value(global.MAP_PIECES_LIST, content));
                    }
                }
            }
        }
    }
}


// programmatically fill in missing outer walls

// place an entrance point for the player
