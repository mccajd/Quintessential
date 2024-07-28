extends Area2D
class_name Interactable

var item_name
signal item_discovered(item_name)

func _process(delta):
	pass

func update_position(coords:Vector2i):
	position = coords


func _on_body_entered(body):
	if body is player && item_name != null:
		item_discovered.emit(item_name)
