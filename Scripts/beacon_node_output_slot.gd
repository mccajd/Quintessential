extends Area2D

@export var output_item: OutputItem
var node_destination_options: Array[int]
var selected_node_destination: int

func _ready():
	$BackgroundTextureRect.texture = load("res://assets/beacon/node-bg-slot.png")


func _process(delta):
	if output_item == null:
		$ItemTextureRect.texture = load("res://assets/beacon/empty.png")
		return
	
	var item = Items.itemDB[output_item.item_key]
	$ItemTextureRect.texture = load(item.sprite)

func set_output_item(item: OutputItem):
	output_item = item
