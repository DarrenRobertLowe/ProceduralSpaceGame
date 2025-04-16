///generate_map(min rooms, random variation)
/* This is where stages are built before the player
 * enters them.
 */
var minRooms  = argument0;
var variation = argument1;

// A different generator could be used for varying types of stages.
// For example, one could be ancient runes or caverns, and be totally random.
// Another could be very methodical and used for space ships.


var chunkBlueprint = global.chunkBlueprint;
ds_grid_clear(chunkBlueprint, EMPTY);

// choose a chunk
var choice = round(random(ds_list_size(global.chunks)));
var chunk  = ds_list_find_value(global.chunks, choice);

var centreColumn = floor(ds_grid_width(chunkBlueprint)  * 0.5);
var centreRow    = floor(ds_grid_height(chunkBlueprint) * 0.5);
var currentColumn = centreColumn;   // keeps track of our column as we create more roooms
var currentRow    = centreRow;      // keeps track of our row as we create more roooms
var targetColumn  = currentColumn;
var targetRow     = currentRow;
var directions    = ds_list_create();


// decide on how many rooms/chunks there'll be on this map
var roomsToCreate = minRooms + round(random(variation));

// create initial room
var chunk = ds_list_find_value(global.chunks, 0);
ds_grid_set(chunkBlueprint, targetColumn, targetRow, chunk);
currentColumn = targetColumn;
currentRow = targetRow;

// Create the rooms/chunks
for(; roomsToCreate > 0; roomsToCreate--) {
    // setup
    cellValid = false;
    ds_list_clear(directions);
    ds_list_add(directions, "north", "south", "east", "west");
    
    // try to place next cell
    while (cellValid == false) {
        // if we're out of directions to choose we have to end.
        if ((ds_list_size(directions)) == 0) {
            show_debug_message("No directions left! Abandoning!");
            roomsToCreate = 0;
            break;
        }
        
        // choose a direction
        var direct = ds_list_find_value(directions, irandom(ds_list_size(directions) -1));

        // place the chunk
        switch (direct) {
            case "north":
                targetColumn = currentColumn;
                targetRow = currentRow -1;
                break;
                
            case "south":
                targetColumn = currentColumn;
                targetRow = currentRow +1;
                break;
                
            case "east":
                targetColumn = currentColumn +1;
                targetRow = currentRow;
                break;
                
            case "west":
                targetColumn = currentColumn -1;
                targetRow = currentRow;
                break;
        }
        
        // invalid cell?
        var existingValue = ds_grid_get(chunkBlueprint, targetColumn, targetRow);
        
        if !(inBoundsGrid(chunkBlueprint, targetColumn, targetRow))
        or (existingValue != EMPTY) {
            ds_list_delete(directions, ds_list_find_index(directions, direct)); // remove e.g. "north" from available choices
        } else {
            cellValid = true;
            
            // blueprint the room
            var choice = irandom(ds_list_size(global.chunks) - 1);
            if (choice < 1) then choice = 1; // 0 is reserved for starting room/chunk
            var chunk = ds_list_find_value(global.chunks, choice);
            ds_grid_set(chunkBlueprint, targetColumn, targetRow, chunk);
            
            currentColumn = targetColumn;
            currentRow = targetRow;

            /*
            var movedCoords = centerBlueprintChunks(chunkBlueprint);
            
            // extract the coords from movedCoords
            var pos = string_pos(":", movedCoords);
            var movedColumn = string_copy(movedCoords, 1, pos-1);
            var movedRow = string_copy(movedCoords, pos+1, string_length(movedCoords));
            
            currentColumn += real(movedColumn);
            currentRow += real(movedRow);
            
            show_debug_message("currentColumn: "+ string(currentColumn) + ", currentRow: "+string(currentRow));
            */
        }
    }
}
