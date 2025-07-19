extends StaticBody3D

var toggle = true
var interactable = true

@export var animation_player: AnimationPlayer
@export var animation_tree: AnimationTree

func interact():
	if interactable == true:
		interactable = false
		toggle = !toggle
		if toggle == false:
			#animation_player.play("top_door_open")
			animation_tree.set("Parameters/Top_Door/BlendPosition", 0.1)
			print("opening door!")
		if toggle == true:
			#animation_player.play("top_door_close")
			animation_tree.set("Parameters/Top_Door/BlendPosition", -0.1)
			print("closing door!")
		await get_tree().create_timer(0.5, false).timeout
		interactable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
