extends Area2D

@export var bullet_scene: PackedScene
@export var fire_rate := 0.5  # saniyede bir mermi

var enemies_in_range = []
var fire_timer := 0.0

func _process(delta):
	fire_timer -= delta
	if fire_timer <= 0 and enemies_in_range.size() > 0:
		var enemy = enemies_in_range[0]
		if is_instance_valid(enemy):
			shoot(enemy)
			fire_timer = fire_rate
		else:
			enemies_in_range.erase(enemy)  # geçersizse sil

func shoot(enemy):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.direction = (enemy.global_position - global_position).normalized()
	get_tree().current_scene.add_child(bullet)

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Enemies") and !enemies_in_range.has(area):
		enemies_in_range.append(area)

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if enemies_in_range.has(area):
		enemies_in_range.erase(area)
