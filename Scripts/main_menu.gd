extends Node
class_name MainMenu

const game = "res://Levels/beacon_puzzle_main.tscn"
const credits = "res://Scenes/credits.tscn"
const howto = "res://Scenes/howto.tscn"


func _on_start_button_pressed():
	Controller.goto_scene(game)


func _on_how_to_button_pressed():
	Controller.goto_scene(howto)


func _on_credits_button_pressed():
	Controller.goto_scene(credits)


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
