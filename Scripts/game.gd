extends Node2D

@export var level_2_turret : PackedScene
@export var enemy_scene : PackedScene

@onready var wave_level = 0
@onready var Wave = $Wave
@onready var turret1 = $Turret1
@onready var turret2 = $Turret2
@onready var wave_started = false
@onready var label = $Balance
@onready var money = 10000

func _process(delta: float) -> void:
	label.text = "Balance: " + str(money)
	Wave.text = "Wave: " + str(wave_level)
	if Input.is_action_just_pressed("Upgrade1"):
		if money >= 1000:
			money -= 1000
			upgrade_turret(turret1)
	elif Input.is_action_just_pressed("Upgrade2"):
		if money >= 1000:
			money -= 1000
			upgrade_turret(turret2)
	elif Input.is_action_just_pressed("NextWave") && wave_started == false:
		wave_started = true
		wave_level += 1
		for i in range(1,wave_level * 3):
			enemy_spawn()
			await get_tree().create_timer(0.4).timeout
			if i == (wave_level * 3 - 1):
				wave_started = false

func enemy_spawn() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.health = wave_level * 1.1
	enemy.position = Vector2(0,358)

func upgrade_turret(turret_scene):
	turret_scene.fire_rate /= 1.1
