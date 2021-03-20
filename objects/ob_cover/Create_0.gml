/// @desc 

// Inherit the parent event
event_inherited();

alarm_set(0, 20)
//alarm_set(1, 25)

h_marks = ds_map_create()
h_marks[? player1_trainer] = ds_map_create()
h_marks[? player2_trainer] = ds_map_create()
//h_marks[0] = ds_list_create()
//h_marks[1] = ds_list_create()

counter = 0
radius = 18
courage_addup = 10
near_players = []
