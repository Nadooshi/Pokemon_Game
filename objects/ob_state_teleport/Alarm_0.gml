/// @desc Deal damage
	
alarm[0] = period;
if --hit_count < 0
	instance_destroy()

with pokemon_id {
	timeout = other.time_stat
	event_perform(ev_other, ev_user7)
	instance_destroy(other.id)
}
