extends Control

func can_drop_data(position, data):
	return data is Dictionary and data.has("tower")

func drop_data(position, data):
	var turret_scene = data["tower"] as PackedScene
	var turret = turret_scene.instantiate()
	turret.position = get_global_mouse_position()
	get_tree().current_scene.add_child(turret)
