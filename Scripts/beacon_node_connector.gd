extends Node2D

@export var connection: Array[int]
var enabled: bool

# TODO.jmc - evaluate whether it makes sense to store refs to the connected nodes here.

func _ready():
	enabled = false

func _process(delta):
	if enabled:
		$AnimatedSprite2D.play("on")
		return
	$AnimatedSprite2D.play("off")

func enable():
	enabled = true
	
func disable():
	enabled = false


func _on_beacon_tower_connections_updated(connections):
	for connection_array in connections:
		if Helpers.compare_arrays(connection, connection_array):
			enable()
			return
	disable()
