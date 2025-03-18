extends HSlider

var bus_id: int

func _ready() -> void:
	bus_id = AudioServer.get_bus_index("Master")
	value_changed.connect(_on_audio_changed)
	value = AudioServer.get_bus_volume_linear(bus_id)

func _on_audio_changed(val: float) -> void:
	AudioServer.set_bus_volume_db(bus_id, linear_to_db(val))
