extends Panel

@onready var item_visual: Sprite2D = $Item_Display

func update(item: Item):
	if !item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = item.texture

func _ready() -> void:
	pass # Replace with function body.
