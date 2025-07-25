extends Node3D

var toggle = true

@export var animation_player: AnimationPlayer

func animate():
		toggle = !toggle
		if toggle == false:
			animation_player.play("open")
			print("opening door!")
		if toggle == true:
			animation_player.play("close")
			print("closing door!")
		
