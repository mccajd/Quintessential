extends Node

@onready var tile_map = $TileMap
var player = preload("res://Scenes/wanderer.tscn")

@export var level_name: String = "hub"

var config: LevelConfigValue
var ref

var found_items: Array
signal item_found(item_name)

func _ready():
	$TileMap.visible = false
	config = LevelConfig.get_for(level_name)
	
	var new_player = player.instantiate()
	new_player.change_room.connect(changing_room)
	new_player.set_camera_limit(config.camera_limit_left, config.camera_limit_right, config.camera_limit_top, config.camera_limit_bottom)
	ref = new_player
	add_child(new_player)
	new_player.global_position = tile_map.map_to_local(tile_map.get_used_cells_by_id(tile_map.LAYERS.MISC,3,Vector2i(3,0))[0])
	
	$TileMap.set_from_config(config)
	if config.default_items:
		for item in config.default_items:
			item_found.emit(item)

func _process(delta):
	pass
	
# TODO.hmw have the player view handle the room swapping, perhaps have 
# a neat, little fade in/fade out of black to hide the transition.
# You could even have a canned walking animation down a hall that
# pops up and player
func changing_room(room : String, start_pos : Vector2i):
	print("Welcome to the Changing Room")
	print(room)
	print(start_pos)


func _on_item_discovered(item_name):
	if found_items.find(item_name) > -1: return
	found_items += [item_name]
	var entry = config.item_mappings[item_name]
	item_found.emit(entry.item)


func _on_front_detector_entered(body):
	if body is player:
		ref.z_index = 2


func _on_front_detector_exited(body):
	if body is player:
		ref.z_index = 0
