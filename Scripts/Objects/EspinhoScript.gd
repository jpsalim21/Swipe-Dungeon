extends Unit

const turnosInativa : int = 2

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_controller : GameController = %GameController
var ativo : bool = false
var turnosAtual : int = 2

func setTileAtual(value : Vector2i):
	_tileAtual = value
	global_position = tilemap.map_to_local(value)

func _ready() -> void:
	super._ready()
	
	var tile : Tile = tilemap.map[_tileAtual]
	tile.playerUnitEntrou.connect(unitEntrou)
	tile.otherUnitEntrou.connect(unitEntrou)
	game_controller.playerEndTurn.connect(mudaEstado)

func unitEntrou():
	if not ativo:
		return
	
	var tile : Tile = tilemap.map[_tileAtual]
	tile.takeDmg(true)
	tile.takeDmg(false)

func mudaEstado():
	if !ativo:
		turnosAtual -= 1
	else:
		turnosAtual = 0
	
	if turnosAtual <= 0:
		turnosAtual = turnosInativa
		ativo = !ativo
		if ativo:
			sprite.play("active")
			unitEntrou()
		else:
			sprite.play("default")
