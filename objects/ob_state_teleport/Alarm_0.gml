/// @desc Deal damage
	
alarm[0] = period;
if --hit_count < 0
	instance_destroy()

with pokemon_id {
	timeout = other.time_stat
	hurt_timeout = other.damage
	event_perform(ev_other, ev_user7)
	instance_destroy(other.id)
}
