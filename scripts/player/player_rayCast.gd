extends RayCast3D

var vision: String = ""

func _process(delta: float) -> void:
	if is_colliding():
		var hit_object = get_collider()
		#checks if object has method, then executes that method if the interact key is pressed. Sometimes it might not need interaciton to work.
		if hit_object.has_method("interact") && Input.is_action_just_pressed("interact"):
			hit_object.interact()
		if hit_object.has_method("pickup") && Input.is_action_just_pressed("interact"):
			hit_object.pickup(hit_object.item3d_name)
		if hit_object.has_method("raycast_see"):
			vision = hit_object.raycast_see()
		else:
			vision = ""
