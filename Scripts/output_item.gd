extends Node

class_name OutputItem

@export var item_key: String
# i swear if i find out that int is the one exception to the "always nullable"
# obsession that godot seems to have, i'm gonna blow a gasket
# update: BAHAHAHAHA HAHAHAHAH AAAHAHAHAH FUCK
@export var destination_node: int
# can use this to set an additional option (e.g., if its a metal ascension and 
# we need the player to choose a specific metal)
@export var additional_transformation: String

func _init(item: String):
	item_key = item
