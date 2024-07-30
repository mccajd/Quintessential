extends Area2D

@export var id: int
var available_items: Array

@export var expected_input: String

signal item_hovered


func _ready():
	if !mouse_entered.is_connected(_on_mouse_entered):
		mouse_entered.connect(_on_mouse_entered)
	
	$BeaconNumber.visible = false
	$RecepticleSymbol.texture = load(_get_symbol_texture())
	$RecepticleSymbol.visible = true


func complete():
	return available_items.find(expected_input) > -1


func set_available_items(items):
	available_items = items


func _process(_delta):
	$RecepticleSymbol.texture = load(_get_symbol_texture())
	# another cheeky way to say "this isn't the sun recepticle"
	if id != 200:
		$RecepticleSymbol.size.x = 84
		$RecepticleSymbol.position.x = 20
	else:
		$RecepticleSymbol.size.x = 112
		$RecepticleSymbol.position.x = 9
		
	if complete():
		$SelectionSprite2D.visible = true
	else:
		$SelectionSprite2D.visible = false


func _on_mouse_entered():
	item_hovered.emit(expected_input)


func _get_symbol_texture():
	if complete():
		match id:
			100: return "res://assets/symbols/moon_wh_symbol.png"
			200: return "res://assets/symbols/sun_wh_symbol.png"
			300: return "res://assets/symbols/moon2_wh_symbol.png"
	else:
		match id:
			100: return "res://assets/symbols/moon_bk_symbol.png"
			200: return "res://assets/symbols/sun_bk_symbol.png"
			300: return "res://assets/symbols/moon2_bk_symbol.png"
