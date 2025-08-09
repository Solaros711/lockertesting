class_name Inventory extends Resource

#TODO Make inventory system modular, so when the player adds a backpack to their inventory, they can add more slots to it.
@export var inventory_slots: Array[InventorySlot]
var is_full: int = 0

signal update

#TODO Add max_stack support for items when itemstack is full.

func AddItem(new_item: Item, quantity: int):
	#Loops through inventory size
	#Checks to see if there are any existing slots that contain the target item
	var item_slots = inventory_slots.filter(func(slot): return slot.item == new_item)
	if not item_slots.is_empty():
		item_slots[0].stack += quantity
		is_full = 0
		if item_slots[0].stack > item_slots[0].item.max_stack:
			is_full = AddItem(new_item, (item_slots[0].stack-item_slots[0].item.max_stack))
	else:
		#Checks for an empty slots to put target item in. If there are none, is_full is set to quantity
		var emptyslots = inventory_slots.filter(func(slot): print(slot); return slot.item == null)
		if not emptyslots.is_empty():
			emptyslots[0].item = new_item
			emptyslots[0].stack = quantity
			is_full = 0
		else:
			is_full = quantity
		
	update.emit()
	return is_full

func RemoveItem(target: int, quantity: int):
	var item_name: String = inventory_slots[target].item.item_name
	if inventory_slots[target].stack == 1 or inventory_slots[target].stack-quantity <= 0:
		inventory_slots[target].item = null
		inventory_slots[target].stack = 0
	else:
		inventory_slots[target].stack -= quantity
	update.emit()
	return item_name
