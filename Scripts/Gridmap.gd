class_name Gridmap
extends TileMapLayer

@export var crystalNode : Node2D

var map : Dictionary[Vector2i, Tile] = {}

var usedCells : Array[Vector2i] = []

func _ready() -> void:
	usedCells = get_used_cells()
	var alvo = local_to_map(crystalNode.global_position)
	calculatePathfinding(alvo, alvo)
	setOcupado(alvo)

func calculatePathfinding(alvo : Vector2i, anterior : Vector2i, custo : int = 0):
	if alvo not in usedCells:
		return
	if !map.has(alvo):
		var newTile : Tile = Tile.new(anterior, custo)
		map[alvo] = newTile
	else:
		if map[alvo].custo > custo:
			map[alvo].custo = custo
			map[alvo].anterior = anterior
		else:
			return
	#Calculate to neighbours
	calculatePathfinding(alvo + Vector2i.UP, alvo, custo + 1)
	calculatePathfinding(alvo + Vector2i.DOWN, alvo, custo + 1)
	calculatePathfinding(alvo + Vector2i.LEFT, alvo, custo + 1)
	calculatePathfinding(alvo + Vector2i.RIGHT, alvo, custo + 1)

func setOcupado(tile : Vector2i, ocupado : bool = true):
	map[tile].ocupado = ocupado

func getOcupado(tile : Vector2i) -> bool:
	if map.has(tile):
		return map[tile].ocupado
	return true
