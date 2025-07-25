extends StaticBody3D

#var toggle = false
var interactable = true

@export var oven: Node3D

func interact():
	if interactable == true:
		interactable = false
		oven.animate()
		await get_tree().create_timer(0.5, false).timeout
		interactable = true
