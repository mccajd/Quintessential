extends Area2D

var id
var inputs: Array = []
var outputs = []
var selectedTransformation
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
