ysp += grav;
global.HPcurrent -= HPdecay;

//DIE
if global.HPcurrent <= 0
{
	x = xstart;
	y = ystart;
	global.HPcurrent = global.HPmax;
}

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
//animations
if ysp>1
{
	sprite_index = spriteFishRed1
} else if ysp<-1
{
	sprite_index = spriteFishRed3
} else
{
	sprite_index = spriteFishRed2
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
}
else
{
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
	//dash. 
	if (keyboard_check_pressed(vk_shift) & canDash=1)
	//Direction of dash is 45 degrees multiplied by value of dashDir starting north.
	
	{
		//these should be a function but I didnt think of that in time.
		//initiate up dash
		if keyboard_check(ord("W")) & !(keyboard_check(ord("A"))||keyboard_check(ord("D")))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 1;
			dashTime = dashDur/2;
			grav = 0;
		}
		//initiate right dash
		if keyboard_check(ord("D")) & !(keyboard_check(ord("S"))||keyboard_check(ord("W")))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 3;
			dashTime = dashDur;
			grav = 0;
		}
		//initiate down dash
		if keyboard_check(ord("S")) & !(keyboard_check(ord("D"))||keyboard_check(ord("A")))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 5;
			dashTime = dashDur;
			grav = 0;
		}
		//initiate left dash
		if keyboard_check(ord("A")) & !(keyboard_check(ord("S"))||keyboard_check(ord("W")))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 7;
			dashTime = dashDur;
			grav = 0;
		}
		//initiate up right dash
		if keyboard_check(ord("W")) & keyboard_check(ord("D"))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 2;
			dashTime = dashDur/1.5;
			grav = 0;
		}
		//initiate up left dash
		if keyboard_check(ord("W")) & keyboard_check(ord("A"))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 8;
			dashTime = dashDur/1.5;
			grav = 0;
		}
		//initiate down right dash
		if keyboard_check(ord("S")) & keyboard_check(ord("D"))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 4;
			dashTime = dashDur;
			grav = 0;
		}
		//initiate down left dash
		if keyboard_check(ord("S")) & keyboard_check(ord("A"))
		{
			canDash = 0;
			global.dashing = 1;
			dashDir = 6;
			dashTime = dashDur;
			grav = 0;
		}
	}
}

//dash stuff
if global.dashing = 1
{
	//decrease dash time to act as timer
	dashTime -= 1
	//dashing up
	if dashDir = 1
	{
		//bonk
		if place_meeting(x,y-1,objectBlock)
		{
			dashTime = 0;
			ysp = dashSpd
		} 
		if ysp<dashSpd
		{
			//set spd
			ysp = -dashSpd;
			xsp = 0;
		}
		
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
			
		}
	}
	//dashing right
	if dashDir = 3
	{
		//bonk
		if place_meeting(x+1,y,objectBlock)
		{
			dashTime = 0;
		}
		if xsp<dashSpd
		{
			//set spd
			xsp = dashSpd;
			ysp = 0;
		}
		
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
		}
	}
	//dashing down
	if dashDir = 5
	{
		
		//bonk
		if place_meeting(x,y+1,objectBlock)
		{
			dashTime = 0;
		} 
		if ysp>-dashSpd
		{
			//set spd
			ysp = dashSpd;
			xsp = 0;
		}
		
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
		}
	}
	//dashing left
	if dashDir = 7
	{
		//bonk
		if place_meeting(x-1,y,objectBlock)
		{
			dashTime = 0;
		}
		if xsp>-dashSpd
		{
			//set spd
			xsp = -dashSpd;
			ysp = 0;
		}
		
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
		}
	}
	//dashing up right
	if dashDir = 2
	{
		//bonk
		if place_meeting(x+1,y-1,objectBlock)
		{
			dashTime = 0;		
		} 
		//set x and y spd
		if ysp<(dashSpd/1.5)
		{
			ysp = -dashSpd/1.5;
		}
		if xsp<(dashSpd/1.5)
		{
			//set spd
			xsp = dashSpd/1.5;
		}
		
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
		}
	}
	//dashing up left
	if dashDir = 8
	{
		//bonk
		if place_meeting(x-1,y-1,objectBlock)
		{
			dashTime = 0;		
		} 
		//set x and y spd
		if ysp<(dashSpd/1.5)
		{
			ysp = -dashSpd/1.5;
		}
		if xsp>(-dashSpd/1.5)
		{
			//set spd
			xsp = -dashSpd/1.5;
		}
		
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
		}
	}
	//dashing down right
	if dashDir = 4
	{
		//bonk
		if place_meeting(x+1,y+1,objectBlock)
		{
			dashTime = 0;		
		} 
		//set x and y spd
		if ysp>(-dashSpd/1.5)
		{
			ysp = dashSpd/1.5;
		}
		if xsp<(dashSpd/1.5)
		{
			//set spd
			xsp = dashSpd/1.5;
		}
		
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;
		}
	}
	//dashing down left
	if dashDir = 6
	{
		//bonk
		if place_meeting(x-1,y+1,objectBlock)
		{
			dashTime = 0;		
		} 
		//set x and y spd
		if ysp>(-dashSpd/1.5)
		{
			ysp = dashSpd/1.5;
		}
		if xsp>(-dashSpd/1.5)
		{
			xsp = -dashSpd/1.5;
		}
		//timer for canMove
		if dashTime < dashDur/2
		{
			canMove = 1;
			grav = 0.3;
		}
		//timer for when dash ends
		if dashTime < 1
		{
			global.dashing = 0;
			dashDir = 0;

		}
	}
	image_alpha = 0.7;
}
else
{
	image_alpha = 1;
}
//when hit orb
if (place_meeting(x, y, objectOrb) & global.dashing = 1)
{
	dashTime = 0;
	xsp = xsp*-1.15;
	ysp = ysp*-1.15;
	canDash = 1;
	global.dashing = 0;
	grav = 0.3;
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
	ysp = grav;
}
//water
if place_meeting(x,y+2,objectWater)
{
	global.HPcurrent = global.HPmax;
}

//moves the fish
move_and_collide(xsp,ysp,objectBlock);

