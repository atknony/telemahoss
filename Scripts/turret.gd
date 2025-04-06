extends Area2D

@export var bullet_scene : PackedScene
@onready var direction : Vector2
@onready var timer = $Timer

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Enemies"):
		direction = area.position - position
		shoot(direction)

func shoot(direction: Vector2):
	var bullet = bullet_scene.instantiate()
	timer.start(2) 


func _on_timer_timeout(bullet) -> void:
	add_child(bullet)
