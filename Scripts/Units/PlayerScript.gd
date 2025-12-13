class_name PlayerUnit
extends Unit

#Interns
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

var turnosFora : int = 0

func move(dir : Vector2i, anim : String, flip_h : bool = false):
	tileAtual = tileAtual + dir
	sprite.play(anim)
	sprite.flip_h = flip_h
	animation.stop()
	animation.play("Move")

func takeDmg():
	print("Tomei dano no player")
	turnosFora = 2

func setOcupado(tile : Vector2i):
	tilemap.setOcupado(tile, self as PlayerUnit, true)
