class_name Gridmap
extends TileMapLayer


@onready var game_controller: GameController = %GameController
@export var playerUnits : Array[Node2D] = []

var map : Dictionary[Vector2i, Tile] = {}
var pathfindingMap : Dictionary[Vector2i, Tile] = {}

var usedCells : Array[Vector2i] = []

func _ready() -> void:
	usedCells = get_used_cells()
	createGrid()
	recalculateTile()
	game_controller.playerEndTurn.connect(recalculateTile)

func createGrid():
	for cell in usedCells:
		var newTile : Tile = Tile.new(Vector2i.ZERO, int(INF))
		map[cell] = newTile

func calculatePathfinding(alvo : Vector2i, anterior : Vector2i, custo : int = 0):
	if alvo not in usedCells:
		return
	if !pathfindingMap.has(alvo):
		var newTile : Tile = Tile.new(anterior, custo)
		pathfindingMap[alvo] = newTile
	else:
		if pathfindingMap[alvo].custo > custo:
			pathfindingMap[alvo].custo = custo
			pathfindingMap[alvo].anterior = anterior
		else:
			return
	#Treshold to not calculate over everything
	if custo > 6:
		return
	#Calculate to neighbours
	calculatePathfinding(alvo + Vector2i.UP, alvo, custo + 1)
	calculatePathfinding(alvo + Vector2i.DOWN, alvo, custo + 1)
	calculatePathfinding(alvo + Vector2i.LEFT, alvo, custo + 1)
	calculatePathfinding(alvo + Vector2i.RIGHT, alvo, custo + 1)

func recalculateTile():
	pathfindingMap.clear()
	for unit in playerUnits:
		var alvo : Vector2i = local_to_map(unit.global_position)
		calculatePathfinding(alvo, alvo)

func setOcupado(tile : Vector2i, unit : Unit, playerUnit : bool = false):
	map[tile].unit = unit
	map[tile].playerUnit = playerUnit

func getOcupado(tile : Vector2i) -> bool:
	if map.has(tile):
		return map[tile].ocupado
	return true

func getUnit(tile : Vector2i):
	if map.has(tile):
		return map[tile].unit
	return null

func causeDmg(tile : Vector2i, isPlayer : bool = false):
	if map.has(tile):
		map[tile].takeDmg(isPlayer)

func getNextTile(tileAtual : Vector2i):
	var tile : Tile = pathfindingMap.get(tileAtual, null)
	if tile:
		return tile.anterior
	else:
		return tileAtual

'''
# Manter em comentário, pois pode dar uma mecânica interessante
func empurrar(tile : Vector2i, dir : Vector2i):
	if !map[tile].ocupado or map[tile].cristal:
		return
	empurrar(tile + dir, dir)
	map[tile].unit.tileAtual = tile + dir
'''
