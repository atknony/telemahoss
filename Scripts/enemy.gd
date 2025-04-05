extends CharacterBody2D

@onready var front = $Front
@onready var left = $Left
@onready var right = $Right

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation - PI / 2)
	position += direction * 1
	move_and_slide()

func _physics_process(delta):
	if front.get_collider() is StaticBody2D:
		if left.get_collider() is not StaticBody2D:
			rotation -= PI / 2
		elif right.get_collider() is not StaticBody2D:
			rotation += PI / 2 
