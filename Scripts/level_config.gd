class_name LevelConfig


static func get_for(level_name: String):
	match level_name:
		"cloud":
			return _get_for_cloud_level()


static func _get_for_cloud_level():
	var rtn = LevelConfigValue.new()
	
	rtn.camera_limit_left = 100
	rtn.camera_limit_right = 1344
	rtn.camera_limit_top = -200
	rtn.camera_limit_bottom = -200

	rtn.default_items = ["quicksilver", "salt", "sulfur"]
	rtn.world_items = ["cloud_bud1", "cloud_bud2", "cloud_tree", "crystal_fountain", "fruit"]
	rtn.item_mappings = {
		"cloud_bud1": { "item": "cloud_bud", "rect": Rect2(Vector2(38, 14), Vector2(42, 12)) },
		"cloud_bud2": { "item": "cloud_bud", "rect": Rect2(Vector2(0, 0), Vector2(0, 0)) },
		"cloud_tree": { "item": "cloud_tree", "rect": Rect2(Vector2(0, 0), Vector2(0, 0)) },
		"crystal_fountain": { "item": "crystal_fountain", "rect": Rect2(Vector2(15, 20), Vector2(20, 17)) },
		"fruit": { "item": "fruit", "rect": Rect2(Vector2(0, 0), Vector2(0, 0)) },
	}
	
	return rtn
