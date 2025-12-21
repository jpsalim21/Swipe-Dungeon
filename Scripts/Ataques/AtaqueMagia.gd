extends Node2D

@onready var player: PlayerUnit = $".."
const FIREBALL = preload("uid://ck5k4gngy421i")

func _ready() -> void:
	player.movimentou.connect(atacar)
	player.travouMovimento.connect(atacar)

func atacar(dir : Vector2i):
	var fb : Fireball = FIREBALL.instantiate() as Fireball
	fb.setup(Vector2(dir.x, dir.y))
	fb.global_position = global_position
	get_tree().current_scene.add_child(fb)
