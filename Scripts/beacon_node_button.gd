extends Area2D

signal clicked
var hovered = false
@export var transformation_type = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (hovered && Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		$AnimatedSprite2D.play("depressed")
		return
	$AnimatedSprite2D.play("default")
	pass

func _mouse_enter():
	hovered = true
	
func _mouse_exit():
	hovered = false
	
