extends Control

var is_open: bool = false
var is_menu_open: bool = false

func _ready():
	close()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape_menu"):
		if is_menu_open:
			is_menu_open = !is_menu_open
		else:
			if is_open:
				close()
			else:
				open()
	if Input.is_action_just_pressed("inventory"):
		is_menu_open = !is_menu_open

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
	
