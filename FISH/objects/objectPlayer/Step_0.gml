ysp+=grav;
xsp =0;

if keyboard_check_pressed(ord("A"))
{
	xsp=-groundSpd;
}

if keyboard_check_pressed(ord("D"))
{
	xsp=+groundSpd;
}


if place_meeting(x,y+1,objectBlock)
{
	//only allow jump when grounded
	ysp=0
	if keyboard_check_pressed(vk_space)
	{
		ysp=-jumpSpd
	}
}else{
	//allow faster movement in air
	if keyboard_check(ord("A"))
	{
		xsp=-airSpd;
	}

	if keyboard_check(ord("D"))
	{
		xsp=+airSpd;
	}

}
if place_meeting(x,y-1,objectBlock)
{
	ysp=grav
}

move_and_collide(xsp,ysp,objectBlock);