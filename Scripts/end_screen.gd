extends Node

func _ready():
	$Quote.visible = false
	$AnimatedSprite2D.play("default")


func _on_animation_finished():
	$AnimatedSprite2D.visible = false
	$Quote.visible = true
	await get_tree().create_timer(8).timeout	
	Controller.goto_scene(MainMenu.credits)
