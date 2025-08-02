extends RayCast3D

@export var hover_text: Control

var vision: String = ""
var see: bool = false

func _process(delta: float) -> void:
	if is_colliding():
		var hitObj = get_collider()
		if hitObj.has_method("interact") && Input.is_action_just_pressed("interact"):
			hitObj.interact()
		if hitObj.has_method("pickup") && Input.is_action_just_pressed("interact"):
			hitObj.pickup()
		if hitObj.has_method("raycast_see"):
			vision = hitObj.raycast_see()
			if vision != "":
				print(vision)
	else:
		vision = ""
		print("changing text back to blank")
		see = false
