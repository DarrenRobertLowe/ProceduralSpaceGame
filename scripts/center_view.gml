///center_view(view index, col, row);
var ind = argument0;
var col = argument1;
var row = argument2;

view_xview[ind] = getXFromColumn(col) - (view_wview[ind] * 0.5);
view_yview[ind] = getYFromRow(row) - (view_hview[ind] * 0.5);
