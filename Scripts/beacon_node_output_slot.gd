extends BeaconNodeItemSlot

class_name BeaconNodeOutputSlot

var node_destination_options
var selected_node_destination: int

signal destination_updated


func _process(delta):
	super(delta)
	
	if !hovered: return
	
	if (Input.is_action_just_pressed("select")):
		_update_selected_node()
		destination_updated.emit(slot_id, selected_node_destination)
		get_node("DestinationLabel").text = str(selected_node_destination) if selected_node_destination > -1 else ""


func _can_drop_data(_position, _data):
	return false


func set_values(selected_node: BeaconNode, connections):
	# Basically, if it's an available connection AND not active 
	#	(UNLESS this node is the reason it's active)
	# it should be an available option.
	
	var options = []
	# get all connected values
	var connected_nodes = []
	for connection in connections:
		if connection.has(selected_node.id):
			for nub in connection:
				if nub != selected_node.id: connected_nodes += [nub]
	
	for item in selected_node.availableNodeIds:
		if connected_nodes.has(item) && !selected_node.active_connections.has(item):
			continue
		options += [item]
	
	node_destination_options = options
	selected_node_destination = selected_node.selected_destination_nodes[slot_id]
	get_node("DestinationLabel").text = str(selected_node_destination) if selected_node_destination > -1 else ""

func _update_selected_node():
	if selected_node_destination == -1:
		selected_node_destination = node_destination_options.front()
		return
	if selected_node_destination == node_destination_options.back():
		selected_node_destination = -1
		return
	var ix = node_destination_options.find(selected_node_destination)
	ix += 1
	selected_node_destination = node_destination_options[ix]
