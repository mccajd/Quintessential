extends Area2D

@export var id: int
@export var inputs: Array[String]

@export var expected_input: String

func complete():
	return inputs.find(expected_input) > -1
