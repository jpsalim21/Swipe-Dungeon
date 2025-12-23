extends Unit

func setTileAtual(value : Vector2i):
	_tileAtual = value
	global_position = tilemap.map_to_local(value)

func _ready() -> void:
	super._ready()
