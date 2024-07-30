class_name LevelConfig


static func get_for(level_name: String):
	match level_name:
		"hub":
			return _get_for_hub_level()
		"ocean":
			return _get_for_ocean_level()
		"desert":
			return _get_for_desert_level()
		"cave":
			return _get_for_cave_level()
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
	
	rtn.transition_rects = [
		LevelConfigTransitionRect.new("hub", Rect2(Vector2(0, 0), Vector2(1000, 1000)))
	]
	
	rtn.bgm = "waltz"
	
	return rtn


static func _get_for_cave_level():
	var rtn = LevelConfigValue.new()
	
	rtn.camera_limit_left = 100
	rtn.camera_limit_right = 1344
	rtn.camera_limit_top = -200
	rtn.camera_limit_bottom = -200

	rtn.default_items = ["quicksilver", "salt", "sulfur"]
	rtn.world_items = []
	rtn.item_mappings = {}
	
	rtn.transition_rects = [
		LevelConfigTransitionRect.new("hub", Rect2(Vector2(0, 0), Vector2(1000, 1000)))
	]
	
	rtn.bgm = "waltz"
	
	return rtn


static func _get_for_desert_level():
	var rtn = LevelConfigValue.new()
	
	rtn.camera_limit_left = 100
	rtn.camera_limit_right = 1344
	rtn.camera_limit_top = -200
	rtn.camera_limit_bottom = -200

	rtn.default_items = ["quicksilver", "salt", "sulfur"]
	rtn.world_items = ["meat_sack", "cacti", "bones", "frankincense", "myrrh", "gold"]
	rtn.item_mappings = {
		"meat_sack": { "item": "meat_sack", "rect": Rect2(Vector2(29, 13), Vector2(2, 3)) },
		"cacti": { "item": "cacti", "rect": Rect2(Vector2(38, 12), Vector2(3, 5)) },
		"bones": { "item": "bones", "rect": Rect2(Vector2(33, 14), Vector2(2, 2)) },
		"frankincense": { "item": "frankincense", "rect": Rect2(Vector2(41, 18), Vector2(2, 2)) },
		"myrrh": { "item": "myrrh", "rect": Rect2(Vector2(43, 13), Vector2(2, 2)) },
		"gold": { "item": "gold", "rect": Rect2(Vector2(34, 18), Vector2(1, 1)) },
	}
	
	rtn.transition_rects = [
		LevelConfigTransitionRect.new("hub", Rect2(Vector2(0, 0), Vector2(1000, 1000)))
	]
	
	rtn.bgm = "waltz"
	
	return rtn


static func _get_for_ocean_level():
	var rtn = LevelConfigValue.new()
	
	rtn.camera_limit_left = 100
	rtn.camera_limit_right = 1344
	rtn.camera_limit_top = -200
	rtn.camera_limit_bottom = -200

	# TODO.jmc - debug items. Remove them.
	rtn.default_items = ["quicksilver", "salt", "sulfur"]
	rtn.world_items = ["seawater", "wine", "barrel1", "barrel2", "sea_creature", "anchor", "coral"]
	rtn.item_mappings = {
		"seawater": { "item": "seawater", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
		"coral": { "item": "coral", "rect": Rect2(Vector2(26, 21), Vector2(5, 2)) },
		"barrel1": { "item": "barrel", "rect": Rect2(Vector2(21, 10), Vector2(3, 2)) },
		"barrel2": { "item": "barrel", "rect": Rect2(Vector2(51, 10), Vector2(5, 2)) },
		"wine": { "item": "wine", "rect": Rect2(Vector2(40, 19), Vector2(1, 2)) },
		"anchor": { "item": "anchor", "rect": Rect2(Vector2(73, 10), Vector2(3, 2)) },
		"sea_creature": { "item": "sea_creature", "rect": Rect2(Vector2(54, 18), Vector2(4, 4)) },
	}
	
	rtn.transition_rects = [
		LevelConfigTransitionRect.new("hub", Rect2(Vector2(0, 0), Vector2(1000, 1000)))
	]
	
	rtn.bgm = "waltz"
	
	return rtn


static func _get_for_hub_level():
	var rtn = LevelConfigValue.new()
	
	rtn.camera_limit_left = 60
	rtn.camera_limit_right = 1060
	rtn.camera_limit_top = -240
	rtn.camera_limit_bottom = -240
	
	rtn.transition_rects = [
		LevelConfigTransitionRect.new("ocean", Rect2(Vector2(7, 0), Vector2(5, 13))),
		LevelConfigTransitionRect.new("desert", Rect2(Vector2(15, -2), Vector2(5, 13))),
		LevelConfigTransitionRect.new("cave", Rect2(Vector2(35, -2), Vector2(5, 13))),
		LevelConfigTransitionRect.new("cloud", Rect2(Vector2(42, 0), Vector2(5, 13))),
		LevelConfigTransitionRect.new("endgame", Rect2(Vector2(22, -8), Vector2(10, 17))),
	]
	
	rtn.bgm = "title"

	return rtn
