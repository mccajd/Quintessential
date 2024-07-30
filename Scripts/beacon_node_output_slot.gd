extends BeaconNodeItemSlot

class_name BeaconNodeOutputSlot

var node_destination_options
var selected_node_destination: int

signal destination_updated


func _ready():
	get_node("Destination").visible = false


func _process(delta):
	super(delta)
	
	if !hovered: return
	
	if (Input.is_action_just_pressed("select")):
		_update_selected_node()
		destination_updated.emit(slot_id, selected_node_destination)
		
		var destination_texture = get_node("Destination")
		if selected_node_destination == -1:
			destination_texture.visible = false
			return
		destination_texture.texture = load(BeaconNode.get_symbol_texture(selected_node_destination))
		if selected_node_destination > 10:
			# HACK.jmc - cheeky way to detect if this is a recepticle without getting a ref
			destination_texture.size.x = 20
			destination_texture.position.x = 29.635
		else:
			destination_texture.size.x = 17
			destination_texture.position.x = 33.335
		destination_texture.visible = true


func _can_drop_data(_position, _data):
	return false


func set_values(selected_node: BeaconNode, connections):
	node_destination_options = selected_node.availableNodeIds
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
