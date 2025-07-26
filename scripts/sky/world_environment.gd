extends WorldEnvironment
var world_sky_material = environment.sky.sky_material

const SKY_DAY_TOPCOLOR = Color(0.2509,0.4705,0.9529,1.0)
const SKY_DAY_HORCOLOR = Color(0.7686,0.7764,0.7882,1.0)
const SKY_NIGHT_TOPCOLOR = Color(0.0745,0.1490,0.4431,1.0)
const SKY_NIGHT_HORCOLOR = Color(0.1215,0.1372,0.1215,1.0)
const SKY_COLOR_ADJUST: float = 0.00002
var cur_top_color = Color()
var cur_hor_color = Color()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func do_sky_color_change(time: DateTime):
	cur_top_color = world_sky_material.sky_top_color
	cur_hor_color = world_sky_material.sky_horizon_color
	if(time.daytime):
		if(cur_top_color.r < SKY_DAY_TOPCOLOR.r):
			cur_top_color.r += SKY_COLOR_ADJUST
		if(cur_top_color.g < SKY_DAY_TOPCOLOR.g):
			cur_top_color.g += SKY_COLOR_ADJUST
		if(cur_top_color.b < SKY_DAY_TOPCOLOR.b):
			cur_top_color.b += SKY_COLOR_ADJUST
		if(cur_hor_color.r < SKY_DAY_HORCOLOR.r):
			cur_hor_color.r += SKY_COLOR_ADJUST
		if(cur_hor_color.g < SKY_DAY_HORCOLOR.g):
			cur_hor_color.g += SKY_COLOR_ADJUST
		if(cur_hor_color.b < SKY_DAY_HORCOLOR.b):
			cur_hor_color.b += SKY_COLOR_ADJUST
	else:
		if(cur_top_color.r > SKY_NIGHT_TOPCOLOR.r):
			cur_top_color.r -= SKY_COLOR_ADJUST
		if(cur_top_color.g > SKY_NIGHT_TOPCOLOR.g):
			cur_top_color.g -= SKY_COLOR_ADJUST
		if(cur_top_color.b > SKY_NIGHT_TOPCOLOR.b):
			cur_top_color.b -= SKY_COLOR_ADJUST
		if(cur_hor_color.r > SKY_NIGHT_HORCOLOR.r):
			cur_hor_color.r -= SKY_COLOR_ADJUST
		if(cur_hor_color.g > SKY_NIGHT_HORCOLOR.g):
			cur_hor_color.g -= SKY_COLOR_ADJUST
		if(cur_hor_color.b > SKY_NIGHT_HORCOLOR.b):
			cur_hor_color.b -= SKY_COLOR_ADJUST
	world_sky_material.sky_top_color = cur_top_color
	world_sky_material.sky_horizon_color = cur_hor_color
