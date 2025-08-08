extends PanelContainer

@export var tooltip: RichTextLabel
@export var item_panel: Panel

const OFFSET: Vector2 = Vector2.ONE * 10
const Z_LAYER: int = 100

func _ready() -> void:
	close()
	tooltip.bbcode_enabled = true

func _input(event: InputEvent) -> void:
	if visible and event is InputEventMouseMotion:
		global_position = get_global_mouse_position() + OFFSET

func toggle(is_hover: bool):
	if is_hover && item_panel.item_visual.visible:
		tooltip.add_text(tooltip_text_ready(item_panel.cur_item))
		z_index = Z_LAYER
		open()
	else:
		close()
		tooltip.clear()
		
func open():
	visible = true

func close():
	visible = false

func tooltip_text_ready(item: Item):
	#var text: String = "[b]"+item.item_name+"[/b]\n[i]"+item.item_info+"[/i]"
	var text: String = item.item_name+"\n"+item.item_info
	return text
