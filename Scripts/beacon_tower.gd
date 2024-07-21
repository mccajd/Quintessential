extends Area2D

var node_outputs: Dictionary

const node_names = ["BeaconNode1", "BeaconNode2", "BeaconNode3", "BeaconNode4", "BeaconNode5", "BeaconNode6", "BeaconNode7"]

signal node_selected
signal connections_updated

func _ready():
	pass


func _process(delta):
	_set_connectors()


func _on_node_selected(node: BeaconNode):
	# TODO.jmc - eventually i intend to hold node connections here, which we'll need
	#		for the selection menu.  for now i'm encapsulating the node selection event
	#		here with the intent to enhance it with more info later.
	node_selected.emit(node)


func _on_transformed(node_id: int, output_items: Array[OutputItem]):
	node_outputs[node_id] = output_items


func _set_connectors():
	# note - this is called every frame.  if this turns out to be non-performant
	#  i'll come back to it
	var connections = []
	
	for name in node_names:
		var beacon_node = get_node(name)
		for connection in beacon_node.get_active_connections():
			connections.push_front([beacon_node.id, connection])
	
	connections_updated.emit(connections)
	
