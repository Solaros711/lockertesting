extends DirectionalLight3D

#end of day occurs as 3.142 lmao
const DAWN_COLOR = Color(1.0, 0.4705, 0, 1.0)
const DAY_COLOR = Color(1.0, 0.9686, 0.6235, 1.0)
const SUN_ROTATE: float = 0.00003644

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_color = DAWN_COLOR
	pass # Replace with function body.

#rotates the sun on the x axis, changing the color based on where it is on the horizon
func do_sun_move(time: DateTime):
	if(rotation.x > 0.10472):
		rotate_x(SUN_ROTATE)
		light_energy = 0.0
		#Resets angle of the sun so the inaccuracy doesn't break days later in time.
		if time.hours == 0 && time.minutes <= 0 && time.seconds <= 5:
			rotation_degrees = Vector3(90, 0, 0)
			print(str(rotation_degrees)+" degrees")
	else:
		light_energy = 1.0
		if time.hours <= 6 && time.minutes <= 5:
			light_color = DAWN_COLOR
		#Turns sun color from dawn to day
		if time.hours < 8:
			var sun_color = light_color
			if sun_color.g < DAY_COLOR.g:
				sun_color.g = sun_color.g + 0.00005
			if sun_color.b < DAY_COLOR.b:
				sun_color.b = sun_color.b + 0.00005
			light_color = sun_color
		#Turns sun color from day to dusk
		if time.hours >= 18:
			var sun_color = light_color
			if sun_color.g > DAWN_COLOR.g:
				sun_color.g = sun_color.g - 0.00005
			if sun_color.b > DAWN_COLOR.b:
				sun_color.b = sun_color.b - 0.00005
			light_color = sun_color
		rotate_x(SUN_ROTATE)
	#print(rotation.x*(180/3.14159))
