/// @desc
if visible {
	if (alarm_get(0) < 0)
		alarm_set(0, 30)
} else
	alarm_set(0, -1)

