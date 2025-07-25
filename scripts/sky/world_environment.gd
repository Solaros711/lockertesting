extends WorldEnvironment
var world_sky_material = environment.sky.sky_material
var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += 0.0005
	#print(time)
	var time_start = 0.0
	var time_end = 3.390
	#do_color_change()

func do_color_change() -> void:
	pass
