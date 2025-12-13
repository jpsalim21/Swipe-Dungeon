extends Node

@export var playerUnit : PlayerUnit

func _ready() -> void:
	playerUnit.movimentou.connect(atacar)

func atacar(dir : Vector2i):
	var tileAlvo : Vector2i = playerUnit.tileAtual + dir
	playerUnit.tilemap.causeDmg(tileAlvo)
