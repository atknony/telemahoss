extends Node2D

@export var enemy_scene : PackedScene
var selected_turret_scene: PackedScene = null


@onready var label = $Balance
@onready var Wave = $Wave
@onready var base = $Base


@onready var wave_started = false

@onready var wave_level = 0
@onready var money = 15000
@onready var base_health = 2500

func _ready() -> void:
	base.add_to_group("Base")

func _process(delta: float) -> void:
	label.text = "Balance: " + str(money)
	Wave.text = "Wave: " + str(wave_level)

func enemy_spawn() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(0,358)
	enemy.health += wave_level ** 2

func upgrade_turret(turret_scene):
	turret_scene.fire_rate /= 1.1

func _on_base_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Enemies"):
		base_health -= 1
		if base_health <= 0:
			stop_all()

func stop_all():
	get_tree().paused = true

func select_turret(scene: PackedScene):
	selected_turret_scene = scene


func _on_next_wave_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and  !wave_started:
		wave_started = true
		wave_level += 1
		for i in range(1,wave_level * 7):
			enemy_spawn()
			await get_tree().create_timer(0.4).timeout
			if i == (wave_level * 7 - 1):
				wave_started = false
