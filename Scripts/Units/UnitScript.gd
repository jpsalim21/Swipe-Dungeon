class_name Unit
extends Node2D

signal movimentou(dir : Vector2i)
signal travouMovimento(newTile : Vector2i)

@onready var tilemap: Gridmap = %tilemap

var tileInicial : bool = true

var tileAtual : Vector2i:
	set(value):
		if tilemap.getOcupado(value):
			travouMovimento.emit(value)
			estavaOcupado(value)
			return
		tilemap.setOcupado(tileAtual, null)
		var dir : Vector2i = value - tileAtual
		tileAtual = value
		if !tileInicial:
			movimentou.emit(dir)
		else:
			tileInicial = false
		setOcupado(tileAtual)
		var tween : Tween = create_tween()
		tween.tween_property(self, "global_position", tilemap.map_to_local(value), 0.2)

func setOcupado(tile : Vector2i):
	tilemap.setOcupado(tile, self)

func estavaOcupado(value : Vector2i):
	pass

func _ready() -> void:
	tileAtual = tilemap.local_to_map(global_position)

func takeDmg():
	pass
