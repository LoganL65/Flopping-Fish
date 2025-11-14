if (9/10)*global.HPcurrent < global.HPcurrent <= (10/10)*global.HPmax
{
	draw_sprite(Droplet_1, 1, 50, 50) 
	
}

if (8/10)*global.HPcurrent < global.HPcurrent <= (9/10)*global.HPmax
{
	draw_sprite(Droplet_1, 2, 50, 50) 
	
}
else
{
	draw_sprite(Droplet_1, 10, 50, 50)
}