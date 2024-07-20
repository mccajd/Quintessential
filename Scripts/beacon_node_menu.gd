extends Area2D

var playerView = null

var selected_node: BeaconNode

func _ready():
	visible = false
	input_pickable = false
	playerView = get_parent().get_parent().get_node("PlayerView").get_children()

func _on_beacon_tower_node_selected(node: BeaconNode):
	get_node("SelectedNodeLabel").text = node.name
	
	# minor UX - clear the current node if selected again.
	if (node == selected_node):
		selected_node = null
		_set_visibility(false)
		return

	selected_node = node
	_set_visibility(true)
	

func _set_visibility(value: bool):
	visible = value
	for child in playerView:
		child.visible = !value
