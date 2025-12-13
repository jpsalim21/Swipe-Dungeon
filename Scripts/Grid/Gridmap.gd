class_name Gridmap
extends TileMapLayer

@export var crystalNode : Node2D

var map : Dictionary[Vector2i, Tile] = {}

var usedCells : Array[Vector2i] = []

func _ready() -> void:
	usedCells = get_used_cells()
	var alvo = local_to_map(crystalNode.global_position)
	calculatePathfinding(alvo, alvo)
	map[alvo].cristal = true

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

func setOcupado(tile : Vector2i, unit : Unit):
	map[tile].unit = unit

func getOcupado(tile : Vector2i) -> bool:
	if map.has(tile):
		return map[tile].ocupado or map[tile].cristal
	return true

func getUnit(tile : Vector2i):
	if map.has(tile):
		return map[tile].unit
	return null

func causeDmg(tile : Vector2i):
	if map.has(tile):
		print("Map has tile", tile)
		map[tile].takeDmg()
	print("Map has not tile", tile)

'''
# Manter em comentário, pois pode dar uma mecânica interessante
func empurrar(tile : Vector2i, dir : Vector2i):
	if !map[tile].ocupado or map[tile].cristal:
		return
	empurrar(tile + dir, dir)
	map[tile].unit.tileAtual = tile + dir
'''
