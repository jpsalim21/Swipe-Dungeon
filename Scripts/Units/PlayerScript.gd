class_name PlayerUnit
extends Unit

#Interns
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

var playerController : PlayerController = null

func move(dir : Vector2i, anim : String, flip_h : bool = false):
	setTileAtual(_tileAtual + dir)
	sprite.play(anim)
	sprite.flip_h = flip_h
	animation.stop()
	animation.play("Move")

func takeDmg():
	playerController.parado = true
	animation.play("Die")
	await animation.animation_finished
	playerController.unitMorreu(self as PlayerUnit)

func setOcupado(tile : Vector2i):
	tilemap.setOcupado(tile, self as PlayerUnit, true)
