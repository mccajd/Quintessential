extends TileMap
class_name InteractableMapper

enum LAYERS {
	BACKGROUND, FOREGROUND, INTERACTABLES, OBSTACLES, TRANSITIONS,
}
var interactable_scene = preload("res://Scenes/interactable.tscn")
var half_tile := self.tile_set.tile_size*0.5

func _ready():
	print("Tile map ready!")
	replace_tiles()
	
	
func replace_tiles():
	for tile in get_used_cells(LAYERS.INTERACTABLES):
		
