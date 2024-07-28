extends Node
class_name RoomManager

var current_room: String
var viewport: SubViewport

var room_items: Dictionary
signal world_item_found

func _ready():
	viewport = get_node("/root/Main/PlayerView/SubViewport")
	for child in viewport.get_children():
		if "room_changed" in child && typeof(child.room_changed) == TYPE_SIGNAL:
			child.room_changed.connect(_change_room)


func _change_room(room: String):
	current_room = room
	
	var scene = load(_get_room_scene())
	var instance = scene.instantiate()
	instance.level_name = room
	instance.item_found.connect(_on_item_found)
	if room_items.has(current_room):
		instance.found_items = room_items[current_room]
	
	if "room_changed" in instance && typeof(instance.room_changed) == TYPE_SIGNAL:
			instance.room_changed.connect(_change_room)
	
	for child in viewport.get_children():
		child.queue_free()
	viewport.add_child(instance)


func _get_room_scene():
	match current_room:
		"cloud":
			return "res://Levels/cloud_room.tscn"
		_:
			return "res://Levels/hub_room.tscn"

func _get_beacon_puzzle():
	match current_room:
		"cloud":
			return "BeaconPuzzle4"
		_:
			return null


func _on_item_found(local_item_key):
	var value = [local_item_key]
	if room_items.has(current_room):
		value += room_items[current_room]
	room_items[current_room] = value
	
	var mappings = LevelConfig.get_for(current_room).item_mappings
	world_item_found.emit(mappings[local_item_key].item if mappings.has(local_item_key) else local_item_key)
