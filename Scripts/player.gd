extends CharacterBody2D
class_name player

signal change_room(String, Vector2i)

const speed = 2

var astar_grid  : AStarGrid2D
var tile_map    : TileMap
var tile_size   : Vector2i
var start_tile  : Vector2i
var target      : Vector2i
var target_tile : Vector2i
var path        : PackedVector2Array 

func _ready():
	pass
