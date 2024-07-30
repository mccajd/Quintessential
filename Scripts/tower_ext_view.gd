extends Node

signal game_over

@onready var timer = $GameTimer
@onready var tower = $AnimatedSprite2D

var max_frames = 10

@export var tower_progress : int = -1

func _ready():
	timer.autostart = true
	timer.one_shot = false
	
	if tower_progress > -1:
		tower.play("tower_"+str(tower_progress))

func _on_game_timer_timeout():
	progress_shadows()
	
func progress_shadows():
	tower_progress += 1
	tower.play("tower_"+str(tower_progress))
	if tower_progress == max_frames:
		timer.stop()
		game_over.emit()
	
func regress_shadows():
	if tower_progress-7 > 0:
		tower_progress -= 7
	else:
		tower_progress = 0
	tower.play("tower_"+str(tower_progress))
