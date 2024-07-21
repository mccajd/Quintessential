extends Resource

class_name Item

enum ItemType { Prime, Element, Metal, World, Other }

@export var name: String
@export var description: String
@export var type: ItemType
@export var sprite: Texture2D
@export var id: int
