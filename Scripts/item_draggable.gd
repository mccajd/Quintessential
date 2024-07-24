extends TextureRect

class_name ItemDraggable

var item_key: String
var item_slot_name
var item_position: int

func _init(key: String, name, position: int):
	item_key = key
	item_slot_name = name
	item_position = position


func _ready():
	# TODO.jmc - grey this out or maybe hide this if item slot filled
	var item = Items.itemDB.get(item_key)
	texture = load(item.sprite)


func _process(_delta):
	pass


func _get_drag_data(_position):
	# TODO.jmc make sure this works
	if item_slot_name: return
	
	var drag_preview = self.duplicate()
	drag_preview.z_index = 10
	set_drag_preview(drag_preview)
	return self
