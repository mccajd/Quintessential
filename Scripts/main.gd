extends Node

var puzzles = ["BeaconPuzzle1", "BeaconPuzzle2", "BeaconPuzzle3", "BeaconPuzzle4"]
var selected_puzzle

func _ready():
	for puzzle in puzzles:
		_disable(puzzle)


func _process(delta):
	if Input.is_action_just_pressed("debug"):
		pass
		#_disable_node(selected_room)
		#get_next_room()
		#_enable_node(selected_room)


func get_next_room():
	if selected_puzzle == puzzles.back():
		selected_puzzle = puzzles.front()
		return
	var ix = puzzles.find(selected_puzzle)
	ix += 1
	selected_puzzle = puzzles[ix]


func _enable(name):
	_toggle(name, true)


func _disable(name):
	_toggle(name, false)


func _toggle(name, value):
	var node = get_node(name)
	node.set_process_input(value)
	node.set_process(value)
	node.set_physics_process(value)
	node.set_visibility(value)


func _on_beacon_menu_toggled(opened):
	get_node("PlayerView").visible = !opened


func _on_world_item_found(item_name):
	get_node(selected_puzzle).set_item(item_name)


func _on_beacon_puzzle_changed(puzzle_name):
	for puzzle in puzzles:
		_disable(puzzle)
	
	selected_puzzle = puzzle_name
	
	if !puzzle_name: return
	
	_enable(puzzle_name)


func _on_game_over():
	print("Th-th-that's all folks..!")
