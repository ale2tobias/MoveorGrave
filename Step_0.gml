/// @description Movimiento
scr_physics(); // Todo el movimiento del personaje
scr_control(); // El control del personaje

// Apuntar con el personaje
// direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = angle;

// Temporal
// if hsp == 0 && vsp == 0 sprite_index = sPlayer_Idle; else if hsp != 0 && vsp == 0 sprite_index = sPlayer_running; else sprite_index = sPlayer_Idle;