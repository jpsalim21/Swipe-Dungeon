extends Node2D

@export var elementos : Array[Node2D] = []


func _process(_delta: float) -> void:
	var media : Vector2 = Vector2.ZERO
	for pos in elementos:
		media += pos.global_position
	global_position = media / elementos.size()
