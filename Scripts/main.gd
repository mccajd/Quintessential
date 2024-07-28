extends Node

var puzzle_rooms = ["BeaconPuzzle1", "BeaconPuzzle2", "BeaconPuzzle3", "BeaconPuzzle4"]
var selected_room = "BeaconPuzzle1"

func _ready():
	for room_name in puzzle_rooms:
		_disable_node(room_name)
	_enable_node(selected_room)


func _process(delta):
	if Input.is_action_just_pressed("debug"):
		_disable_node(selected_room)
		get_next_room()
		_enable_node(selected_room)


func get_next_room():
	if selected_room == puzzle_rooms.back():
		selected_room = puzzle_rooms.front()
		return
	var ix = puzzle_rooms.find(selected_room)
	ix += 1
	selected_room = puzzle_rooms[ix]


func _enable_node(node_name):
	_toggle_node(node_name, true)


func _disable_node(node_name):
	_toggle_node(node_name, false)


func _toggle_node(node_name, value):
	var node = get_node(node_name)
	node.set_process_input(value)
	node.set_process(value)
	node.set_physics_process(value)
	node.set_visibility(value)


func _on_beacon_menu_toggled(opened):
	get_node("PlayerView").visible = !opened


func _on_world_item_found(item_name):
	get_node(selected_room).set_item(item_name)

func _on_game_over():
	print("Th-th-that's all folks..!")
