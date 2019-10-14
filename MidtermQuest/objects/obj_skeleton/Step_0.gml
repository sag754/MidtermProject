/// @Determines enemy states
// Determines enemy states

//switches the state of the enemy in terms of idling, attacking, or dieing
switch (state)
{
	case "Chase":                                     // determines what to do in the "Chase" state
		set_state_sprite(spr_skeleton_walk, 0.6, 0);  //sets the sprite to a walking animation 
		if not instance_exists(obj_player) break;     // if the player does not exist, don't do "Chase" state
		
		image_xscale = sign(obj_player.x - x);        //ensures the skeleton is always facing the player
		if image_xscale == 0                          //checks to see if player is behind enemy
		{	
			image_xscale = 1;                         //flips the enemy around to face player
		}
		
		//determines behavior of enemey to move closer to the player if player is within 42 pixels
		var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);  
		if distance_to_player > 42
		{
			move_towards_point(obj_player.x, obj_player.y, 1)	
		}
		break;                                        
}
