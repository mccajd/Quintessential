extends Node

var room_names = ["cloud", "cave", "ocean", "desert"]
var available_room_names = room_names
var selected_room

signal hub_rooms_set

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
	if !node: return
	
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
	Controller.goto_scene(MainMenu.lose_screen)


func _get_by_room(room_name):
	for child in get_children():
		if "for_room" in child && child.for_room == room_name:
			return child
	print("NONE FOUND")


func _set_game_status(completed_room: String):
	get_node("TowerExteriorView/TowerExtView").regress_shadows()
	
	available_room_names.erase(completed_room)
	
	if available_room_names.size() == 0:
		available_room_names = ["endgame"]
	hub_rooms_set.emit(available_room_names)
	await get_tree().create_timer(0.8).timeout
	_get_by_room(completed_room).queue_free()
