extends TileMap
class_name InteractableMapper

enum LAYERS {
	BACKGROUND, FOREGROUND, INTERACTABLES, OBSTACLES, TRANSITIONS,
}
var interactable_scene = preload("res://Scenes/interactable.tscn")
var half_tile := self.tile_set.tile_size*0.5

func _ready():
	replace_tiles()
	
#replace tile with packaged scene that the player can interact with
func replace_tiles():
	for tile_pos in get_used_cells(LAYERS.INTERACTABLES):
		var new_scene : Interactable = interactable_scene.instantiate()
		new_scene.update_position(map_to_local(tile_pos))
		add_child(new_scene)
		erase_cell(LAYERS.INTERACTABLES, tile_pos)
