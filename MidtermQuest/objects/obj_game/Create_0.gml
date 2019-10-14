/// @description initilizes variables for the game state parameters

state = "IN_GAME";

global.grav = 1;
global.max_grav = 12;


// create object input
instance_create_depth(x, y, 0, obj_inputs);