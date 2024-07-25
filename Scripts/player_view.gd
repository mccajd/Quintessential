extends Node

@onready var tile_map = $TileMap
var player = preload("res://Scenes/sophmore_player.tscn")

func _ready():
	
	var new_player = player.instantiate()
	new_player.change_room.connect(changing_room)
	add_child(new_player)
	new_player.set_start_pos(tile_map.get_used_cells_by_id(tile_map.LAYERS.MISC,3,Vector2i(3,0))[0])

func _process(delta):
	pass
	
# TODO.hmw have the player view handle the room swapping, perhaps have 
# a neat, little fade in/fade out of black to hide the transition.
# You could even have a canned walking animation down a hall that
# pops up and player
func changing_room(room : String, start_pos : Vector2i):
	print("Welcome to the Changing Room")
	print(room)
	print(start_pos)
