///

if active {
	timeout--
	if timeout <=0 {
		timeout = spawnPeriod
		ds_list_add(sparkles, {
			_x : x + random(10),
			_y : y + random(10),
			_time: sparkLifetime
		})
	}
}

for (var i=0; i<ds_list_size(sparkles); i++) {
	sparkles[| i]._x -= speedX
	sparkles[| i]._y -= speedY
	sparkles[| i]._time--
	if sparkles[| i]._time <=0 {
		ds_list_delete(sparkles, i)	
		i--
		continue
	}
}

if (ds_list_size(sparkles) = 0) and not active 
	instance_destroy()	
