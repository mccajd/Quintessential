extends Node

@onready var tile_map = $TileMap
var wanderer = preload("res://Scenes/wanderer.tscn")

@export var level_name: String
@export var should_be_instanced = false

var config: LevelConfigValue
var ref

var wanderer_spawn_point_index = 0

var found_items: Array
signal item_found(item_name)
signal room_changed(room_name)

var available_areas

func _ready():
	if should_be_instanced:
		self.queue_free()
		return

	config = LevelConfig.get_for(level_name)
	$TileMap.visible = false
	$TileMap.set_from_config(config, available_areas)
	
	var new_wanderer = wanderer.instantiate()
	new_wanderer.change_room.connect(changing_room)
	new_wanderer.set_camera_limit(config.camera_limit_left, config.camera_limit_right, config.camera_limit_top, config.camera_limit_bottom)
	ref = new_wanderer
	add_child(new_wanderer)
	
	# HACK.jmc - this is a bit fragile/hacky but i'm lazy and somewhat pressed for time
	#		when this class is instanced, we can set the spawn point index
	#		and subsequently use that to set the spawn point of the wanderer.
	var spawn_points = tile_map.get_used_cells_by_id(tile_map.LAYERS.MISC,3,Vector2i(3,0))
	if wanderer_spawn_point_index > spawn_points.size():
		wanderer_spawn_point_index = 0
	new_wanderer.global_position = tile_map.map_to_local(spawn_points[wanderer_spawn_point_index])
	new_wanderer.default_spawn = tile_map.map_to_local(spawn_points[0])
	
	if config.default_items:
		for item in config.default_items:
			# Check this on init in case scene re-instanced
			if !found_items || found_items.find(item) == -1:
				item_found.emit(item)
	
	if level_name == "hub":
		_set_doors()
	# this has awaits so lets make sure it's last
	_play_transition_in()

func _process(_delta):
	pass


func changing_room(target_tile, room = null):
	# heh
	print("Welcome to the Changing Room")
	if room:
		_change_room(room)
		return
	
	# may as well skip this if there's only one destination
	if config.transition_rects.size() == 1:
		_change_room(config.transition_rects.front().destination)
		return
	
	for transition_rect in config.transition_rects:
		if !transition_rect.rect.has_point(target_tile): continue
		_change_room(transition_rect.destination)


func set_spawn_point(source_room):
	match source_room:
		"ocean":
			wanderer_spawn_point_index = 1
		"desert":
			wanderer_spawn_point_index = 2
		"cave":
			wanderer_spawn_point_index = 3
		"cloud":
			wanderer_spawn_point_index = 4
		_:
			wanderer_spawn_point_index = 0
			return


func send_to_hub():
	ref.force_room_change()


func _on_item_discovered(item_name):
	if found_items.find(item_name) > -1: return
	found_items += [item_name]
	item_found.emit(item_name)


func _on_front_detector_entered(body):
	if body is player:
		ref.z_index = 2


func _on_front_detector_exited(body):
	if body is player:
		ref.z_index = 0


func _on_back_detector_entered(body):
	if body is player:
		ref.z_index = -1


func _on_back_detector_exited(body):
	if body is player:
		ref.z_index = 0


func _change_room(room_name):
	room_changed.emit(room_name)
	_play_transition_out()

func _play_transition_out():
	var screen: ColorRect = get_node("Transition")
	if !screen: return
	
	var stages = 8
	screen.modulate.a = 0
	screen.visible = true
	
	# fade out
	for i in stages:
		screen.modulate.a += 0.125
		await get_tree().create_timer(0.1).timeout


func _play_transition_in():
	var screen: ColorRect = get_node("Transition")
	if !screen: return
	
	var stages = 8
	screen.modulate.a = 1
	screen.visible = true
	
	# fade in
	for i in stages:
		screen.modulate.a -= 0.125
		await get_tree().create_timer(0.1).timeout
		
	screen.visible = false


func _set_doors():
	get_node("Quintessence").visible = available_areas.has("endgame")
	
	get_node("EndgameDoor").visible = !available_areas.has("endgame")
	get_node("OceanDoor").visible = !available_areas.has("ocean")
	get_node("DesertDoor").visible = !available_areas.has("desert")
	get_node("CaveDoor").visible = !available_areas.has("cave")
	get_node("CloudDoor").visible = !available_areas.has("cloud")
