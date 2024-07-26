extends Control

class_name InventoryItems

@export var debug_items = false


# needs to contain the item, a slot_id reference, and a node_id reference
var inventory_items: Array


func _ready():
	if debug_items:
		inventory_items = [ItemInSlot.new("fire", null), ItemInSlot.new("sulfur", null), ItemInSlot.new("earth", null), ItemInSlot.new("salt", null), ItemInSlot.new("quicksilver", null),  ItemInSlot.new("silver", null)]
	_set_available_items()


func _process(delta):
	pass


func set_item(item_index, slot_id, node_id):
	var item = inventory_items[item_index]
	item.slot_id = slot_id
	item.node_id = node_id
	
	_set_available_items()


func clear_item(slot_id, node_id):
	for item in inventory_items:
		if item.slot_id == slot_id && item.node_id == node_id:
			item.slot_id = null
			item.node_id = null
	_set_available_items()
	

func _set_available_items():
	var box: HBoxContainer = get_parent().get_node("MockUI/InventoryContainer")
	
	# clear existing
	for child in box.get_children():
		child.queue_free()
	
	for i in inventory_items.size():
		var item = inventory_items[i]
		var new_item = ItemDraggable.new(item.item_key, item.slot_id, i)
		new_item.from_inventory = true
		
		box.add_child(new_item)
