extends Control

class_name BeaconNodeItemSlot

@export var slot_id: int

var item_key
var hovered = false

signal item_dropped
signal item_cleared
signal item_hovered

func _ready():
	$BackgroundTextureRect.texture = load("res://assets/beacon/node-bg-slot.png")


func _process(_delta):
	if hovered:
		item_hovered.emit(item_key)
	
	if item_key == null:
		$ItemTextureRect.texture = load("res://assets/beacon/empty.png")
		return
	
	if hovered && Input.is_action_just_pressed("select"):
		item_cleared.emit(slot_id)
	
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


func _drop_data(_position, data):
	item_dropped.emit(slot_id, data.item_position, data.from_inventory)
