extends Area2D

signal node_selected


func _ready():
	pass


func _process(delta):
	pass

func _on_node_selected(node: BeaconNode):
	# NOTE.jmc - eventually i intend to hold node connections here, which we'll need
	#		for the selection menu.  for now i'm encapsulating the node selection event
	#		here with the intent to enhance it with more info later.
	node_selected.emit(node)

