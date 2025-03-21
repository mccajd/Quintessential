extends TextureRect

class_name ItemDraggable

@export var from_inventory: bool = false
var is_prime: bool = false

@export var item_key: String
var item_slot
var item_position: int

signal item_hovered

func _init(key: String, slot, pos: int):
	item_key = key
	item_slot = slot
	item_position = pos
	mouse_entered.connect(_on_mouse_entered)
	mouse_entered.connect(_on_mouse_exited)


func _ready():
	var item = Items.itemDB.get(item_key)
	texture = load(item.sprite)
	if !is_prime:
		stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
		expand_mode = TextureRect.EXPAND_FIT_WIDTH if from_inventory else TextureRect.EXPAND_FIT_HEIGHT
	
	# reduce sprite opacity if filled
	if item_slot != null:
		modulate.a = 0.5
	else:
		modulate.a = 1


func _process(_delta):
	pass


func _on_mouse_entered():
	item_hovered.emit(item_key)


func _on_mouse_exited():
	pass


func _get_drag_data(_position):
	if item_slot != null: return
	
	var drag_preview = self.duplicate()
	drag_preview.expand_mode = TextureRect.EXPAND_KEEP_SIZE 
	drag_preview.z_index = 10
	set_drag_preview(drag_preview)
	return self
