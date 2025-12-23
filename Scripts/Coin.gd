extends Unit

@onready var game_controller: GameController = %GameController

func setTileAtual(value : Vector2i):
	if tilemap.getOcupado(value):
		return
	_tileAtual = value
	global_position = tilemap.map_to_local(value)

func _ready() -> void:
	super._ready()
	var tile : Tile = tilemap.map[_tileAtual]
	tile.playerUnitEntrou.connect(pickCoin)

func pickCoin():
	game_controller.coins += 1
	queue_free()
