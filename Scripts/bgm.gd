extends AudioStreamPlayer

var intro: AudioStream
var beat: AudioStream
var part: AudioStream
var full: AudioStream

var now_playing: AudioStream
var full_once: bool = false
var beat_once: bool = false
var part_once: bool = false

func _ready():
	finished.connect(_on_finished)
	
	intro = load("res://assets/bgm/waltzintro.wav")
	beat = load("res://assets/bgm/waltzbeat.wav")
	part = load("res://assets/bgm/waltzpart.wav")
	full = load("res://assets/bgm/waltzfull.wav")
	
	_set_now_playing(intro)


func _on_finished():
	_set_now_playing(_get_next_track())


func _set_now_playing(track):
	now_playing = track
	stream = now_playing
	play()

func _get_next_track():
	match now_playing:
		intro:
			return part
		part:
			if part_once:
				part_once = false
				return beat
			part_once = true
			return part
		beat:
			if beat_once:
				beat_once = false
				return part
			beat_once = true
			return full
		full:
			if full_once:
				full_once = false
				return beat
			full_once = true
			return full
		
