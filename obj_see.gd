extends Control

@export var ray: RayCast3D
@export var object_info_text: TextEdit

var is_looking: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray.vision != "":
		object_info_text.text = ray.vision
		open()
	else:
		object_info_text.text = ""
		close()
	print(visible)

func open():
	visible = true
	is_looking = true

func close():
	visible = false
	is_looking = false
	
