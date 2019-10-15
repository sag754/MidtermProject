/// @description initilizes variables for the game state parameters

global.player_health = 4;    // players hit points
global.grav = 1;             // global gravity
global.max_grav = 12;        // max global gravity


// create object input
instance_create_depth(x, y, 0, obj_inputs);

audio_play_sound(snd_levelmusic, 1, 0);