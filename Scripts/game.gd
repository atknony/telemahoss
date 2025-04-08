extends Node2D

@export var level_2_turret : PackedScene
@export var enemy_scene : PackedScene

@onready var turret1 = $Turret1
@onready var turret2 = $Turret2
@onready var wave_started = true
@onready var label = $Label
@onready var money = 50

func _process(delta: float) -> void:
	label.text = str(money)
	if Input.is_action_pressed("Upgrade1"):
		upgrade_turret(turret1)
	elif Input.is_action_pressed("Upgrade2"):
		upgrade_turret(turret2)

func enemy_spawn() -> void:
	if wave_started:
		var enemy = enemy_scene.instantiate()
		add_child(enemy)
		enemy.position = Vector2(0,358)

func upgrade_turret(turret_scene):
	var level2_turret = level_2_turret.instantiate()
	level2_turret.position = turret_scene.position
	remove_child(turret_scene)
	add_child(level2_turret)
