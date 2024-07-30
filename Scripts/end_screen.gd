extends Node

@export var win: bool

func _ready():
	$Quote.visible = false
	$AnimatedSprite2D.play("default")


func _on_animation_finished():
	$AnimatedSprite2D.visible = false
	$Quote.visible = true
	await get_tree().create_timer(5 if win else 8).timeout
	if win:
		_fade_quote()
		return
	Controller.goto_scene(MainMenu.credits)

func _fade_quote():
	for i in range(0, 8):
		$Quote.modulate.a -= 0.125
		await get_tree().create_timer(0.125).timeout
	Controller.goto_scene(MainMenu.credits)
