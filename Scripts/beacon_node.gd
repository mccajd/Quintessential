extends Area2D

class_name BeaconNode

@export var id: int
@export var availableNodeIds: Array[int]
@export var connectedNodeIds: Array[int]

var inputs: Array = []
var outputs = []
var selectedTransformation: String
var slottedItem: Item
signal selected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (inputs.any(func(item): !!item)):
		$AnimatedSprite2D.play("filled")
		return
	$AnimatedSprite2D.play("empty")

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

func _selected():
	selected.emit(self)
