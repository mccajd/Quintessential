extends TextureRect

class_name ItemDraggable

var item_key: String
var item_slot
var item_position: int

func _init(key: String, slot, position: int):
	item_key = key
	item_slot = slot
	item_position = position


func _ready():
	# TODO.jmc - grey this out or maybe hide this if item slot filled
	var item = Items.itemDB.get(item_key)
	texture = load(item.sprite)
	if item_slot != null:
		modulate.a = 0.5
	else:
		modulate.a = 1


func _process(_delta):
	pass


func _get_drag_data(_position):
	# TODO.jmc make sure this works
	if item_slot != null: return
	
	var drag_preview = self.duplicate()
	drag_preview.z_index = 10
	set_drag_preview(drag_preview)
	return self
