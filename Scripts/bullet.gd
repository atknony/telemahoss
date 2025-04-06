extends Area2D

func _ready() -> void:
	add_to_group("Bullets")

func _process(delta: float) -> void:
	position.x += 1
