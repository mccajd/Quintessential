class_name BeaconButton
extends Area2D

signal clicked
var hovered = false

@export var toggled = false
@export var transformation_type = ""


func _ready():
	$AnimatedSprite2D.play("default")
	input_pickable = true


func _process(_delta):
	if (!hovered): return
	
	if (Input.is_action_pressed("select")):
		$AnimatedSprite2D.play("depressed")
	else:
		$AnimatedSprite2D.play("hovered")
	
	if (Input.is_action_just_pressed("select")):
		clicked.emit(transformation_type)


func _on_mouse_entered():
	$AnimatedSprite2D.play("hovered")
	hovered = true


func _on_mouse_exited():
	$AnimatedSprite2D.play("default")
	hovered = false
