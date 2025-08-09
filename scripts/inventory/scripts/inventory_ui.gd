extends Control

@onready var inventory: Inventory = preload("res://scripts/inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var is_open: bool = false

func _ready():
	inventory.update.connect(update_slots)
	update_slots()
	close()

func update_slots():
	for i in range(min(inventory.inventory_slots.size(), slots.size())):
		slots[i].update(inventory.inventory_slots[i])
		inventory.inventory_slots[i].slot_number = i

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()
	if Input.is_action_just_pressed("escape_menu"):
		if is_open:
			close()

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
	
