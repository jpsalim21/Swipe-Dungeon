extends Node2D

@onready var tilemap: Gridmap = %tilemap

var tileAtual : Vector2i:
	set(value):
		if tilemap.getOcupado(value):
			return
		tilemap.setOcupado(tileAtual, false)
		tileAtual = value
		tilemap.setOcupado(tileAtual)
		var tween : Tween = create_tween()
		tween.tween_property(self, "global_position", tilemap.map_to_local(value), 0.2)

func _ready() -> void:
	tileAtual = tilemap.local_to_map(global_position)

func doTurn():
	tileAtual = tilemap.map[tileAtual].anterior


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		doTurn()
