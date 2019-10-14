/// @description Insert description here
// You can write your code in this editor

yspeed += grav;

if place_meeting(x + xspeed, y, obj_wall){
	while !place_meeting(x+sign(xspeed), y, obj_wall){
		x += sign(xspeed);
	}
	xspeed *= -1;
}

if place_meeting(x, y + yspeed, obj_wall){
	while !place_meeting(x, y+(yspeed), obj_wall){
		y += sign(yspeed);
	}
	yspeed = 0;
}

if place_meeting(x + 64 * sign(xspeed), y, obj_trigger){
	yspeed = -5;	
}

image_xscale = sign(xspeed)

x += xspeed;
y += yspeed;