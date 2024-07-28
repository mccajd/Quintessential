extends Node

## This is an autoload node so it will always run in the background of the 
## game.

var title_scene = "res://Scenes/main_menu.tscn"
var current_scene = null

func _ready():
	current_scene = get_tree().get_root().get_child(0)
	
func goto_scene(path):
	# defer call so no code from current_scene is still processing
	if path != null:
		call_deferred("_deferred_goto_scene", path)
		
func _deferred_goto_scene(path:String):
	var scene = ResourceLoader.load(path)
	
	current_scene.free()
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	
	
