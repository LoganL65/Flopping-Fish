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
//max vertical spd
if (ysp>maxVertSpd)
{
	ysp=maxVertSpd;
}
if (ysp<-maxVertSpd)
{
	ysp=-maxVertSpd;
}



if place_meeting(x,y+1,objectBlock)
{
	//stop player from falling and allow dash
	ysp=0
	canDash=1;
	//only allow jump when grounded
	if canMove = 1 
	{
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
	}
	//horizontal friction while grounded
	if (xsp>0)
	{
		xsp -=frictionSpd;
	}
	if (xsp<0)
	{
		xsp +=frictionSpd;
	}
	if(abs(xsp)<=frictionSpd)
	{
		xsp = 0;
	}

	//when in air
	}else{
	//allow faster movement in air
	//disallow movement while dashing
	if canMove = 1
	{
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

//dash
if (keyboard_check(vk_shift) & canDash=1)
{
	
	if keyboard_check(ord("W"))
	{
		canDash = 0;
		global.dashing = 1;
		dashDir = 1;
		dashTime = dashDur
	}
}

//detect when to end dash
if global.dashing = 1
{
	dashTime -= 1
	//up
	if dashDir = 1
	{
		if ysp<dashSpd
		{
			ysp =- dashSpd;
			xsp = 0;
			sprite_index = spritePlayer;
		}
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
			sprite_index = spriteFish;
		}
		if dashTime < -dashDur/2
		{
			global.dashing = 0;
			dashDir = 0;
			sprite_index = spriteFish;
		}
	}
}



//right horizonatal collision
if place_meeting(x+1,y,objectBlock)
{
	xsp = ((xsp*-1)/2)-frictionSpd;
}
//left horizontal collision
if place_meeting(x-1,y,objectBlock)
{
	xsp = ((xsp*-1)/2)+frictionSpd;
}


//proper head bonking 
if place_meeting(x,y-1,objectBlock)
{
	ysp=grav
}

//moves the fish
move_and_collide(xsp,ysp,objectBlock);

