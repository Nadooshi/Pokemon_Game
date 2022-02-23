/// @desc

// Inherit the parent event
event_inherited();
visible = false
if instance_exists(selected_id) {
	with selected_id {
		animation_set[0].time = alarm_get(0)
		animation_set[1].time = alarm_get(1)
	}
	if parameter_name = "passive_1" {
		next_animation.canvas = selected_id.animation_set[0].anim
		next_animation.state_main = selected_id.animation_set[0].main_stat
		next_animation.state_term = selected_id.animation_set[0].stat_term
		next_animation.biome_term = selected_id.animation_set[0].bio_term
		next_animation.time = selected_id.animation_set[0].time
	}
	if parameter_name = "passive_2" {
		next_animation.canvas = selected_id.animation_set[1].anim
		next_animation.state_main = selected_id.animation_set[1].main_stat
		next_animation.state_term = selected_id.animation_set[1].stat_term
		next_animation.biome_term = selected_id.animation_set[1].bio_term
		next_animation.time = selected_id.animation_set[1].time
	}
	
	visible = true
	if animation.canvas = ""
		animation = next_animation
		
	if animation.state_main = _ABILITY_STATE.none
		visible = false

	sc_passiv_animation_set(animation.canvas, animation.state_main, animation.state_term, animation.biome_term)
}
