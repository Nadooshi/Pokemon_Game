/// @desc 

#macro AUTOTARGET_PERIOD 10

keys[k._count] = false
keys_before[k._count] = false


dirangle[d.Left ] = 180
dirangle[d.Right] = 0
dirangle[d.Up   ] = 90
dirangle[d.Down ] = 270

ob_cursor.visible = false
alarm_set(2, AUTOTARGET_PERIOD)

