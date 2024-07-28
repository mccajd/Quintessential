extends TileMap
class_name InteractableMapper

enum LAYERS {
	MISC, BACKGROUND, FOREGROUND, INTERACTABLES, OBSTACLES, TRANSITIONS,
}
var interactable_scene = preload("res://Scenes/interactable.tscn")
var half_tile := self.tile_set.tile_size*0.5

signal character_entered

func _ready():
	replace_tiles()
	
	
#replace tile with packaged scene that the player can interact with
func replace_tiles():
	for tile_pos in get_used_cells(LAYERS.INTERACTABLES):
		# To know specifically what interactable was hit/what item to give:
		# Create a const with coordinate ranges mapped to items
		# Then get that specific item and set it on interactable itself.
		var new_scene : Interactable = interactable_scene.instantiate()
		new_scene.update_position(map_to_local(tile_pos))
		new_scene.body_entered.connect(_on_body_entered)
		add_child(new_scene)
		erase_cell(LAYERS.INTERACTABLES, tile_pos)


func _on_body_entered(body):
	if body is player:
		character_entered.emit(self)
