extends AudioStreamPlayer

func _ready():
	finished.connect(play)
	stream = load("res://assets/bgm/maintitle.wav")
	#play()
