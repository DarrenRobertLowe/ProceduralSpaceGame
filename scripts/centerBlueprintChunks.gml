///centerBlueprintChunks(chunkBlueprint);
var chunkBlueprint = argument0;

// now we should center the rooms on the map
var gridWidth  = ds_grid_width(chunkBlueprint);
var gridHeight = ds_grid_height(chunkBlueprint);

// get the extremities of our room layout
var leftmost    = findLeftmostChunk(chunkBlueprint);
var rightmost   = findRightmostChunk(chunkBlueprint);
var topmost     = findTopmostChunk(chunkBlueprint);
var bottommost  = findBottommostChunk(chunkBlueprint);

// calculate the newTop and newLeft positions
var width  = rightmost - leftmost;
var height = bottommost - topmost;

var verticalGap   = gridHeight - height;
var horizontalGap = gridWidth - width;

var newTop  = floor(verticalGap * 0.5);
var newLeft = floor(horizontalGap * 0.5);


// move the contents on the grid
var tempGrid = ds_grid_create(gridWidth, gridHeight);
ds_grid_set_grid_region(tempGrid, chunkBlueprint, leftmost, topmost, rightmost, bottommost, newTop, newLeft);
ds_grid_clear(chunkBlueprint, EMPTY);
ds_grid_copy(chunkBlueprint, tempGrid);

// return the coords so the next chunk knows where to place itself
var topMovedAmount  = (newTop  - topmost);
var leftMovedAmount = (newLeft - leftmost);
var movedCoords = string(topMovedAmount) + ":" + string(leftMovedAmount);
return movedCoords;
