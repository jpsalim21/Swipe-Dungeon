class_name Fireball
extends Area2D

var dir : Vector2
var posInicial : Vector2
var speed : float = 2.0

func setup(_dir : Vector2):
	dir = _dir

func _ready() -> void:
	posInicial = global_position

func _physics_process(delta: float) -> void:
	global_position += dir * speed
	var diff = global_position.distance_to(posInicial)
	if diff > 16 * 4:
		queue_free()
