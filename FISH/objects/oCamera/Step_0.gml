//if camera is fllowing something, then update the x and y positions constantly
if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}
// makes camera chase player, higher # means slower chase
x += (xTo - x)/25;
y += (yTo - y)/25;
//sets the camera view position
camera_set_view_pos(view_camera[0], x-(camWidth*0.5), y-(camHeight*0.5));