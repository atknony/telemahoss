extends Panel

var is_occupied = false

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not is_occupied and get_parent().get_parent().money >= 2000:
		var turret_scene = get_parent().get_parent().selected_turret_scene
		if turret_scene:
			var turret = turret_scene.instantiate()
			turret.position = position
			turret.position.x += 33
			turret.position.y += 33
			get_tree().current_scene.add_child(turret)
			get_parent().get_parent().money -= 2000
			is_occupied = true
			get_parent().get_parent().selected_turret_scene = null
