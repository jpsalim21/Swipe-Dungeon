extends Unit

@onready var game_controller: GameController = %GameController

func setTileAtual(value : Vector2i):
	_tileAtual = value
	global_position = tilemap.map_to_local(value)

func _ready() -> void:
	await get_tree().create_timer(0.1).timeout #Solução estúpida para evitar os problemas de ordem de ready
	'''
	O que aconteceu é que: ao instanciar a moeda, ela busca pelo game controller e tilemap(variável herdada)
	fora da root, sozinha. Então, a função ready é chamada antes de entrar na cena (não era pra ser assim,
	mas por algum motivo está sendo). Enfim, a solução é esperar alguns pequenos segundos para dar tempo de entrar na cena
	'''
	super._ready()
	if not game_controller: game_controller = get_node("/root/Node2D/GameController")
	var tile : Tile = tilemap.map[_tileAtual]
	tile.playerUnitEntrou.connect(pickCoin) 

func pickCoin():
	game_controller.coins += 1
	queue_free()
