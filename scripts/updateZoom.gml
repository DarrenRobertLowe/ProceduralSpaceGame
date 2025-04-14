///updateZoom;

switch (zoom) {
    case 0:
        view_wview[0] = 160;
        view_hview[0] = 120;
        break;
    case 1:
        view_wview[0] = 320;
        view_hview[0] = 240;
        break;
    case 2:
        view_wview[0] = 640;
        view_hview[0] = 480;
        break;
    case 3:
        view_wview[0] = 1024;
        view_hview[0] = 768;
        break;
}


// center on the mouse
var col = getColumnFromX(mouse_x);
var row = getRowFromY(mouse_y);
center_view(0, col, row);
x = view_xview[0];
y = view_yview[0];

