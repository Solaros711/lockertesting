class_name Inventory extends Resource

@export var inventory_slots: Array[InventorySlot]
var is_full: bool = false

signal update

func AddItem(new_item: Item, quantity: int):
	for i in inventory_slots.size():
		if inventory_slots[i].item != new_item:
			if inventory_slots[i].item == null:
				inventory_slots[i].item = new_item
				inventory_slots[i].stack = quantity
				is_full = false
				break
			else:
				print("oops all full")
				is_full = true
				break
		else:
			inventory_slots[i].stack += quantity
			is_full = false
			break
	update.emit()
	return is_full
