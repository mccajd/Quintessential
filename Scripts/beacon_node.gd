extends Area2D

class_name BeaconNode

@export var id: int
@export var availableNodeIds: Array[int]
# Four output slots = array of size 4.  Might as well weaponize this ref type shite
var selected_destination_nodes = [-1, -1, -1, -1]

var hovered = false

# @export here for debugging; this should be set by the player/internal systems
@export var inputs: Array[String]
var outputs
@export var selected_transformation: String = "neutral"
#var slottedItem: Item

var products: Array[OutputItem]

var transformer: ItemTransformer

signal selected
signal transformed

# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true
	transformer = ItemTransformer.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_handle_button_logic()
	
	if (inputs.any(func(item): !!item)):
		$AnimatedSprite2D.play("filled")
		return
	$AnimatedSprite2D.play("empty")
	
	var new_outputs = transformer.transform(selected_transformation, inputs)
	if !Helpers.compare_arrays(outputs, new_outputs):
		outputs = new_outputs
		_set_products()

#func add_item(item: Item):
	#if slottedItem == null:
		#slottedItem = item
		#$SlottedItemPreview.texture = item.sprite
		#return
#
#func remove_item():
	#if slottedItem:
		#slottedItem = null
		#$SlottedItemPreview.texture = null
		#return

func set_transformation(type: String):
	selected_transformation = type

func set_destination_node(slot_id, destination_node_id):
	selected_destination_nodes[slot_id] = destination_node_id

func get_active_connections():
	var rtn = []
	
	for i in selected_destination_nodes.size():
		if i >= products.size(): return rtn
		var destination = selected_destination_nodes[i]
		if destination == -1: continue
		rtn.push_front(destination)
	return rtn

func _handle_button_logic():
	if (!hovered): return

	if (Input.is_action_just_pressed("select")):
		selected.emit(self)

func _on_mouse_entered():
	hovered = true

func _on_mouse_exited():
	hovered = false

func _set_products():
	# potential UX later to preserve the destination node.
	products.clear()
	if outputs != null:
		for item in outputs:
			var output_item = OutputItem.new(item)
			products.push_front(output_item)
	transformed.emit(id, products)
