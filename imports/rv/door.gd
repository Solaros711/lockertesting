extends StaticBody3D

var toggle = false
var interactable = true

@export var animation_player: AnimationPlayer

func interact():
	if interactable == true:
		print(interactable)
		interactable = false
		toggle = !toggle
		if toggle == false:
			animation_player.play("outer_door_open")
		if toggle == true:
			animation_player.play("outer_door_close")
		await get_tree().create_timer(0.5, false).timeout
		interactable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
