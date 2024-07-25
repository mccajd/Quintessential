class_name Tooltips
extends Control

# NOTE.Kei I tried to make TooltipControlNode it's own Node and it broke everything
# "Hey, if it works"

func _ready():
	set_tooltip_message("UNKNOWN")
	
	_hide_tooltip()


func _process(_delta):
	# HACK.jmc - godot has a pseudo reflection which i can use here.
	for child in Helpers.get_all_children(get_parent(), []):
		if "item_hovered" in child:
			child.item_hovered.connect(set_item_tooltip)
			child.mouse_entered.connect(_on_mouse_entered)
			child.mouse_exited.connect(_on_mouse_exited)
	
	if visible:
		position = _get_mouse_position()
	
	if !$RichTextLabel.text || Input.is_action_just_pressed("select"):
		_hide_tooltip()

func _show_tooltip():
	position = _get_mouse_position()
	z_index = 10
	show()

func _hide_tooltip():
	hide()

func _on_mouse_entered():
	# The end of the timer calls "_show_tooltip()"
	$Timer.start()

func _on_mouse_exited():
	$Timer.stop()
	_hide_tooltip()

func _get_mouse_position():
	# Grab the mouse position
	var newPosition = get_viewport().get_mouse_position()
	
	# Setting the offest compared to the mouse
	newPosition.x += 10
	newPosition.y += 18
	
	return newPosition

func set_tooltip_message(text):
	if !text: text = ""
	# Update the text
	$RichTextLabel.set_text(text)
	
	# Get the new size of the text and set the texture node behind accordingly
	var stringSize = $TextureRect.get_combined_minimum_size()
	#$TextureRect.size.x = stringSize.x
	#$TextureRect.size.y = stringSize.y


func set_item_tooltip(item_key):
	if item_key == null:
		set_tooltip_message(null)
		return
	var item = Items.itemDB[item_key]
	set_tooltip_message("[b]" + item.name + "[/b]\n" + item.description)
