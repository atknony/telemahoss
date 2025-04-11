extends Area2D

@export var bullet_scene: PackedScene
@export var fire_rate := 0.5

var enemies_in_range: Array[Area2D] = []
var fire_timer := 0.0
@onready var Turret = $"."

func _process(delta):
	fire_timer -= delta
	var target = get_closest_enemy()

	if fire_timer <= 0 and target:
		shoot(target)
		fire_timer = fire_rate
	if target:
		rotation = (target.global_position - global_position).angle() + PI / 2

func get_closest_enemy() -> Area2D:
	var closest: Area2D = null
	var min_distance = INF

	for enemy in enemies_in_range:
		if is_instance_valid(enemy):
			var dist = global_position.distance_to(enemy.global_position)
			if dist < min_distance:
				min_distance = dist
				closest = enemy
	return closest

func shoot(enemy):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = position
	bullet.direction = (enemy.global_position - global_position).normalized()
	get_tree().current_scene.add_child(bullet)

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Enemies") and !enemies_in_range.has(area):
		enemies_in_range.append(area)

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Enemies"):
		enemies_in_range.erase(area)

func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_parent().upgrade_turret(Turret)
		get_parent().money -= 500
