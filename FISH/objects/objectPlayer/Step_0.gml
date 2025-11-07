ysp += grav;



//max horizontal spd
if (xsp>maxHoriSpd)
{
	xsp=maxHoriSpd;
}
if (xsp<-maxHoriSpd)
{
	xsp=-maxHoriSpd;
}




if place_meeting(x,y+1,objectBlock)
{
	//only allow jump when grounded
	ysp=0
	if keyboard_check_pressed(vk_space)
	{
		ysp=-jumpSpd
	}
	//grounded movement
	if keyboard_check_pressed(ord("A"))
	{
		xsp=xsp-groundSpd;
	}

	if keyboard_check_pressed(ord("D"))
	{
		xsp=xsp+groundSpd;
	}
	//horizontal drag while grounded
	if (xsp>0)
	{
		xsp -= frictionSpd;
	}
	if (xsp<0)
	{
		xsp += frictionSpd;
	}
}else{
	//allow faster movement in air
	//disallow movement while dashing
	if (dashing = 0){
		if keyboard_check(ord("A"))
		{
			xsp=xsp-airSpd;
		}

		if keyboard_check(ord("D"))
		{
			xsp=xsp+airSpd;
		}
	//horizontal drag while airborn
	
	}
	if (xsp>0)
	{
		xsp -= frictionSpd/3;
	}
	if (xsp<0)
	{
		xsp += frictionSpd/3;
	}

}
if place_meeting(x,y-1,objectBlock)
{
	ysp=grav
}

move_and_collide(xsp,ysp,objectBlock);