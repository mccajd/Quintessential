extends BeaconNodeItemSlot

class_name BeaconNodeOutputSlot

@export var slot_id: int
var node_destination_options: Array[int]
var selected_node_destination: int

signal destination_updated

func _process(delta):
	super(delta)
	
	if !hovered: return
	
	if (Input.is_action_just_pressed("select")):
		_update_selected_node()
		destination_updated.emit(slot_id, selected_node_destination)
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
