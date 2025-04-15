/// build_map()
// build the rooms
show_debug_message("");
show_debug_message("");
show_debug_message("******** MAP GENERATED - BUILDING *******");
show_debug_message("");
show_debug_message("");

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
            //show_debug_message("Chunk is: " + string(chunk));
            
            for (var innerColumn = 0; innerColumn < chunkWidth; innerColumn++) {
                for (var innerRow = 0; innerRow < chunkHeight; innerRow++) {
                    
                    var content = ds_grid_get(chunk.content, innerColumn, innerRow);
                    if (content != 0) { // 0 is void, 1 is floor, 2 is wall, etc
                        var targetColumn = ((blueprintColumn * chunkWidth)  + innerColumn);
                        var targetRow    = ((blueprintRow    * chunkHeight) + innerRow);
                        build(targetColumn, targetRow, ds_list_find_value(global.MAP_PIECES_LIST, content));
                    }
                }
            }
            
            // north
            if (inBounds(blueprintColumn, blueprintRow-1)) {
                var northChunk = ds_grid_get(chunkBlueprint, blueprintColumn, blueprintRow-1);
                if (northChunk == EMPTY) {
                    //show_debug_message("Nothing found to the north");
                } else {
                    //show_debug_message("Chunk found to the north");
                    chunk_bridgeNorth(blueprintColumn, blueprintRow, false);
                }
            }
            
            // west
            if (inBounds(blueprintColumn-1, blueprintRow)) {
                var westChunk = ds_grid_get(chunkBlueprint, blueprintColumn-1, blueprintRow);
                if (westChunk == EMPTY) {
                    //show_debug_message("Nothing found to the west");
                } else {
                    //show_debug_message("Chunk found to the west");
                    chunk_bridgeWest(blueprintColumn, blueprintRow, false);
                }
            }
            
        }
    }
}


// programmatically fill in outer walls


// place an entrance point for the player
