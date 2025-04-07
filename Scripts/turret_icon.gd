extends TextureRect

@export var tower_scene: PackedScene

func get_drag_data(position):
	var drag_data = {"tower": tower_scene}

	var preview = TextureRect.new()
	preview.texture = texture
	preview.custom_minimum_size = Vector2(64, 64)
	set_drag_preview(preview)
	print("Draggingg")
	return drag_data
