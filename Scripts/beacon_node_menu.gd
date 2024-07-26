extends Area2D

var playerView = null

var selected_node: BeaconNode
var existing_connections

var inventory_node: InventoryItems

# may be a more programatic way to handle this.
const input_slot_names = ["InputSlot1", "InputSlot2", "InputSlot3", "InputSlot4"]
const output_slot_names = ["OutputSlot1", "OutputSlot2", "OutputSlot3", "OutputSlot4"]

func _ready():
	inventory_node = get_node("/root/BeaconPuzzleMain/InventoryItems")
	visible = false
	input_pickable = false
	playerView = Helpers.get_all_children(get_parent().get_parent().get_node("PlayerView"), [])


func _process(_delta):
	get_node("SelectedNodeLabel").text = selected_node.name if selected_node else "none"
	get_node("SelectedTransformationLabel").text = selected_node.selected_transformation if selected_node else "neutral"
	
	if !selected_node: return
	
	#get_node("SelectedInputLabel").text = _render_string_label(selected_node.inputs)
	#get_node("SelectedOutputLabel").text = _render_string_label(selected_node.outputs) if selected_node.inputs else "no inputs"
	#get_node("AvailableItemsLabel").text = _render_string_label(selected_node.available_items)
	
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
	_set_available_items()


func _set_visibility(value: bool):
	visible = value
	for child in playerView:
		child.set_process_input(!value)

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
		var node = get_node("OutputContainer").get_node(output_slot_names[i])
		node.set_values(selected_node, existing_connections)

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


func _set_available_items():
	var box: VBoxContainer = get_node("AvailableItemsContainer")

	# clear existing
	for child in box.get_children():
		child.queue_free()
	box.add_spacer(true)
	
	for i in selected_node.available_items.size():
		var item = selected_node.available_items[i]
		var new_item = ItemDraggable.new(item.item_key, item.slot_id, i)
		
		box.add_child(new_item)


func _on_item_dropped(slot_id, item_index, from_inventory):
	if from_inventory:
		selected_node.set_inventory_item(slot_id, inventory_node.inventory_items[item_index])
		inventory_node.set_item_slot(item_index, slot_id, selected_node.id)
	else:
		selected_node.set_input_item(slot_id, item_index)
		_set_available_items()


func _on_beacon_tower_connections_updated(connections):
	existing_connections = connections


func _on_item_cleared(slot_id):
	selected_node.clear_input_slot(slot_id)
	inventory_node.clear_item_slot(slot_id, selected_node.id)
	_set_available_items()
