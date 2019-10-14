/// @description Updates the character

// checks for player input
check_player_input();

// set 2D Side scrolling camera for mega man style gameplay
camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0])/2, 
			0);

// determines player states so we can tell when moving, jumping, and attacking
if(!is_jumping && !is_falling && !is_attacking)
{
	image_speed = 1;                                //sets animation speed back to 1 from 0 at the bottom
	
	if(!is_falling)                                 // if the player lands after jumping, they can jump again
		can_jump = true;
		
	// determines which way you're facing
	if(is_facing == "RIGHT")                        //State that determines if the player is facing right, do a thing
	{
		if(velocity_x > 0)                          //checks to see if the characters x-velocity is great than 0 to run right
			sprite_index = spr_player_run_right     //sets run right sprite animation
		else if(velocity_x == 0)                    //if the players x-velocity is 0 (or isn't moving), then be idle facing right
			sprite_index = spr_player_idle_right;   //sets idle right sprite animation
	}
	else if(is_facing == "LEFT")                    //State that determines if the player is facing left, do a thing
	{
		if(velocity_x < 0)                          //checks to see if the character's x-velocity is less than 0 to run left
			sprite_index = spr_player_run_left      //sets run left sprite animation
		else if(velocity_x == 0)                    //if the players x-velocity is 0 (or isn't moving, then be idle facing left
			sprite_index = spr_player_idle_left;	//sets idle left sprite animation
	}
}
else if(!is_attacking)                              //if we're not attacking, do the following bits of code
{
	if(is_facing == "RIGHT")                        //determines if we're facing RIGHT (using the RIGHT state)
		sprite_index = spr_player_jump_right;       //if player state is facing RIGHT, then set sprite animation to Jump Right
	else
		sprite_index = spr_player_jump_left;        //otherwise, state is facing LEFT, therefore, set sprite animation to Jump Left
	
	if(!is_falling)                                 // determines to see if the player is NOT falling
	{
		if(!has_jumped)                             // AND has also NOT jumped
		{
			if(image_index > 0 && image_index < 5)  //
			{
				has_jumped = true;
				velocity_y = -jumpspeed;
			}
		}
	}
	
	// stop sprite animation if you jumped
	if(image_index >= 4 || is_falling)
	{
		image_speed = 0;
		image_index = 4;
	}
	
	
}

// attacking animation
if(is_attacking)
{
	image_speed = 1;  //sets the animation speed
	
	if(is_facing == "RIGHT"){                          // determines which face state you're in
		sprite_index = spr_player_attack_right;        // if you're facing right, use Attack Right sprite animation
	}
	else
	{
		sprite_index = spr_player_attack_left;         // otherwise, use Attack Left sprite animation
	}
	if(image_index > 8){                               // if the frame count for any of the attack animations exceeds 8, do a thing
		is_attacking = false;                          // stops the attack animation state
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


if(place_meeting(x + velocity_x, y, obj_wall) &&  place_meeting(x, y + velocity_y, obj_wall) && is_jumping){
	show_debug_message("jump hit");
}

// sets up vertical collision with walls
if(place_meeting(x, y + velocity_y, obj_wall)){
	//show_debug_message("velocity Y: " + string(velocity_y));
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

// if you walk off an edge, it changes animation to falling
else
is_falling = true  //determines if the player is falling


// moves the player based on velocity

x += velocity_x;  //moves player along the x
y += velocity_y;  //moves player along the y