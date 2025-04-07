extends Area2D

@onready var Right = $Right
@onready var Left = $Left
@onready var life = $Timer
@onready var health = 2

func _ready() -> void:
	add_to_group("Enemies")

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation - PI / 2)
	position += direction * 2

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if Right.is_colliding():
		rotation -= PI / 2
	elif Left.is_colliding():
		rotation += PI / 2


func _on_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if (area.is_in_group("Bullet")):
		health -= 1
		if health == 0:
			get_parent().money += 10
			queue_free()
