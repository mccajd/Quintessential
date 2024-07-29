extends Node

var game = "res://Levels/beacon_puzzle_main.tscn"
var credits = "res://Scenes/credits.tscn"
var howto = "res://Scenes/howto.tscn"

func _on_start_button_pressed():
	Controller.goto_scene(game)


func _on_how_to_button_pressed():
	Controller.goto_scene(howto)


func _on_credits_button_pressed():
	Controller.goto_scene(credits)
