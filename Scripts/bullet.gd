extends Area2D

@export var speed := 400.0
var direction = Vector2.ZERO

func _ready() -> void:
	add_to_group("Bullet")

func _process(delta):
	position += direction * speed * delta * 2


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemies"):
		queue_free()
