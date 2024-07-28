class_name LevelConfig


static func get_for(level_name: String):
	match level_name:
		"hub":
			return _get_for_hub_level()
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
		"cloud_bud1": { "item": "cloud_bud", "rect": Rect2(Vector2(38, 12), Vector2(4, 3)) },
		"cloud_bud2": { "item": "cloud_bud", "rect": Rect2(Vector2(50, 18), Vector2(3, 2)) },
		"cloud_tree": { "item": "cloud_tree", "rect": Rect2(Vector2(64, 11), Vector2(8, 3)) },
		"crystal_fountain": { "item": "crystal_fountain", "rect": Rect2(Vector2(15, 17), Vector2(5, 3)) },
		"fruit": { "item": "fruit", "rect": Rect2(Vector2(79, 17), Vector2(2, 2)) },
	}
	
	return rtn

static func _get_for_hub_level():
	var rtn = LevelConfigValue.new()
	
	rtn.camera_limit_left = null
	rtn.camera_limit_right = null
	rtn.camera_limit_top = null
	rtn.camera_limit_bottom = null

	return rtn
