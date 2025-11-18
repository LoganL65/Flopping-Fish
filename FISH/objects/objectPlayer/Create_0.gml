//window settings
window_set_size(2560,1480);
window_center();

//size settings
image_xscale = 2;
image_yscale = 2;


//declaring vars
xsp = 0;
ysp = 0;
global.dashing = 0;
canDash = 0;
dashDir = 0;
dashTime = 0;
canMove = 1;
global.invincible = 0;
invincibleTimer = 0;


//declaring vars that are not 0
grav = 0.3;
//groundSpd must be a multiple of frictionSpd
groundSpd = 2.1;
airSpd = 0.3;
jumpSpd = 6;
maxHoriSpd = 8;
maxVertSpd = 8;
frictionSpd = 0.3;
dashSpd = 8;
dashDur = 15;
global.HPcurrent = 1000;
global.HPmax = 1000;
HPdecay = 1;
invincibleTimerMax = 30;