extends AudioStreamPlayer

@export var track_name: String
var flip = false

var tracks = {
	"title": BgmTrack.new(
		load("res://assets/bgm/titleintro.wav"),
		load("res://assets/bgm/titlebeat.wav"),
		load("res://assets/bgm/titlepart.wav"),
		load("res://assets/bgm/titlefull.wav")
	),
	"waltz": BgmTrack.new(
		load("res://assets/bgm/waltzintro.wav"),
		load("res://assets/bgm/waltzbeat.wav"),
		load("res://assets/bgm/waltzpart.wav"),
		load("res://assets/bgm/waltzfull.wav")
	)
}
var current_track: BgmTrack

func _ready():
	finished.connect(_on_finished)
	
	current_track = tracks[track_name] if tracks.has(track_name) else tracks["title"]
	
	stream = current_track.next()
	play()


func _process(_delta):
	pass


func _on_finished():
	stream = current_track.next()
	play()


func set_bgm(track):
	stop()
	current_track.restart()
	if tracks.has(track):
		current_track = tracks[track]
	stream = current_track.next()	
	play()

