/// @desc 

// Inherit the parent event
event_inherited();

alarm_set(0, 20)

h_marks = ds_map_create()
h_marks[? player1_trainer] = ds_map_create()
h_marks[? player2_trainer] = ds_map_create()


counter = 0
radius = 18
//courage_addup = 10
near_players = []
