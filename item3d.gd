class_name Item3d extends StaticBody3D

const ITEM_PICKUP_TEXT = "\nPress [E] to pick up"

var item3d_name: String = ""
var item_vis: String = ""
var interactable: bool = true

func pickup(item_name: String):
	var check_if_full: bool = get_node("/root/World/Player").add_item_to_inv(item_name, 1)
	if check_if_full:
		return false
	else:
		find_parent("Item").get_parent().queue_free()

func raycast_see():
	return item_vis + ITEM_PICKUP_TEXT
