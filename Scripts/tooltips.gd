class_name Tooltips
extends Node

# NOTE I created a parent Control node for the tool toop, the superparent "Tooltips"
# May not be necessary, might have to just switch this script and tack it onto "TooltipControlNode"
@onready var parent = get_parent()
@onready var textureNode = get_node("TooltipControlNode/TextureRect")
@onready var textNode = get_node("TooltipControlNode/RichTextLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	textureNode.texture = load("res://assets/tooltip/dialoguebox.png")
	set_tooltip_message("This is the test of the dynamic box")
	parent.mouse_entered.connect(_on_mouse_entered)
	parent.mouse_exited.connect(_on_mouse_exited)
	
	_hide_tooltip()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TooltipControlNode.visible:
		$TooltipControlNode.position = _get_mouse_position()

func _show_tooltip():
	$TooltipControlNode.show()

func _hide_tooltip():
	$TooltipControlNode.hide()

func _on_mouse_entered():
	_show_tooltip()

func _on_mouse_exited():
	_hide_tooltip()

func _get_mouse_position():
	return get_viewport().get_mouse_position()

func set_tooltip_message(text):
	textNode.set_text(text)
	var stringSize = textNode.get_combined_minimum_size()
	textureNode.size.x = stringSize.x
	textureNode.size.y = stringSize.y
