extends Node

var room_names = ["cloud", "cave", "ocean", "desert"]
var selected_room

func _ready():
	for name in room_names:
		_disable_puzzle(name)


func _process(_delta):
	pass


func _enable_puzzle(room_name = selected_room):
	_toggle_puzzle(room_name, true)


func _disable_puzzle(room_name = selected_room):
	_toggle_puzzle(room_name, false)


func _toggle_puzzle(room_name, value):
	var node = _get_by_room(room_name)
	node.set_process_input(value)
	node.set_process(value)
	node.set_physics_process(value)
	node.set_visibility(value)


func _on_beacon_menu_toggled(opened):
	get_node("PlayerView").visible = !opened


func _on_world_item_found(item_name):
	_get_by_room(selected_room).set_item(item_name)


func _on_beacon_puzzle_changed(room_name):
	for name in room_names:
		_disable_puzzle(name)
	
	if room_names.find(room_name) == -1:
		room_name = null
	selected_room = room_name
	
	if !selected_room: return
	
	_enable_puzzle()


func _on_game_over():
	print("Th-th-that's all folks..!")


func _get_by_room(room_name):
	for child in get_children():
		if "for_room" in child && child.for_room == room_name:
			return child
	print("NONE FOUND")
