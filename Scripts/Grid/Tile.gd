class_name Tile
extends Object

var anterior : Vector2i
var custo : int
var ocupado : bool:
	get():
		return unit != null
var unit : Unit = null

var cristal : bool = false

func _init(_anterior : Vector2i, _custo : int) -> void:
	anterior = _anterior
	custo = _custo

func takeDmg():
	if unit:
		unit.takeDmg()
