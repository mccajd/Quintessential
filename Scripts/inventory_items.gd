extends Control

class_name InventoryItems

# needs to contain the item, a slot_id reference, and a node_id reference
var inventory_items: Array


func _ready():
	var item = ItemInSlot.new("water", null)
	var item2 = ItemInSlot.new("earth", null)
	inventory_items += [item, item2]
	_set_available_items()


func _process(delta):
	pass


func set_item(item_index, slot_id, node_id):
	var item = inventory_items[item_index]
	item.slot_id = slot_id
	item.node_id = node_id
	
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
