// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_physics(){
if hsp > hsp_max hsp = hsp_max;
if hsp < -hsp_max hsp = -hsp_max;
if vsp > vsp_max vsp = vsp_max;
if vsp < -vsp_max vsp = -vsp_max;

// Movimiento Horizontal
if hsp > 0
{
	for (i = 0; i < hsp && !scr_col_right(mid_mask); i += 1)
	 {
 	  x += acos;
	  y += asin;
	  }
}

if hsp < 0
{
	for (i = 0; i > hsp && !scr_col_left(mid_mask); i -= 1)
	 {
 	  x -= acos;
	  y -= asin; // +
	  }
}

// Movimiento Vertical
if vsp > 0
{
	for (i = 0; i < vsp && !scr_col_bottom(mid_mask); i += 1)
	 {
 	  y += 1;
	  }
}

if vsp < 0
{
	for (i = 0; i > vsp && !scr_col_top(mid_mask); i -= 1)
	 {
 	  y -= 1;
	  }
}


// Cuando aterrrizas
if vsp >= 0 && !onground && scr_col_bottom(mid_mask) && (scr_col_left_line(mid_mask) || scr_col_right_line(mid_mask))
{
 angle = scr_find_angle(angle, 10, mid_mask);
 acos = cos(degtorad(angle));
 asin = sin(degtorad(angle));
 vsp = 0;
 onground = true;
 }
 
 
  // Se agrega la colision con la pared
while (scr_col_right(mid_mask))
{
 x -= acos;
 y += asin;
 }
while (scr_col_left(mid_mask))
{
 x += acos;	
 y -= asin;
 }
 
 
//Mira al piso
if onground
{
 while (scr_col(mid_mask))	
	{
	 x -= asin;
	 y -= acos;
	 }
 while (!scr_col(mid_mask) && scr_col_ground(mid_mask))	
	{
	 x += asin;
	 y += acos;
	 }
 }
 

 
// Cuando deja de estar en el piso
if (!scr_col_left_line(mid_mask) || !scr_col_right_line(mid_mask)) && onground && !scr_col_bottom(mid_mask)
{
 onground = false;
 }
 
// Gravedad
if !onground vsp += grv;

if onground && scr_col_left_line(mid_mask) && scr_col_right_line(mid_mask)
{
 angle = scr_find_angle(angle,mid_mask,mid_mask);	
 } else {
	 angle = 0;	
	 }

acos = cos(degtorad(angle));
asin = sin(degtorad(angle));
}



function scr_control(){
key_right = keyboard_check(ord("D")); 
key_left = keyboard_check(ord("A")); 
key_jump = keyboard_check_pressed(vk_space); 

if key_right
{ 
 if hsp >= 0 hsp += acc; else hsp += dcc;	
 }
 
if key_left
{ 
 if hsp <= 0 hsp -= acc; else hsp -= dcc;	
 }
 
if !key_right && !key_left
{
 if hsp > 0 hsp -= frc;
 if hsp < 0 hsp += frc;
 if hsp <= frc && hsp >= -frc hsp = 0;
 }
 
if key_jump && onground
{
 onground = false;
 vsp = -6;
 }
}