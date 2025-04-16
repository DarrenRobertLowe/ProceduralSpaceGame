///setup_chunks();
/* Opens a text file containing data for how
 * stage chunks should be formed. These are then
 * used to generate stages/levels by placing them
 * next to eachother like lego blocks.
 */

// setup
var chunksFile  = file_text_open_read("blocks");
global.chunkWidth  = 7;
global.chunkHeight = 7;
var chunkWidth  = global.chunkWidth;
var chunkHeight = global.chunkHeight;
global.chunks = ds_list_create();


// scrape the file
while !(file_text_eof(chunksFile)) {
    var chunk = ds_grid_create(chunkWidth, chunkHeight);
    show_debug_message("Chunk created: " +string(chunk));
    
    for(var row=0; row<chunkHeight; row++) {
        
        var lineText = file_text_read_string(chunksFile);
        file_text_readln(chunksFile);
        if (lineText != "") {
            for(var col=1; col<=chunkWidth; col++) {        // strings start at index 1
                var value = string_char_at(lineText, col);
                ds_grid_set(chunk, col-1, row, value);      // -1 to compensate for 1-based index
            }
        }
    }
    
    newChunk = instance_create(0, 0, CHUNK);    // we need a wrapper because Game Maker doesn't handle grids how we expected
    newChunk.content = chunk;
    
    ds_list_add(global.chunks, newChunk);
    file_text_readln(chunksFile);
}

// finish
file_text_close(chunksFile);
