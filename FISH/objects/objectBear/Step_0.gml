if ((place_meeting(x-1, y, objectPlayer) || place_meeting(x+1, y, objectPlayer) || place_meeting(x, y-1, objectPlayer)) && global.dashing = 0 && global.invincible = 0)
{
	global.HPcurrent -= damage;
	sprite_index = spriteBear2
}
else if ((place_meeting(x-2, y, objectPlayer) || place_meeting(x+2, y, objectPlayer) || place_meeting(x, y-2, objectPlayer)) && global.dashing = 0 && global.invincible = 1)
{
	HP -= 1;
}

if HP <= 0 
{
	x = 0;
	y = 0;
}
if global.HPcurrent <= 0
{
	x = xstart;
	y = ystart;
	HP = 5;
}