extends Unit

@export var nextPhasePath : StringName

func setTileAtual(value : Vector2i):
	_tileAtual = value
	global_position = tilemap.map_to_local(value)

func _ready() -> void:
	super._ready()
	var tile : Tile = tilemap.map[_tileAtual]
	tile.playerUnitEntrou.connect(playerUnitEntrou)

func playerUnitEntrou():
	SceneController.changeSceneTo(nextPhasePath)
