extends Area2D

var node_outputs: Dictionary
var selected_node: BeaconNode

const node_names = ["BeaconNode1", "BeaconNode2", "BeaconNode3", "BeaconNode4", "BeaconNode5", "BeaconNode6", "BeaconNode7", "BeaconNode8", "BeaconNode9", "BeaconNode10"]
const recepticle_names = ["BeaconRecepticle1", "BeaconRecepticle2", "BeaconRecepticle3"]

@export var debug_instant_win: bool

signal node_selected
signal connections_updated

signal puzzle_won

func _ready():
	pass


func _process(_delta):
	_set_connectors()


func _on_node_selected(node: BeaconNode):
	# TODO.jmc - eventually i intend to hold node connections here, which we'll need
	#		for the selection menu.  for now i'm encapsulating the node selection event
	#		here with the intent to enhance it with more info later.
	node_selected.emit(node)
	selected_node = null if selected_node == node else node
	_set_selected_node_effects()


func _on_transformed(node_id: int, output_items: Array[OutputItem]):
	node_outputs[node_id] = output_items


func _set_connectors():
	# note - this is called every frame.  if this turns out to be non-performant
	#  i'll come back to it
	var connections = []
	var outputs: Dictionary
	
	for node_name in node_names:
		var beacon_node = get_node(node_name)
		for connection in beacon_node.get_active_connections():
			connections.push_front([beacon_node.id, connection])
		for entry in beacon_node.output_dictionary.keys():
			if !outputs.has(entry):
				outputs[entry] = beacon_node.output_dictionary[entry]
				continue
			var new_items = outputs[entry] + beacon_node.output_dictionary[entry]
			outputs[entry] = new_items
	
	# The code equivalent of realizing you forgot the car keys at the grocery
	for node_name in node_names + recepticle_names:
		var beacon_node_or_recepticle = get_node(node_name)
		if outputs.has(beacon_node_or_recepticle.id):
			beacon_node_or_recepticle.set_available_items(outputs[beacon_node_or_recepticle.id])
		else:
			beacon_node_or_recepticle.set_available_items([])
	
	connections_updated.emit(connections)


func _set_selected_node_effects():
	for node_name in node_names:
		var beacon_node = get_node(node_name)
		if beacon_node == selected_node: continue
		beacon_node.disable_selection_effects()


func _on_beacon_submit_button_pressed():
	if _get_win_status():
		# shocking this has survived this long
		get_parent().get_node("MockUI/BeaconNodeView/BeaconNodeMenu/ShowNodeMenuButton")._on_clicked(null)
		puzzle_won.emit()
		return
	
	# RIP "u lost bitch ahahaha!" 2024-2024



func _get_win_status():
	if debug_instant_win: return true
	
	for recepticle_name in recepticle_names:
		if !get_node(recepticle_name).complete(): return false
	return true

