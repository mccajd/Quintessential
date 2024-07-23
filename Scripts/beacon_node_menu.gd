extends Area2D

var playerView = null

var selected_node: BeaconNode

# may be a more programatic way to handle this.
const input_slot_names = ["InputSlot1", "InputSlot2", "InputSlot3", "InputSlot4"]
const output_slot_names = ["OutputSlot1", "OutputSlot2", "OutputSlot3", "OutputSlot4"]

func _ready():
	visible = false
	input_pickable = false
	playerView = get_parent().get_parent().get_node("PlayerView").get_children()

func _process(delta):
	get_node("SelectedNodeLabel").text = selected_node.name if selected_node else "none"
	get_node("SelectedTransformationLabel").text = selected_node.selected_transformation if selected_node else "neutral"
	
	if !selected_node: return
	
	#get_node("SelectedInputLabel").text = _render_string_label(selected_node.inputs)
	#get_node("SelectedOutputLabel").text = _render_string_label(selected_node.outputs) if selected_node.inputs else "no inputs"
	get_node("AvailableItemsLabel").text = _render_string_label(selected_node.available_items)
	
	_set_input_slot_items()
	_set_output_slot_items()
	

func _on_beacon_tower_node_selected(node: BeaconNode):
	# minor UX - clear the current node if selected again.
	if (node == selected_node || node == null):
		selected_node = null
		_set_visibility(false)
		return

	selected_node = node
	_set_output_slots()
	_set_visibility(true)
	

func _set_visibility(value: bool):
	visible = value
	for child in playerView:
		child.visible = !value

func _on_transformation_type_selected(type: String):
	selected_node.set_transformation(type)

func _render_string_label(strings):
	if !strings: return "unknown"
	# if we like this it could be a helper function
	var rtn = strings.front()
	for s in strings.slice(1):
		rtn += ", "
		rtn += s
	
	return rtn

func _set_output_slots():
	for i in output_slot_names.size():
		get_node("OutputContainer").get_node(output_slot_names[i]).set_values(selected_node)

func _set_input_slot_items():
	if !selected_node: return
	
	for i in input_slot_names.size():
		var node = get_node("InputContainer").get_node(input_slot_names[i])
		if i >= selected_node.inputs.size():
			node.set_item(null)
			continue
		node.set_item(selected_node.inputs[i])

func _set_output_slot_items():
	if !selected_node: return
	
	for i in output_slot_names.size():
		var node = get_node("OutputContainer").get_node(output_slot_names[i])
		if i >= selected_node.products.size():
			node.set_item(null)
			continue
		node.set_item(selected_node.products[i].item_key)


func _on_output_slot_destination_updated(slot_source_id: int, destination_node_id: int):
	selected_node.set_destination_node(slot_source_id, destination_node_id)
