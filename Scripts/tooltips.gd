class_name Tooltips
extends Node

@onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	parent.mouse_entered.connect(_on_mouse_entered)
	parent.mouse_exited.connect(_on_mouse_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_tooltip_message(text):
	pass

func _show_tooltip():
	print("test enter")
	

func _hide_tooltip():
	print("test exit")

func _on_mouse_entered():
	_show_tooltip()

func _on_mouse_exited():
	_hide_tooltip()
