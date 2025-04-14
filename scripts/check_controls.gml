///check_controls();

if (keyboard_check(vk_up)) {
    global.controls_up = true;
}
if (keyboard_check(vk_down)) {
    global.controls_down = true;
}
if (keyboard_check(vk_left)) {
    global.controls_left = true;
}
if (keyboard_check(vk_right)) {
    global.controls_right = true;
}


if (keyboard_check(vk_enter)) {
    global.controls_accept = true;
}

if (keyboard_check(vk_backspace)) {
    global.controls_cancel = true;
}

if (keyboard_check(vk_escape)) {
    global.controls_menu = true;
}
