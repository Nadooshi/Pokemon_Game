/// @desc 
counter++

if not canMove
	exit

prev_doMove = doMove

if not sc_does_exist(target)
	scBehaviour = sc_ai_new_target

