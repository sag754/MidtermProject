/// @description Updates the character

// checks for player input
check_player_input();

camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0])/2, 
			0);

if(!is_jumping && !is_falling && !is_attacking)
{
	//sets animation speed back to 1 from 0 at the bottom
	image_speed = 1;
	
	if(!is_falling)
		can_jump = true;
	// determines which way you're facing
	if(is_facing == "RIGHT")
	{
		if(velocity_x > 0)
			sprite_index = spr_player_run_right
		else if(velocity_x == 0)
			sprite_index = spr_player_idle_right;	
	}
	else if(is_facing == "LEFT")
	{
		if(velocity_x < 0)
			sprite_index = spr_player_run_left
		else if(velocity_x == 0)
			sprite_index = spr_player_idle_left;	
	}
}
else if(!is_attacking)
{
	// determines which way we're jumping
	if(is_facing == "RIGHT")
		sprite_index = spr_player_jump_right;
	else
		sprite_index = spr_player_jump_left;
	
	// jump after animation is finished
	if(!is_falling)
	{
		if(!has_jumped)
		{
			if(image_index > 0 && image_index < 5)
			{
				has_jumped = true;
				velocity_y = -jumpspeed;
			}
		}
	}
	
	// stop sprite animation is you jumped
	if(image_index >= 4 || is_falling)
	{
		image_speed = 0;
		image_index = 4;
	}
	
	
}

// attacking animation
if(is_attacking)
{
	show_debug_message("image speed: " + string(image_index));
	image_speed = 1;
	
	if(is_facing == "RIGHT"){
		sprite_index = spr_player_attack_right;
	}
	else
	{
		sprite_index = spr_player_attack_left;
	}
	if(image_index > 8){
		is_attacking = false;
	}
}


// enables gravity for jump
if(velocity_y <= global.max_grav)
	velocity_y += global.grav;

// sets up horizontal collision with walls
if(place_meeting(x + velocity_x, y, obj_wall)){
	while(!place_meeting(x + sign(velocity_x), y, obj_wall))
		x += sign(velocity_x);
		
		velocity_x = 0;
}

// sets up vertical collision with walls
if(place_meeting(x, y + velocity_y, obj_wall)){
	while(!place_meeting(x, y + sign(velocity_y), obj_wall))
		y += sign(velocity_y);
		
		// stop jumping
		if(is_jumping)
		{
			if(has_jumped)
			{
				is_jumping = false;
				has_jumped = false;
				is_falling = true;
			}
		}
		else
		{
			is_falling = false;
		}		
		
		// stop moving
		velocity_y = 0;
}

// if you walk of an edge, it changes animation to falling
else
is_falling = true


// moves the player based on velocity

x += velocity_x;
y += velocity_y;