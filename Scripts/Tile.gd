class_name Tile
extends Object

var anterior : Vector2i
var custo : int
var ocupado : bool = false

func _init(_anterior : Vector2i, _custo : int) -> void:
	anterior = _anterior
	custo = _custo
