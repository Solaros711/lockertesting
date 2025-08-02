class_name Inventory extends Resource

@export var inventory_slots: Array[InventorySlot]

signal update

func AddItem(new_item: Item, quantity: int):
	for i in inventory_slots.size():
		if inventory_slots[i].item != new_item:
			if inventory_slots[i].item == null:
				inventory_slots[i].item = new_item
				inventory_slots[i].stack = quantity
				break
			else:
				print("oops all full")
		else:
			inventory_slots[i].stack += quantity
			break
				
	#var itemslots = inventory_slots.filter(func(slot): return slot.item == new_item)
	#print(itemslots)
	#if not itemslots.is_empty():
	#	itemslots[0].stack += quantity
	#else:
		#var emptyslots = itemslots.filter(func(slot): return slot.item == null)
		#print(emptyslots.is_empty())
		#if not emptyslots.is_empty():
			#emptyslots[0].item = new_item
			#emptyslots[0].stack = quantity
	update.emit()
