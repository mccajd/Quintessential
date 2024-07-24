extends Area2D

class_name BeaconNode

@export var id: int
@export var availableNodeIds: Array[int]
# Four output slots = array of size 4.
# This lets me cheat by using the slot_id as an index pointer
var selected_destination_nodes = [-1, -1, -1, -1]

const input_array_size = 4
# idea here is two arrays to represent the slots
# one for node-sourced items, one for inventory items
var inputs_from_nodes = [null, null, null, null]
var inputs_from_inventory = [null, null, null, null]

var hovered = false

# @export here for debugging; this should be set by the player/internal systems
var inputs
var outputs
@export var selected_transformation: String = "neutral"
var available_items

var products: Array[OutputItem]
var output_dictionary: Dictionary
var active_connections

var transformer: ItemTransformer

signal selected
signal transformed

func _ready():
	input_pickable = true
	transformer = ItemTransformer.new()


func _process(_delta):
	_handle_button_logic()
	_set_inputs()
	
	var real_inputs = []
	for input in inputs:
		if input == null: continue
		real_inputs += [input]
	var new_outputs = transformer.transform(selected_transformation, real_inputs)
	if !Helpers.compare_arrays(outputs, new_outputs):
		outputs = new_outputs
		_set_products()
	
	if (products.size() > 0):
		$AnimatedSprite2D.play("filled")
		return
	$AnimatedSprite2D.play("empty")


func set_transformation(type: String):
	selected_transformation = type


func set_destination_node(slot_id, destination_node_id):
	selected_destination_nodes[slot_id] = destination_node_id


func set_available_items(items):
	#debug
	if id == 1:
		available_items = [ItemInSlot.new("water", null)]
		return
	
	if (available_items != null && Helpers.compare_arrays(available_items.map(func(x): return x.item_key), items)): return
	
	_reset_input_slots()
	# TODO.jmc - don't wipe out slot mappings for existing items if they aren't removed
	available_items = items.map(func(x): return ItemInSlot.new(x, null))


func set_input_item(slot_id, item_index):
	if (is_input_slot_empty(slot_id)):
		inputs_from_nodes[slot_id] = available_items[item_index]


func get_active_connections():
	var rtn = []
	var items: Dictionary
	
	for i in selected_destination_nodes.size():
		if i >= products.size(): break
		var destination = selected_destination_nodes[i]
		if destination == -1: continue
		if !rtn.has(destination):
			rtn += [destination]
		if !items.has(destination):
			items[destination] = [products[i].item_key]
			continue
		var new_items = items[destination] + [products[i].item_key]
		items[destination] = new_items
	
	output_dictionary = items
	active_connections = rtn
	return rtn

func get_available_connections():
	var rtn = []
	for item in availableNodeIds:
		if !active_connections.has(item):
			rtn += [item]
	return rtn


func disable_selection_effects():
	$SelectionSprite2D.visible = false


func is_input_slot_empty(index):
	return inputs_from_inventory[index] == null && inputs_from_nodes[index] == null


func _handle_button_logic():
	if (!hovered): return

	if (Input.is_action_just_pressed("select")):
		$SelectionSprite2D.visible = true
		selected.emit(self)


func _on_mouse_entered():
	hovered = true


func _on_mouse_exited():
	hovered = false


func _set_products():
	products.clear()
	if outputs != null:
		for item in outputs:
			var output_item = OutputItem.new(item)
			products.push_front(output_item)
	transformed.emit(id, products)


func _set_inputs():
	var rtn = [null, null, null, null]
	for i in input_array_size:
		var entry = inputs_from_inventory[i] if inputs_from_inventory[i] != null else inputs_from_nodes[i]
		if entry != null:
			rtn[i] = entry.item_key
	inputs = rtn

func _reset_input_slots():
	inputs_from_inventory = [null, null, null, null]
	inputs_from_nodes = [null, null, null, null]
