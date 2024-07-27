extends Area2D

@export var id: int
var available_items: Array

@export var expected_input: String

signal item_hovered


func _ready():
	if !mouse_entered.is_connected(_on_mouse_entered):
		mouse_entered.connect(_on_mouse_entered)


func complete():
	return available_items.find(expected_input) > -1


func set_available_items(items):
	available_items = items


func _process(_delta):
	if complete():
		$SelectionSprite2D.visible = true
	else:
		$SelectionSprite2D.visible = false


func _on_mouse_entered():
	item_hovered.emit(expected_input)
