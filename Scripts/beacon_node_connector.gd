extends Node2D

@export var connection: Array[int]
var enabled: bool
var previous_connections_count = 0

var desync_id = 0

# TODO.jmc - evaluate whether it makes sense to store refs to the connected nodes here.

func _ready():
	get_parent().connections_updated.connect(_on_beacon_tower_connections_updated)
	enabled = false
	$JustAddedTexture.visible = false

func _process(_delta):
	if enabled:
		$AnimatedSprite2D.play("on")
		return
	$AnimatedSprite2D.play("off")

func enable():
	enabled = true
	
func disable():
	enabled = false


func _on_beacon_tower_connections_updated(connections):
	var existing_connections_count = 0
	for connection_array in connections:
		if Helpers.compare_arrays(connection, connection_array):
			enable()
			existing_connections_count += 1
	if existing_connections_count > previous_connections_count:
		desync_id += 1
		_flash_just_added()
	elif existing_connections_count < previous_connections_count:
		$JustAddedTexture.visible = false
	previous_connections_count = 0 + existing_connections_count
	if existing_connections_count > 0:
		return
	disable()


func _flash_just_added():
	# used to prevent flickering from spamming this
	var local_desync = desync_id
	$JustAddedTexture.visible = true
	await get_tree().create_timer(2).timeout
	if desync_id != local_desync: return
	$JustAddedTexture.visible = false
	
	
	
