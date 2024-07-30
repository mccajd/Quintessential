extends Node

## This is an autoload node so it will always run in the background of the 
## game.

var title_scene = "res://Scenes/main_menu.tscn"
var current_scene = null
var menu_bgm

const silent_paths = [MainMenu.game, MainMenu.win_screen, MainMenu.lose_screen]

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count()-1)
	menu_bgm = load("res://Scripts/menu_bgm.gd").new()
	root.add_child.call_deferred(menu_bgm)
	
func goto_scene(path):
	# defer call so no code from current_scene is still processing
	if path != null:
		call_deferred("_deferred_goto_scene", path)
	
	if silent_paths.has(path):
		menu_bgm.stop()
	else:
		menu_bgm.play()
		
func _deferred_goto_scene(path:String):
	var scene = ResourceLoader.load(path)
	current_scene.free()
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	
	
