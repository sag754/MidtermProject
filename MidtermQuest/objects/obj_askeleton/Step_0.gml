/// @description Insert description here
// You can write your code in this editor

// if the player dies, restart the game
if(place_meeting(x, y, obj_player))                         // checks to see if enemy collides with player
{
	global.player_health -= 1;                              // lose 1 health
		if(global.player_health <= 0)                       // checks to see if player has 0 health
		{
			game_restart();                                 // restart game
		}
}

yspeed += grav;  //enables enemy to jump

// if the enemy hits a wall, turn around
if place_meeting(x + xspeed, y, obj_wall){                  // if hits the wall
	while !place_meeting(x+sign(xspeed), y, obj_wall){      
		x += sign(xspeed);                                  // turns enemy around
	}
	xspeed *= -1;                                           // reverse speed
}

// if enemy hits ceiling, come down
if place_meeting(x, y + yspeed, obj_wall){                  // if hits the ceiling
	while !place_meeting(x, y+(yspeed), obj_wall){          
		y += sign(yspeed);                                  // fall back down
	}
	yspeed = 0;
}

// if enemy meets trigger, jump
if place_meeting(x + 64 * sign(xspeed), y, obj_trigger){    // jump height
	yspeed = -5;	                                        // jump speed
}

image_xscale = sign(xspeed)   // turns around the enemy

x += xspeed;                  // enemy movement on x
y += yspeed;                  // enemy movement on y