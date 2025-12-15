extends Node

@export var playerUnit : PlayerUnit
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D2

func _ready() -> void:
	playerUnit.movimentou.connect(atacar)
	playerUnit.travouMovimento.connect(atacar)

func atacar(dir : Vector2i):
	var tileAlvo : Vector2i = playerUnit.tileAtual + dir
	playerUnit.tilemap.causeDmg(tileAlvo, true)
	if dir.x != 0:
		sprite.rotation_degrees = 0
		sprite.flip_h = dir.x > 0
		tileAlvo.y += 1
		playerUnit.tilemap.causeDmg(tileAlvo, true)
		tileAlvo.y -= 2
		playerUnit.tilemap.causeDmg(tileAlvo, true)
	elif dir.y != 0:
		sprite.rotation_degrees = 90
		sprite.flip_h = dir.y > 0
		tileAlvo.x += 1
		playerUnit.tilemap.causeDmg(tileAlvo, true)
		tileAlvo.x -= 2
		playerUnit.tilemap.causeDmg(tileAlvo, true)
	sprite.play("Attack")
