key_right = keyboard_check(vk_right) // DIREITA
key_left = keyboard_check(vk_left) // ESQUERDA
key_jump =keyboard_check(vk_up) //PULA
key_shoot = keyboard_check(ord("Z")) // ATIRAR




var move = key_right - key_left

hspd = move * spd;

vspd = vspd + grav;

 var flipped = direction;
 var gun_x = (x+4)*(flipped)
 var _xx = x + lengthdir_x(-5,image_angle)
 var y_offset = lengthdir_y(-100,image_angle)

if keyboard_check_pressed(ord("Z")) and (global.bullets > 0)
{


var t = (instance_create_layer(_xx,y-5,"Shoot",obj_shoot))
global.bullets --;
t.speed = 7.5;

t.direction = -90 +90 *other.image_xscale;

t.image_angle = direction;
}

//COLISÃO HORIZONTAL
if place_meeting(x+hspd,y,obj_wall)
{
	while(!place_meeting(x+sign(hspd),y,obj_wall))
	{
		x = x + sign(hspd)
	}
	hspd = 0;
}
x = x + hspd;

//COLISÃO VERTICAL
if place_meeting(x,y+vspd,obj_wall)
{
	while(!place_meeting(x,y+sign(vspd),obj_wall))
	{
	y = y + sign(vspd)
	}
vspd = 0;
}
y = y + vspd;


// PULAR
vspd += grav;

if(keyboard_check_pressed(vk_up) && jump_current > 0)
{
	if (vspd > 0)
	{
		vspd = -7;
	    jump_current = 0;
	} 
	else
	{
		vspd = -7;
		jump_current--;	
	}
    
}


if(place_meeting(x, y + vspd, obj_wall))
{
    if(vspd > 0)
    {
        jump_current = jump_number;
    }
    vspd = 0;
}

y += vspd;

if (jump_current = 0) && keyboard_check_pressed(vk_up){
	instance_create_layer(x-8, y, "Effects", obj_effect);
	jump_current--;
}






if(!place_meeting(x, y+1,obj_wall)){
	
	sprite_index = spr_jump;
	
}
else
{
	image_speed = 1;
	if (hspd == 0){
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_walking;
	}
}




if (hspd !=0)
{
	image_xscale = sign(hspd); //pra virar o sprite do personagem 
}








