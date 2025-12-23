class_name TileButton
extends Node2D

signal pressionado(botao : TileButton)

@onready var tilemap: Gridmap = %tilemap
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var tilePos : Vector2i:
	set(value):
		tilePos = value
		global_position = tilemap.map_to_local(value)

func _ready() -> void:
	tilePos = tilemap.local_to_map(global_position)
	var tile : Tile = tilemap.map[tilePos]
	tile.playerUnitEntrou.connect(playerUnitEntrou)


func playerUnitEntrou():
	sprite.play("Pressed")
	pressionado.emit(self as TileButton)
	print("Botão pressionado!")
