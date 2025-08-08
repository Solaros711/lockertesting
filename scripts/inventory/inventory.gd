class_name Inventory extends Resource

@export var inventory_slots: Array[InventorySlot]
var is_full: bool = false

signal update

func AddItem(new_item: Item, quantity: int):
	#Loops through inventory size
	for i in inventory_slots.size():
		#checks to see if inventory does not contain target item
		if inventory_slots[i].item != new_item:
			#If there is an empty slot, put the target item in that slot and add its quantity
			if inventory_slots[i].item == null:
				inventory_slots[i].item = new_item
				inventory_slots[i].stack = quantity
				is_full = false
				break
			#If there are no empty slots to input the item, return true.
			else:
				print("oops all full")
				is_full = true
				break
		#If it does contain target item, it will incriment it by quantity
		else:
			inventory_slots[i].stack += quantity
			is_full = false
			break
	update.emit()
	return is_full
