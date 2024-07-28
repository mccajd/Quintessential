extends CharacterBody2D
class_name player

signal change_room(Vector2i)

const speed = 2

@onready var tile_map : TileMap  = get_parent().find_child("TileMap")
@onready var tile_size : Vector2i = tile_map.tile_set.tile_size

var change_rooms_on_stop = false

var path : PackedVector2Array 
var prev_tile : Vector2i
var astar_grid : AStarGrid2D
var start_tile : Vector2i = Vector2i.ZERO:
	get:
		return start_tile
	set(vector):
		start_tile = tile_map.local_to_map(vector)

var target_tile : Vector2i = Vector2i.ZERO:
	get:
		return target_tile
	set(vector):
		target_tile = tile_map.local_to_map(vector)

func _ready():
	#configure A*

	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = tile_size
	astar_grid.offset = Vector2i.ZERO

	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_AT_LEAST_ONE_WALKABLE
	astar_grid.update()
	
	set_solid_tiles()

func _physics_process(delta):
	if !path.is_empty():
		velocity = speed*direction_to_point(position-Vector2(8,8), path[0])
	else:
		velocity = Vector2.ZERO
	
	if change_rooms_on_stop && path.is_empty():
		# "Time to blow this popsicle stand" - hmw
		change_room.emit(target_tile)
		change_rooms_on_stop = false
		return
		
	var collision = move_and_collide(velocity)
	
	if collision:
		print("collision ", collision.get_collider().name)
		path.clear()
		position = tile_map.map_to_local(start_tile)
	
	var data = tile_map.get_cell_tile_data(tile_map.LAYERS.TRANSITIONS, target_tile)

	if data: change_rooms_on_stop = true

func direction_to_point(src:Vector2i, dest:Vector2i)->Vector2:
	if dest != src:
		#direction vector of A->B = (B.X-A.X)(B.Y-A.Y)
		return sign(dest-src)
	prev_tile = path[0]
	path.remove_at(0)
	return Vector2.ZERO

func _input(event):
	# ignore input if the player is changing rooms
	if change_rooms_on_stop: return
	
	if event.is_action_pressed("select"):
		target_tile = get_global_mouse_position()
		start_tile  = position-Vector2(8,8)

		path = pathfinder(start_tile, target_tile)

func pathfinder(start:Vector2i, end:Vector2i)->PackedVector2Array:
	var base_path = Vector2i.ZERO

	if astar_grid.is_point_solid(target_tile):
		end = find_valid_dest(end)

	return astar_grid.get_point_path(start, end)

func find_valid_dest(cur_dest:Vector2i)->Vector2i:
	if !astar_grid.is_point_solid(target_tile):
		return cur_dest
	
	var neighbor = cur_dest

	# TODO.hmw a more robust algorithm for finding the optimal destination when given a solid
	# point should be devised, but this is Good 'nuff:TM: for now
	for cell in range(tile_map.tile_set.CELL_NEIGHBOR_RIGHT_SIDE,
						tile_map.tile_set.CELL_NEIGHBOR_TOP_RIGHT_CORNER+1):
		neighbor = tile_map.get_neighbor_cell(cur_dest, cell)
		
		if !astar_grid.is_point_solid(neighbor):
			return neighbor
	
	return neighbor

func set_solid_tiles():
	for tile_pos in tile_map.get_used_cells(tile_map.LAYERS.OBSTACLES):
		astar_grid.set_point_solid(tile_pos)


func set_camera_limit(left, right, top, bottom):
	if left != null:
		$Camera2D.limit_left = left
	if right != null:
		$Camera2D.limit_right = right
	if top != null:
		$Camera2D.limit_top = top
	if bottom != null:
		$Camera2D.limit_bottom = bottom
