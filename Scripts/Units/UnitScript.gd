class_name Unit
extends Node2D

signal movimentou(dir : Vector2i)
signal travouMovimento(dir : Vector2i)

@onready var tilemap: Gridmap = %tilemap

var tileInicial : bool = true

var _tileAtual : Vector2i

func setTileAtual(value : Vector2i):
	if tilemap.getOcupado(value):
		travouMovimento.emit(value - _tileAtual)
		estavaOcupado(value)
		return
	tilemap.setOcupado(_tileAtual, null)
	var dir : Vector2i = value - _tileAtual
	_tileAtual = value
	if !tileInicial:
		movimentou.emit(dir)
	else:
		tileInicial = false
	setOcupado(_tileAtual)
	var tween : Tween = create_tween()
	tween.tween_property(self, "global_position", tilemap.map_to_local(value), 0.2)

func setOcupado(tile : Vector2i):
	tilemap.setOcupado(tile, self)

func estavaOcupado(value : Vector2i):
	pass

func _ready() -> void:
	setTileAtual(tilemap.local_to_map(global_position))

func takeDmg():
	pass
