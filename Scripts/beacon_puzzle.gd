class_name BeaconPuzzle
extends Control

signal menu_toggled(opened: bool)


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
	
	self.visible = value
