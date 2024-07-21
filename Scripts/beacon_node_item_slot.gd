extends Area2D

var item_key
#var node_destination_options: Array[int]
#var selected_node_destination: int

func _ready():
	$BackgroundTextureRect.texture = load("res://assets/beacon/node-bg-slot.png")


func _process(delta):
	if item_key == null:
		$ItemTextureRect.texture = load("res://assets/beacon/empty.png")
		return
	
	var item = Items.itemDB[item_key]
	$ItemTextureRect.texture = load(item.sprite)

func set_item(key):
	item_key = key
