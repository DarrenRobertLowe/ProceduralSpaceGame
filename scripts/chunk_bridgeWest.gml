///chunk_bridgeWest(blueprintColumn, blueprintRow, fillout?);
var blueprintColumn = argument0;
var blueprintRow    = argument1;
var fillout         = argument2;
var chunkWidth      = global.chunkWidth;
var chunkHeight     = global.chunkHeight;

if (fillout) {
    // make things blotchier/boxier
    var columnStart = (blueprintColumn * chunkWidth)  - 1;
    var columnEnd   = (blueprintColumn * chunkWidth)  + 1;
    var rowStart    = (blueprintRow    * chunkHeight) + 3; //floor(chunkWidth * 0.5); // e.g. 3rd
    var rowEnd      = (blueprintRow    * chunkHeight) + 4; //ceil(chunkWidth * 0.5);  // e.g. 4th
    
    for(var c = columnStart; c<=columnEnd; c++) {
        for(var r = rowStart; r<=rowEnd; r++) {
            ds_grid_set(global.GRID, c, r, EMPTY);
            build(c, r, FLOOR);
        }
    }
}

// connect a path
var startC  = (blueprintColumn * chunkWidth);
var endC    = ((blueprintColumn-1) * chunkWidth);
var startR  = (blueprintRow * chunkHeight);
var endR    = ((blueprintRow+1) * chunkHeight);
var connected = false;
show_debug_message("startC is "+ string(startC));
show_debug_message("endC is " +string(endC));
var validConnections = ds_list_create();

// find the nearest floor to the west
for(var r = startR; r<endR; r++) {          // iterate from the top down
    for(var c = startC; c >= endC; c--) {   // iterate to the left
        var tile = ds_grid_get(global.FLOOR_GRID, c, r);
        if (instance_exists(tile)) {
            connectionFound = true;
            //show_debug_message("Floor connection found to the west.");
            
            var connection = string(c) + ":" +string(r);
            ds_list_add(validConnections, connection);
            break;
        }
    }
}

// select a valid lane at random
if (ds_list_size(validConnections) > 0) {
    var connectionString = ds_list_find_value(validConnections, irandom(ds_list_size(validConnections)-1));
    show_debug_message("chosen connectionString: "+ string(connectionString));
    
    var pos = string_pos(":", connectionString);
    startC = real(string_copy(connectionString, 1, pos-1));
    startR = real(string_copy(connectionString, pos+1, string_length(connectionString)));
    
    show_debug_message("startC:" +string(startC));
    show_debug_message("startR:" +string(startR));
}

// bridge to the east until we reach another floor or the center column
if (ds_list_size(validConnections) > 0) {
    show_debug_message("attempting to bridge connection");
    var endC = ((blueprintColumn * chunkWidth) + round(chunkWidth * 0.5));
    for(var c=(startC+1); c<endC; c++) {
        var tile = ds_grid_get(global.FLOOR_GRID, c, startR);
        
        if (instance_exists(tile)) {
            show_debug_message("connection established");
            connected = true;
            break;
        } else {
            ds_grid_set(global.GRID, c, startR, EMPTY);
            build(c, startR, FLOOR);
            show_debug_message("placed floor at "+ string(c) + ":" + string(startR));
        }
    }
}

// fail state
if !(connected) {
    error("Error! Could not find a path to connect!");
}
