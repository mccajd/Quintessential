class_name Tooltips
extends Control

# NOTE.Kei I tried to make TooltipControlNode it's own Node and it broke everything
# "Hey, if it works"

func _ready():
	_set_tooltip_message("UNKNOWN")
	
	_hide_tooltip()


func _process(_delta):
	# HACK.jmc - godot has a pseudo reflection which i can use here.
	for child in Helpers.get_all_children(get_parent(), []):
		if "item_hovered" in child || "control_hovered" in child:
			# NOTE.jmc - this assumes whatever you add item_hovered to has these signals
			#	if it doesn't, well, ya got trouble my friend
			if !child.is_connected("mouse_entered", _on_mouse_entered):
				child.mouse_entered.connect(_on_mouse_entered)
			if !child.is_connected("mouse_exited", _on_mouse_exited):
				child.mouse_exited.connect(_on_mouse_exited)
			if "item_hovered" in child && !child.is_connected("item_hovered", _set_item_tooltip):
				child.item_hovered.connect(_set_item_tooltip)
			if "control_hovered" in child && !child.is_connected("control_hovered", _set_control_tooltip):
				child.control_hovered.connect(_set_control_tooltip)
	
	if visible:
		position = _get_mouse_position()
	
	if !$RichTextLabel.text || Input.is_action_just_pressed("select"):
		_hide_tooltip()

func _show_tooltip():
	if Input.is_action_pressed("select"): return
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
	
	# Detect if the mouse is in either the right third or bottom third of the screen
	var is_below_third = get_viewport_rect().size.y / 3 * 2 > newPosition.y
	var is_right_third = get_viewport_rect().size.x / 3 * 2 > newPosition.x
	
	# Setting the offest compared to the mouse and screen position
	if is_right_third:
		newPosition.x += 10
	else:
		newPosition.x -= $TextureRect.size.x
	if is_below_third:
		newPosition.y += 18
	else:
		newPosition.y -= $TextureRect.size.y
	
	return newPosition

func _set_tooltip_message(text):
	if !text: text = ""
	# Update the text
	$RichTextLabel.set_text(text)
	
	# Get the new size of the text and set the texture node behind accordingly
	var stringSize = $RichTextLabel.get_combined_minimum_size()
	$TextureRect.size.x = stringSize.x
	$TextureRect.size.y = stringSize.y


func _set_item_tooltip(item_key):
	if item_key == null:
		_set_tooltip_message(null)
		return
	var item = Items.itemDB[item_key]
	_set_tooltip_message("[b]" + item.name + "[/b]\n" + item.description)

func _set_control_tooltip(tooltip_name):
	var message = ""
	
	match tooltip_name:
		"neutral":
			message = "[b]Neutral[/b]\n\nDo nothing to the provided reagents."
		"solution":
			message = "[b]Solution[/b]\n\nPhysically combine the provided reagents.\n\nSmaller materials can often be combined to increase their potency."
		"dissolution":
			message = "[b]Dissolution[/b]\n\nPhysically separate the provided reagents.\n\nOften useful when reagents are unwieldy and would benefit from being broken down.\n\nCertain elements and even primes can often be dissoluted into less potent components."
		"sublimation":
			message = "[b]Sublimation[/b]\n\nCombine a reagent with a neutralizing element, such as salt.\n\nBase elements, metals, and specimens which retain life energy\ncan often be sublimated into their base components.\n"
		"distillation":
			message = "[b]Distillation[/b]\n\nCombine a reagent with a combusting element, such as sulfur.\n\nMaterials can often be distilled into more alchemically useful\nproducts."
		"ascension":
			message = "[b]Ascension[/b]\n\nCombine a reagent with a volatile element, such as quicksilver or alcohol.\n\nBase elements and metals can usually be ascended into higher tiers."
		_:
			# HACK.jmc - the beacon node button as close button has lasted this long huh?
			return _set_tooltip_message("Return to Overworld")
	
	message += "\n\nAdjacent beacons can be selected as outputs for any products."
	_set_tooltip_message(message)
