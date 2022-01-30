// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// Todo lo que son colisiones
function scr_col(masc){
mask = masc;

if collision_circle(x,y,3,oSolido,true,true) return true;
return false;
}

// Collision derecha
function scr_col_right(masc){
mask = masc;

if collision_circle(x + (acos*mask)-asin*2, y - (asin*mask) - acos*2 ,3,oSolido,true,true) return true;
return false;
}

// Collision izquierda
function scr_col_left(masc){
mask = masc;

if collision_circle(x - (acos*mask)-asin*2, y - (asin*mask) - acos*2 ,3,oSolido,true,true) return true;
return false;
}

// Collision Superior
function scr_col_top(masc){
mask = masc;

if collision_circle(x - asin*mask, y - acos*mask,3,oSolido,true,true) return true;
return false;
}

// Collision Inferior
function scr_col_bottom(masc){
mask = masc;

if collision_circle(x + asin*mask, y + acos*mask,3,oSolido,true,true) return true;
return false;
}

// Collision Inferior
function scr_col_ground(masc){
mask = masc;

if collision_circle(x - asin*(mask*2),y+acos*(mask*1.5),3,oSolido,true,true) return true;
return false;
}

// Collision de la vision a la derecha
function scr_col_right_line(masc){
mask = masc;
line = floor(mask*2.5);
if collision_line(x+(acos*mask)+(asin*mask), y-(asin*mask)+(acos*mask),x+(acos*mask)+(asin*line), y-(asin*mask)+(acos*line),oSolido,true,true) return true;
return false;
}

// Collision de la vision a la izquierda
function scr_col_left_line(masc){
mask = masc;
line = floor(mask*2.5);
if collision_line(x-(acos*mask)+(asin*mask), y+(asin*mask)+(acos*mask),x-(acos*mask)+(asin*line), y+(asin*mask)+(acos*line),oSolido,true,true) return true;
return false;
}

// Encuentra un angulo
function scr_find_angle(a,b,c){
angle = round(a/8)*8;
hspace = b;
check = c;

acos = cos(degtorad(angle));
asin = sin(degtorad(angle));

x1 = round(x - (acos*hspace));
y1 = round(y + (asin*hspace));

x2 = round(x + (acos*hspace));
y2 = round(y - (asin*hspace));

done1 = 0;
done2 = 0;

i = check;
while (i > 0)
{
 	if !done1
	{
	 if collision_point(x1, y1, oSolido,true,true) done = true;
	 x1 += asin;
	 y1 += acos;
	 }
 	if !done2
	{
	 if collision_point(x2, y2, oSolido,true,true) done = true;
	 x2 += asin;
	 y2 += acos;
	 }	
	 if done1 && done2 break;
	 i -= 1;
 }
 
return round(point_direction(x1, y1,x2,y2));
}