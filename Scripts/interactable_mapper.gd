extends TileMap
class_name InteractableMapper

enum LAYERS {
	MISC, BACKGROUND, FOREGROUND, INTERACTABLES, OBSTACLES, TRANSITIONS,
}
var interactable_scene = preload("res://Scenes/interactable.tscn")
var half_tile := self.tile_set.tile_size*0.5

signal item_discovered(item_name)

func _ready():
	pass #replace_tiles()


func set_from_config(config: LevelConfigValue, available_areas = ["hub"]):
	replace_tiles(config.world_items, config.item_mappings)
	set_accessible_areas(config.transition_rects, available_areas)


#replace tile with packaged scene that the player can interact with
func replace_tiles(items, mappings: Dictionary):
	for tile_pos in get_used_cells(LAYERS.INTERACTABLES):
		var item_to_use
		# To know specifically what interactable was hit/what item to give:
		# Create a const with coordinate ranges mapped to items
		# Then get that specific item and set it on interactable itself.
		for item in items:
			var rect = mappings[item].rect
			if rect.has_point(tile_pos):
				item_to_use = item
				break
		var new_scene : Interactable = interactable_scene.instantiate()
		new_scene.update_position(map_to_local(tile_pos))
		new_scene.item_discovered.connect(_on_item_discovered)
		if item_to_use:
			new_scene.item_name = item_to_use
		add_child(new_scene)
		erase_cell(LAYERS.INTERACTABLES, tile_pos)


func set_accessible_areas(transition_rects, accessible_area_list):
	# only one way out
	if !transition_rects || transition_rects.size() < 2: return
	
	var inaccessible_areas = transition_rects.filter(func(x): return accessible_area_list.find(x.destination) == -1)
	
	for tile_pos in get_used_cells(LAYERS.TRANSITIONS):
		for area in inaccessible_areas:
			if !area.rect.has_point(tile_pos): continue
			erase_cell(LAYERS.TRANSITIONS, tile_pos)
			set_cell(LAYERS.OBSTACLES, tile_pos, 3, Vector2i(2, 0))

func _on_item_discovered(item):
	item_discovered.emit(item)
