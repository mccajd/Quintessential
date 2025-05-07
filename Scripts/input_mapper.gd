extends Control

@export var ActionName: String
@export var ActionKeybind: String

@onready var actionLabel = $HBoxContainer/Label
@onready var bindButton = $HBoxContainer/Button

func _ready():
	actionLabel.text = ActionName
	bindButton.text = ActionKeybind

func _on_button_pressed() -> void:
	pass # Replace with function body.
