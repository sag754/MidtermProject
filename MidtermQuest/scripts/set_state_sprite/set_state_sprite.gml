if sprite_index != spr_skeleton_walk  //if walking animation is not the current sprite index, do a thing
{
		sprite_index = argument0; //makes the skeleton do it's walk animation
		image_speed = argument1; //the speed at which the skeleton moves on the screen
		image_index = argument2; //the beginning frame of the animation
}