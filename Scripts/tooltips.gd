class_name Tooltips
extends Node

# NOTE.Kei I tried to make TooltipControlNode it's own Node and it broke everything
# "Hey, if it works"
@onready var parent = get_parent()
@onready var textureNode = get_node("TooltipControlNode/TextureRect")
@onready var textNode = get_node("TooltipControlNode/RichTextLabel")
@onready var timer = get_node("TooltipControlNode/Timer")

func _ready():
	textureNode.texture = load("res://assets/tooltip/dialoguebox.png")
	
	parent.mouse_entered.connect(_on_mouse_entered)
	parent.mouse_exited.connect(_on_mouse_exited)
	
	set_tooltip_message("UNKNOWN")
	
	_hide_tooltip()

func _process(delta):
	if $TooltipControlNode.visible:
		$TooltipControlNode.position = _get_mouse_position()
	
	if !textNode.text:
		_hide_tooltip()

func _show_tooltip():
	$TooltipControlNode.position = _get_mouse_position()
	$TooltipControlNode.show()

func _hide_tooltip():
	$TooltipControlNode.hide()

func _on_mouse_entered():
	# The end of the timer calls "_show_tooltip()"
	timer.start()

func _on_mouse_exited():
	timer.stop()
	_hide_tooltip()

func _get_mouse_position():
	# Grab the mouse position
	var newPosition = get_viewport().get_mouse_position()
	
	# Setting the offest compared to the mouse
	newPosition.x += 10
	newPosition.y += 18
	
	return newPosition

func set_tooltip_message(text):
	# Update the text
	textNode.set_text(text)
	
	# Get the new size of the text and set the texture node behind accordingly
	var stringSize = textNode.get_combined_minimum_size()
	textureNode.size.x = stringSize.x
	textureNode.size.y = stringSize.y
