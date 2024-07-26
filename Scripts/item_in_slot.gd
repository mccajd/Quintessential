extends Node

class_name ItemInSlot

var item_key: String
var slot_id
var node_id

func _init(key, id):
	item_key = key
	slot_id = id
