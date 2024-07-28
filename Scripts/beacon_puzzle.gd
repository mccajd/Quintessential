class_name BeaconPuzzle
extends Control

@export var for_room: String

@export var required_prime: String
@export var required_element: String
@export var required_metal: String

signal menu_toggled(opened: bool)


func _ready():
	if required_prime:
		get_node("BeaconTower/BeaconRecepticle1").expected_input = required_prime
	if required_element:
		get_node("BeaconTower/BeaconRecepticle2").expected_input = required_element
	if required_metal:
		get_node("BeaconTower/BeaconRecepticle3").expected_input = required_metal


func _on_menu_toggled(opened: bool):
	menu_toggled.emit(opened)


func set_visibility(value):
	# close the menu "properly"
	get_node("MockUI/BeaconNodeView/BeaconNodeMenu/ShowNodeMenuButton")._on_clicked(null)
	
	get_node("BeaconTower").visible = value
	get_node("InventoryItems").visible = value
	get_node("MockUI/InventoryContainer").visible = value
	get_node("MockUI/InventorySlotsContainer").visible = value
	get_node("MockUI/ThreePrimesContainer").visible = value
	get_node("MockUI/ThreePrimesContainerBackdrop").visible = value
	
	self.visible = value


func set_item(item_name):
	get_node("InventoryItems").set_item(item_name, true)
