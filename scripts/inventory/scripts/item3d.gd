class_name Item3d extends RigidBody3D

const ITEM_PICKUP_TEXT = "\nPress E to pick up"

var item3d_name: String = ""
var interactable: bool = true
var quantity = 1

#Tells the player to pick up the item3d into their inventory. 
#If the check is false, it returns false, otherwise it will return true and clear out the item3d from memory.
func pickup(item_name: String):
	var check_if_full: int = get_node("/root/World/Player").add_item_to_inv(item_name, quantity)
	if check_if_full != 0:
		return false
	else:
		find_parent("Item").get_parent().queue_free()
		return true

#returns a string message so the hover tooltip shows up with applicable text.
func raycast_see():
	return item3d_name + ITEM_PICKUP_TEXT
