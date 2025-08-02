extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/Item_Display
@onready var quantity: Label = $CenterContainer/Panel/Label

func update(slot: InventorySlot):
	if not slot.item:
		item_visual.visible = false
		quantity.visible = false
	else:
		print(slot.item)
		item_visual.texture = slot.item.texture
		item_visual.visible = true
		quantity.text = str(slot.stack)
		quantity.visible = true
