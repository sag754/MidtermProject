/// check_player_input();

// run to the left
if(obj_inputs.button_left){
	obj_player.is_facing  = "LEFT";
	obj_player.velocity_x = -movespeed;	
}

// run to the right
else if(obj_inputs.button_right){
	obj_player.is_facing  = "RIGHT";
	obj_player.velocity_x = movespeed;	
}

// otherwise, character is IDLE
else{
	if(!obj_player.is_jumping)
	{
		if(obj_player.velocity_x < 0)
		obj_player.velocity_x++;
		else if(obj_player.velocity_x > 0)
		obj_player.velocity_x--;
	}
}

// attack with sword
if(obj_inputs.button_sqr)
{
	obj_player.is_attacking = true;
}
else
{
	//obj_player.is_attacking = false;
}

// toggles Jump button
if(obj_inputs.button_x)
{
	// checks if we can jump
	if(obj_player.can_jump)
	{
		obj_player.can_jump = false;
		obj_player.is_jumping = true;
		obj_player.image_index = 0;
	}
} 