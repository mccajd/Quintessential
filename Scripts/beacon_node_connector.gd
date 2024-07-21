extends Node2D

var enabled: bool

func _ready():
	enabled = false

func _process(delta):
	$AnimatedSprite2D.play("on") if enabled else $AnimatedSprite2D.play("off")

func enable():
	enabled = true
	
func disable():
	enabled = false
