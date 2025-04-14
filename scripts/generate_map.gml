///generate_map
/* This is where stages are built before the player
 * enters them.
 */
 
// A different generator could be used for varying types of stages.
// For example, one could be ancient runes or caverns, and be totally random.
// Another could be very methodical and for space ships.


var chunkBlueprint = global.chunkBlueprint;
ds_grid_clear(chunkBlueprint, EMPTY);

// choose a chunk
var choice = round(random(ds_list_size(global.chunks)));
var chunk  = ds_list_find_value(global.chunks, choice);

var centreColumn = floor(  ds_grid_width(chunkBlueprint) * 0.5);
var centreRow    = floor( ds_grid_height(chunkBlueprint) * 0.5);
var startRoom    = ds_grid_set(chunkBlueprint, centreColumn, centreRow, choice);
var currentColumn = centreColumn;   // keeps track of our column as we create more roooms
var currentRow    = centreRow;      // keeps track of our row as we create more roooms
var targetColumn  = currentColumn;
var targetRow     = currentRow;
var directions    = ds_list_create();


// decide on how many rooms/chunks there'll be on this map
var roomsToCreate = 1 + round(random(5));

// Create the rooms/chunks
for(roomsToCreate = roomsToCreate; roomsToCreate > 0; roomsToCreate--) {
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
        show_debug_message("direction chosen: " +string(direct));
        
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
        
        if !(inBounds(targetColumn, targetRow))
        or (existingValue != EMPTY) {
            show_debug_message("Cell was invalid for placement - " + string(targetColumn) +":" +string(targetRow));
            show_debug_message("Reason: existingValue=" + string(existingValue) + ", grid width: " +string(ds_grid_width(chunkBlueprint)) + ", grid height: " +string(ds_grid_height(chunkBlueprint)));
            ds_list_delete(directions, ds_list_find_index(directions, direct)); // remove e.g. "north" from available choices
            show_debug_message("removed "+string(direct) +" from available directions.");
        } else {
            cellValid = true;
            
            // blueprint the room
            var choice = irandom(ds_list_size(global.chunks) - 1);
            var chunk = ds_list_find_value(global.chunks, choice);
            ds_grid_set(chunkBlueprint, targetColumn, targetRow, chunk);
            
            currentColumn = targetColumn;
            currentRow = targetRow;
            
            show_debug_message("successfully created a new room!");
        }
    }
}


show_debug_message("Finished Map Generation! - Moving onto Stage Building");
