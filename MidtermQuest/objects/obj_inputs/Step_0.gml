/// @description Sets up button inputs

// movement buttons
button_up = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu);  // sets W key on key board, Up on PS4 Dpad
button_down = keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd); // sets S key on keyboard, Down on PS4  Dpad
button_left = keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl); // sets A key on keyboard, Left on PS4 Dpad
button_right = keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr); // sets D key on keyboard, Right on PS4 Dpad

button_x = keyboard_check_pressed(vk_space) || gamepad_button_check(0, gp_face1);  // sets Space to jump, X on PS4 gamepad  
button_sqr = keyboard_check_pressed(ord("M")) || gamepad_button_check(0, gp_face2); // sets M to attack, Square on PS4 gamepad
// system buttons

button_start = keyboard_check(vk_enter) || gamepad_button_check(0, gp_start);  // sets Enter key to start, Start on PS4 gamepad