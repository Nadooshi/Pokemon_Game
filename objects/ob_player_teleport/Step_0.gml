/// @desc 

counter++

image_index = ceil(counter * 0.05) * 2

timeout -= delta_time / 1000000
if timeout <= 0 
	event_perform(ev_other, ev_user1)
	
with text {
	x = other.x
	y = other.y - 12
	caption = string(ceil(other.timeout))
}
