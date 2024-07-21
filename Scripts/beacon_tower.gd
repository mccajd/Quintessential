extends Area2D

var node_outputs: Dictionary

signal node_selected


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
	pass
