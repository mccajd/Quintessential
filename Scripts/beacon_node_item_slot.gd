extends Control

class_name BeaconNodeItemSlot

@export var slot_id: int

var item_key
var hovered = false

signal item_dropped

func _ready():
	$BackgroundTextureRect.texture = load("res://assets/beacon/node-bg-slot.png")


func _process(_delta):
	if item_key == null:
		$ItemTextureRect.texture = load("res://assets/beacon/empty.png")
		return
	
	var item = Items.itemDB[item_key]
	$ItemTextureRect.texture = load(item.sprite)


func set_item(key):
	item_key = key


func _on_mouse_entered():
	hovered = true


func _on_mouse_exited():
	hovered = false


func _can_drop_data(_position, _data):
	return item_key == null


func _drop_data(position, data):
	# TODO.jmc - determine if dropped from inventory or nodes
	item_dropped.emit(slot_id, data.item_position)

