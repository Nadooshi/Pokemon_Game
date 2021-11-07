/// @desc 

var _slot = slots_map[? slot_index]

if not is_undefined(_slot) {
	with _slot
		event_perform(ev_gesture, ev_gesture_tap)
	slot_index++
	alarm[0] = 80
} 

