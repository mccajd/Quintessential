extends Area2D

@export var id: int
var available_items: Array

@export var expected_input: String

func complete():
	return available_items.find(expected_input) > -1

func _process(_delta):
	if complete():
		$SelectionSprite2D.visible = true
	else:
		$SelectionSprite2D.visible = false
