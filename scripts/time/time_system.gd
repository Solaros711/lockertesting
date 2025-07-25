class_name TimeSystem extends Node

@export var date_time: DateTime
#number of ticks per second. Increasing the number speeds up time, decreasing the number slows it down
@export var ticks_per_second: int = 6

#updates DateTime variable
func _process(delta: float) -> void:
	date_time.increase_by_sec(delta * ticks_per_second)
