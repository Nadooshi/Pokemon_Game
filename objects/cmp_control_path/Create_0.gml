/// @desc 

keys[k._count] = false
keys_before[k._count] = false

prev_doMove = false

dirangle[d.Left ] = 180
dirangle[d.Right] = 0
dirangle[d.Up   ] = 90
dirangle[d.Down ] = 270

attack_timeout = 3 + random_range(0.1,2)

path = path_add()
path_number = 0
counter = 0
