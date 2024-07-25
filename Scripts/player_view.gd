extends Node

var player = preload("res://Scenes/sophmore_player.tscn")

func _ready():
	var tile_map = $TileMap
	var new_player = player.instantiate()

	add_child(new_player)
	new_player.set_start_pos(tile_map.get_used_cells_by_id(tile_map.LAYERS.MISC,3,Vector2i(3,0))[0])

func _process(delta):
	pass
