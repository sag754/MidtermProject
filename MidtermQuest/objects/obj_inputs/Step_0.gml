/// @description Sets up button inputs

// movement buttons
button_up = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu);
button_down = keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd);
button_left = keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl);
button_right = keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr);

button_x = keyboard_check_pressed(vk_space) || gamepad_button_check(0, gp_face1);
button_sqr = keyboard_check_pressed(ord("M")) || gamepad_button_check(0, gp_face2);
// system buttons

button_start = keyboard_check(vk_enter) || gamepad_button_check(0, gp_start);