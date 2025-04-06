extends Node2D

@export var enemy_scene : PackedScene
@onready var wave_started = true

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enemy_spawn() -> void:
	if wave_started:
		var enemy = enemy_scene.instantiate()
		add_child(enemy)
		enemy.position = Vector2(0,358)
		print (" Anan doğdu")
