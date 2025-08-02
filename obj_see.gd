extends Control

@export var ray: RayCast3D
@export var object_info_text: TextEdit

var in_menu: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray.vision != "" && in_menu != true:
		object_info_text.text = ray.vision
		open()
	else:
		object_info_text.text = ""
		close()
	if Input.is_action_just_pressed("escape_menu") || Input.is_action_just_pressed("inventory"):
		in_menu = !in_menu

func open():
	visible = true

func close():
	visible = false
	
