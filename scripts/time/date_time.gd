class_name DateTime extends Resource

@export_range(0,59) var seconds = 0
@export_range(0,59) var minutes = 0
@export_range(0,23) var hours = 0
@export var days = 0

func increase_by_sec(delta_seconds: float) -> void:
	pass
