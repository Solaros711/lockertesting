class_name DateTime extends Resource

@export_range(0,59) var seconds = 0
@export_range(0,59) var minutes = 0
@export_range(0,23) var hours = 0
@export_range(0,366) var days = 0
@export var years = 0

var delta_time: float = 0
var leap_year: bool = false

#increases seconds based ticks that have passed.
func increase_by_sec(delta_seconds: float) -> void:
	delta_time += delta_seconds
	if delta_time < 1: return
	
	var delta_int_secs: int = delta_time
	delta_time -= delta_int_secs
	
	#incriments time values
	seconds += delta_int_secs
	minutes += seconds/60
	hours += minutes/60
	days += hours/24
	
	#accounts for leap years
	if (years%4 == 0):
		leap_year = true
		years += days/366
		days = days%366
	else:
		years += days / 365
		days = days%365
	
	#removes remainder for time
	seconds = seconds % 60
	minutes = minutes % 60
	hours = hours % 24
	print(str(years) + "/" + str(days) + " " + str(hours) + ":" + str(minutes) + ":" + str(seconds))
