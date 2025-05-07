extends Control

@export var ActionName: String

@onready var actionLabel = $HBoxContainer/Label
@onready var bindButton = $HBoxContainer/Button


func _ready():
	# Sets the labed of the action
	actionLabel.text = ActionName
	
	# Enabled the bind button to "toggle" mode
	bindButton.toggle_mode = true
	
	# Updating Button Test
	_update_button_text()


func _on_button_toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	if toggled_on:
		bindButton.text = "Press Any Key..."
	else:
		_update_button_text()


func _unhandled_input(event):
	if event.pressed:
		InputMap.action_erase_events(ActionName)
		InputMap.action_add_event(ActionName, event)
		bindButton.button_pressed = false


func _update_button_text():
	bindButton.text = InputMap.action_get_events(ActionName)[0].as_text()
