extends Area2D

class_name BeaconNode

@export var id: int
@export var availableNodeIds: Array[int]
@export var connectedNodeIds: Array[int]

var hovered = false

# @export here for debugging; this should be set by the player/internal systems
@export var inputs: Array[String]
var outputs
@export var selected_transformation: String = "neutral"
var slottedItem: Item

var products: Array[Item]

var transformer: ItemTransformer

signal selected

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
	outputs = transformer.transform(selected_transformation, inputs)

func add_item(item: Item):
	if slottedItem == null:
		slottedItem = item
		$SlottedItemPreview.texture = item.sprite
		return

func remove_item():
	if slottedItem:
		slottedItem = null
		$SlottedItemPreview.texture = null
		return

func set_transformation(type: String):
	selected_transformation = type

func _handle_button_logic():
	if (!hovered): return

	if (Input.is_action_just_pressed("select")):
		selected.emit(self)

func _on_mouse_entered():
	hovered = true

func _on_mouse_exited():
	hovered = false
