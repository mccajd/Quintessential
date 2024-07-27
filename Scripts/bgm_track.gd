class_name BgmTrack

var intro: AudioStream
var beat: AudioStream
var part: AudioStream
var full: AudioStream

var now_playing: AudioStream
var full_once: bool = false
var beat_once: bool = false
var part_once: bool = false


func _init(i: AudioStream, b: AudioStream, p: AudioStream, f: AudioStream):
	intro = i
	beat = b
	part = p
	full = f


func next():
	now_playing = _get_next_track()
	return now_playing


func restart():
	now_playing = null


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
		_:
			return intro
