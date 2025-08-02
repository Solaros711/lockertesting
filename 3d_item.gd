class_name Item3d extends StaticBody3D

const ITEM_PICKUP_TEXT = "\nPress [E] to pick up"

var item3d_name: String = ""
var interactable: bool = true

func interact():
	if interactable == true:
		interactable = false
		await get_tree().create_timer(0.5, false).timeout
		interactable = true
		
func pickup():
	pass

func raycast_see():
	return item3d_name + ITEM_PICKUP_TEXT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
