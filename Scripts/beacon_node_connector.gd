extends Node2D

var enabled: bool

func _ready():
	enabled = false

func _process(delta):
	if enabled:
		$AnimatedSprite2D.play("on")
		return
	$AnimatedSprite2D.play("off")

func enable():
	enabled = true
	
func disable():
	enabled = false
