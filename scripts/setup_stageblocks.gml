///setup_stageblocks();
/* Opens a text file containing data for how
 * stage blocks should be formed. These are then
 * used to generate stages/levels.
 */

// setup
var blocksFile  = file_text_open_read("blocks");
var blockWidth  = 7;
var blockHeight = 7;
global.stageblocks = ds_list_create();

// scrape the file
while !(file_text_eof(blocksFile)) {
    show_debug_message("********* ********** *********");
    var blockgrid = ds_grid_create(blockWidth, blockHeight);
    
    for(var row=0; row<blockHeight; row++) {
        
        var lineText = file_text_read_string(blocksFile);
        file_text_readln(blocksFile);
        
        show_debug_message("row: " + string(row) + "    lineText: " +string(lineText));
        
        if (lineText != "") {
            for(var col=1; col<=blockWidth; col++) {            // strings start at index 1
                var value = string_char_at(lineText, col);
                ds_grid_set(blockgrid, col-1, row, value);      // -1 to compensate for 1-based index
                
                show_debug_message("col: "+ string(col) + "value: " +string(value));
            }
        }
    }
    
    ds_list_add(global.stageblocks, blockgrid);
    file_text_readln(blocksFile);
}

// finish
file_text_close(blocksFile);
