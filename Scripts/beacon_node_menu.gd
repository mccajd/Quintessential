extends Area2D

var playerView = null

var selected_node: BeaconNode

func _ready():
	visible = false
	input_pickable = false
	playerView = get_parent().get_parent().get_node("PlayerView").get_children()

func _process(delta):
	get_node("SelectedNodeLabel").text = selected_node.name if selected_node else "none"
	get_node("SelectedTransformationLabel").text = selected_node.selected_transformation if selected_node else "neutral"

func _on_beacon_tower_node_selected(node: BeaconNode):
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

func _on_transformation_type_selected(type: String):
	selected_node.set_transformation(type)
