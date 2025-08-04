extends RayCast3D

var vision: String = ""

func _process(delta: float) -> void:
	if is_colliding():
		var hitObj = get_collider()
		#checks if object has method, then executes that method if the interact key is pressed. Sometimes it might not need interaciton to work.
		if hitObj.has_method("interact") && Input.is_action_just_pressed("interact"):
			hitObj.interact()
		if hitObj.has_method("pickup") && Input.is_action_just_pressed("interact"):
			hitObj.pickup(hitObj.item3d_name)
		if hitObj.has_method("raycast_see"):
			vision = hitObj.raycast_see()
	#resets vision so that raycast_see will not allow the tooltip to appear.
	else:
		vision = ""
