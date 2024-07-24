extends Area2D

class_name BeaconNode

@export var id: int
@export var availableNodeIds: Array[int]
# Four output slots = array of size 4.
# This lets me cheat by using the slot_id as an index pointer
var selected_destination_nodes = [-1, -1, -1, -1]

var hovered = false

# @export here for debugging; this should be set by the player/internal systems
@export var inputs: Array[String]
var outputs
@export var selected_transformation: String = "neutral"
var available_items

var products: Array[OutputItem]
var output_dictionary: Dictionary

var transformer: ItemTransformer

signal selected
signal transformed

func _ready():
	input_pickable = true
	transformer = ItemTransformer.new()


func _process(delta):
	_handle_button_logic()
	
	var new_outputs = transformer.transform(selected_transformation, inputs)
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
	return rtn


func disable_selection_effects():
	$SelectionSprite2D.visible = false


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
