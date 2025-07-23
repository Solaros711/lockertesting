extends StaticBody3D

#var toggle = false
var interactable = true

@export var animation_player: AnimationPlayer
#@onready var oven = $oven.door_state

func interact():
	if interactable == true:
		interactable = false
		#print(oven)
		$oven.set_door_status(!$oven.get_door_status())
		if $oven.get_door_status() == false:
			animation_player.play("open")
			print("opening door!")
		if $oven.get_door_status() == true:
			animation_player.play("close")
			print("closing door!")
		await get_tree().create_timer(0.5, false).timeout
		interactable = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
