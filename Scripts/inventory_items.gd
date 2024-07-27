extends Control

class_name InventoryItems

@export var enable_debug_items = false
@export var debug_items: Array[String]

# needs to contain the item, a slot_id reference, and a node_id reference
var inventory_items: Array


func _ready():
	if enable_debug_items:
		for item_key in debug_items:
			set_item(item_key)
	_set_available_items()


func _process(delta):
	pass


func set_item(item_key):
	inventory_items += [ItemInSlot.new(item_key, null)]


func set_item_slot(item_index, slot_id, node_id):
	var item = inventory_items[item_index]
	item.slot_id = slot_id
	item.node_id = node_id
	
	_set_available_items()


func clear_item_slot(slot_id, node_id):
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
		if _is_prime(item):
			_set_prime(item, i)
			continue
		var new_item = ItemDraggable.new(item.item_key, item.slot_id, i)
		new_item.from_inventory = true
		
		box.add_child(new_item)


func _is_prime(item):
	return Items.itemDB[item.item_key].type == Item.ItemType.Prime


func _set_prime(item, i):
	var container_name = ""
	match item.item_key:
		"salt":
			container_name = "SaltContainer"
		"quicksilver":
			container_name = "QuicksilverContainer"
		"sulfur":
			container_name = "SulfurContainer"
		_:
			# surprise surprise, godot doesn't actually seem to have a throw keyword
			print("how the hell?")
			return
	var container: HBoxContainer = get_parent().get_node("MockUI/ThreePrimesContainer")
	var prime_container = container.get_node(container_name)
	
	# clear current container
	for child in prime_container.get_children():
		child.queue_free()
	
	var new_item = ItemDraggable.new(item.item_key, item.slot_id, i)
	new_item.is_prime = true
	new_item.from_inventory = true
	new_item.z_index = 1

	prime_container.add_child(new_item)

