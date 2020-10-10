/// @desc

// Inherit the parent event
event_inherited();
var _tags = ""

if sprite_exists(sprite_index) {
	_tags = string(asset_get_tags(sprite_index, asset_sprite))
	p_looped = not (string_pos("nolp", _tags) > 0)
}
