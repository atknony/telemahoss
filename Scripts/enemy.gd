extends CharacterBody2D

@onready var ray = $RayCast2D

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation - 90)
	position += direction * 1
	move_and_slide()


func _physics_process(delta):
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider is StaticBody2D:
			rotation += 90
