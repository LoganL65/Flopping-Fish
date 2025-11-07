//window settings
window_set_size(2560,1480);
window_center();

//size settings
image_xscale = 1.2;
image_yscale = 1.2;


//declaring vars
xsp = 0;
ysp = 0;
dashing = 0;


//declaring vars that are not 0
grav = 0.2;
//groundSpd must be a multiple of frictionSpd
groundSpd = 2.1;
airSpd = 0.3;
jumpSpd = 5;
maxHoriSpd=7;
frictionSpd=0.3;