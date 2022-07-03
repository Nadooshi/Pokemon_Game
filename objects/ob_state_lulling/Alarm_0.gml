/// @desc Deal damage

alarm[0] = period;
if --hit_count < 0 {
	instance_destroy()
} else
with pokemon_id {
	sc_ai_give_up()
	if object_index != ob_player_sleep
		event_perform(ev_other, ev_user6)
}
