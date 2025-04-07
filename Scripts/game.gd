extends Node2D

@export var enemy_scene : PackedScene
@onready var wave_started = true
@onready var label = $Label
@onready var money = 50

func _process(delta: float) -> void:
	label.text = str(money)

func enemy_spawn() -> void:
	if wave_started:
		var enemy = enemy_scene.instantiate()
		add_child(enemy)
		enemy.position = Vector2(0,358)
