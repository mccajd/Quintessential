extends TileMap

## This script will take all the tiles in a given scene and setup their properties
##  - Obstacles that the player cannot move through with be set
##  - Tiles that represent interactables will be swapped with their interactable counter part

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# TODO.hmw implement function to set a given tile from an atlas to be solid point
# Atlas temp-tiles | coords (2,0)
func set_solid_tiles():
	pass

# TODO.hmw implement function to replace a given tile with a scene the player can
# interact with by clicking on the tile. Should these tiles also be excluded fro A*?
# what happens when you click on a solid tile? Guess I gotta learn me a navigation
# Atlast temp-tiles | coords (1,0)
func create_interactables():
	pass
