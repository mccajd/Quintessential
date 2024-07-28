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
	rtn.world_items = []
	rtn.item_mappings = {}
	
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
	rtn.default_items = ["quicksilver", "salt", "sulfur"] + ["wine", "barrel1", "barrel2", "sea_creature", "anchor", "coral"]
	rtn.world_items = ["seawater", "wine", "barrel1", "barrel2", "sea_creature", "anchor", "coral"]
	rtn.item_mappings = {
		"seawater": { "item": "seawater", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
		# TODO.jmc - actually add these.
		"wine": { "item": "wine", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
		"barrel1": { "item": "barrel", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
		"barrel2": { "item": "barrel", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
		"sea_creature": { "item": "sea_creature", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
		"anchor": { "item": "anchor", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
		"coral": { "item": "coral", "rect": Rect2(Vector2(7, 13), Vector2(4, 3)) },
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
	]
	
	rtn.bgm = "title"

	return rtn
