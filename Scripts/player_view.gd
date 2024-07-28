extends Node

@onready var tile_map = $TileMap
var player = preload("res://Scenes/wanderer.tscn")

@export var level_name: String
@export var should_be_instanced = false

var config: LevelConfigValue
var ref

var found_items: Array
signal item_found(item_name)
signal room_changed(room_name)

func _ready():
	if should_be_instanced:
		self.queue_free()
		return
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
			# Check this on init in case scene re-instanced
			if !found_items || found_items.find(item) == -1:
				item_found.emit(item)

func _process(delta):
	if Input.is_action_just_pressed("debug"):
		if level_name == "cloud":
			changing_room(null, "hub")
			return
		changing_room(null, "cloud")


func changing_room(target_tile, name = null):
	# heh
	print("Welcome to the Changing Room")
	if name:
		room_changed.emit(name)
		return
	
	# may as well skip this if there's only one destination
	if config.transition_rects.size() == 1:
		room_changed.emit(config.transition_rects.front().destination)
		return
	
	for transition_rect in config.transition_rects:
		if !transition_rect.rect.has_point(target_tile): continue
		room_changed.emit(transition_rect.destination)


func _on_item_discovered(item_name):
	if found_items.find(item_name) > -1: return
	found_items += [item_name]
	item_found.emit(item_name)


func _on_back_detector_entered(body):
	if body is player:
		ref.z_index = -1


func _on_back_detector_exited(body):
	if body is player:
		ref.z_index = 1
