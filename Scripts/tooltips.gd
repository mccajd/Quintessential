class_name Tooltips
extends Node

@onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.texture = load("res://assets/tooltip/dialoguebox.png")
	set_tooltip_message("This is the test of the dynamic box")
	parent.mouse_entered.connect(_on_mouse_entered)
	parent.mouse_exited.connect(_on_mouse_exited)
	
	_hide_tooltip()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_tooltip_message(text):
	$RichTextLabel.set_text(text)
	var stringSize = $RichTextLabel.get_combined_minimum_size()
	$TextureRect.size.x = stringSize.x
	$TextureRect.size.y = stringSize.y

func _show_tooltip():
	$TextureRect.show()
	$RichTextLabel.show()

func _hide_tooltip():
	$TextureRect.hide()
	$RichTextLabel.hide()

func _on_mouse_entered():
	_show_tooltip()

func _on_mouse_exited():
	_hide_tooltip()
