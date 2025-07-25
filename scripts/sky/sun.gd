extends DirectionalLight3D
var time = 0.0
#end of day occurs as 3.142 lmao
const DAWN_COLOR = Color(1.0, 0.4705, 0, 1.0)
const DAY_COLOR = Color(1.0, 0.9686, 0.6235, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_color = DAWN_COLOR
	pass # Replace with function body.


func _process(delta: float) -> void:
	do_sun_move()

#rotates the sun on the x axis, changing the color based on where it is on the horizon
func do_sun_move():
	if(rotation.x > 0.10472):
		rotate_x(-0.0005)
		time = 0.0
		light_energy = 0.0
	else:
		light_energy = 1.0
		if time == 0.0:
			light_color = DAWN_COLOR
		#Turns sun color from dawn to day
		if time < 1.0:
			var sun_color = light_color
			if sun_color.g < DAY_COLOR.g:
				sun_color.g = sun_color.g + 0.0005
			if sun_color.b < DAY_COLOR.b:
				sun_color.b = sun_color.b + 0.0005
			light_color = sun_color
		#Turns sun color from day to dusk
		if time > 2.642:
			var sun_color = light_color
			if sun_color.g > DAWN_COLOR.g:
				sun_color.g = sun_color.g - 0.0005
			if sun_color.b > DAWN_COLOR.b:
				sun_color.b = sun_color.b - 0.0005
			light_color = sun_color
		time += 0.0005
		rotate_x(-0.0005)
		#print(time*(180/3.14159))
