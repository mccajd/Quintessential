extends CharacterBody2D
class_name player

signal change_room(String, Vector2i)

const speed = 2

var astar_grid  : AStarGrid2D
@onready var tile_map : TileMap  = get_parent().find_child("TileMap")
var tile_size   : Vector2i = Vector2i.ZERO
var start_tile  : Vector2i = Vector2i.ZERO:
	get:
		return start_tile
	set(vector):
		start_tile = tile_map.local_to_map(vector)

var target_tile : Vector2i = Vector2i.ZERO:
	get:
		return target_tile
	set(vector):
		target_tile = tile_map.local_to_map(vector)

var path        : PackedVector2Array 

func _ready():
	#configure A*
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = tile_size
	astar_grid.offset = Vector2i.ZERO

	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	
	set_solid_tiles()

func _physics_process(delta):
	move_and_collide(velocity)

func _input(event):
	if event.is_action_pressed("select"):
		target_tile = get_global_mouse_position()
		start_tile  = position-Vector2(32,32)

		path = pathfinder(start_tile, target_tile)
		print(path)

func pathfinder(start:Vector2i, end:Vector2i)->PackedVector2Array:
	return astar_grid.get_point_path(start, end)

func direction_to_point():
	pass

func find_valid_dest(cur_dest:Vector2i)->Vector2i:
	return cur_dest

func set_solid_tiles():
	pass
