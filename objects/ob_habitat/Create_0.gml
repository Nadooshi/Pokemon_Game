/// @desc init

collided_with = noone
collided_from = noone // id of area that is in collision

coll_areas = ds_map_create() // "land", "air", "buried"

alarm_set(0, 30)
