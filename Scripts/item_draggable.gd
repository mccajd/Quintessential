extends TextureRect

class_name ItemDraggable

var item_key: String


func _init(key: String):
	item_key = key


func _ready():
	var item = Items.itemDB.get(item_key)
	texture = load(item.sprite)


func _process(_delta):
	pass
