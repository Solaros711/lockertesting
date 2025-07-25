extends StaticBody3D

var toggle = true
var interactable = true

@export var animation_player: AnimationPlayer

func interact():
	if interactable == true:
		interactable = false
		toggle = !toggle
		if toggle == false:
			animation_player.play("outer_door_open")
			print("opening door!")
		if toggle == true:
			animation_player.play("outer_door_close")
			print("closing door!")
		await get_tree().create_timer(0.5, false).timeout
		interactable = true
