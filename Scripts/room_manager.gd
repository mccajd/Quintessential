extends Node
class_name RoomManager

var current_room: String
var viewport: SubViewport

var instance_ref

var room_items: Dictionary
@export var hub_available_areas: Array

signal world_item_found
signal beacon_puzzle_changed(puzzle_name)

func _ready():
	viewport = get_node("/root/Main/PlayerView/SubViewport")
	for child in viewport.get_children():
		if "room_changed" in child && typeof(child.room_changed) == TYPE_SIGNAL:
			child.room_changed.connect(_change_room)
		if child.level_name == "hub":
			child.available_areas = hub_available_areas


func _change_room(room: String):
	if instance_ref:
		# kill this room so silly things don't happen
		instance_ref.set_process_input(false)
		instance_ref.set_process(false)
		instance_ref.set_physics_process(false)
	# wait for transition anim		
	await get_tree().create_timer(0.8).timeout
	
	if room == "endgame":
		Controller.show_secret = true
		Controller.goto_scene(MainMenu.win_screen)
		return
	
	var source_room = current_room
	current_room = room
	beacon_puzzle_changed.emit(current_room)
	
	var scene = load(_get_room_scene())
	var instance = scene.instantiate()
	instance.level_name = room
	instance.item_found.connect(_on_item_found)
	instance.set_spawn_point(source_room)

	if room_items.has(current_room):
		instance.found_items = room_items[current_room]
	
	if "room_changed" in instance && typeof(instance.room_changed) == TYPE_SIGNAL:
			instance.room_changed.connect(_change_room)
	
	if room == "hub":
		instance.available_areas = hub_available_areas
	
	for child in viewport.get_children():
		child.queue_free()
	viewport.add_child(instance)
	instance_ref = instance
	
	get_node("/root/Main/AudioStreamPlayer").set_bgm(LevelConfig.get_for(current_room).bgm)


func _get_room_scene():
	match current_room:
		"ocean":
			return "res://Levels/ocean_room.tscn"
		"desert":
			return "res://Levels/desert_room.tscn"
		"cave":
			return "res://Levels/cave_room.tscn"
		"cloud":
			return "res://Levels/cloud_room.tscn"
		_:
			return "res://Levels/hub_room.tscn"


func _on_item_found(local_item_key):
	var value = [local_item_key]
	if room_items.has(current_room):
		value += room_items[current_room]
	room_items[current_room] = value
	
	var mappings = LevelConfig.get_for(current_room).item_mappings
	world_item_found.emit(mappings[local_item_key].item if mappings.has(local_item_key) else local_item_key)


func _set_hub_areas(areas):
	hub_available_areas = areas
	instance_ref.send_to_hub()
