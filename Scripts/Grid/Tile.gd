class_name Tile
extends Object

signal playerUnitEntrou


var anterior : Vector2i
var custo : int
var ocupado : bool:
	get():
		return unit != null
var unit : Unit = null
var playerUnit : bool = false:
	set(value):
		playerUnit = value
		if value:
			playerUnitEntrou.emit()

func _init(_anterior : Vector2i, _custo : int) -> void:
	anterior = _anterior
	custo = _custo

func takeDmg(isPlayer : bool):
	if isPlayer and playerUnit:
		return
	if unit:
		unit.takeDmg()
