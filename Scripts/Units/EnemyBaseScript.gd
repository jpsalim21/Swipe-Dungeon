class_name EnemyUnit
extends Unit

func _ready() -> void:
	super._ready()

func doTurn():
	tileAtual = tilemap.getNextTile(tileAtual)

func estavaOcupado(value : Vector2i):
	var playerUnit : PlayerUnit = tilemap.getUnit(value) as PlayerUnit
	if playerUnit:
		playerUnit.takeDmg()

func takeDmg():
	print("Tomei dano")
	queue_free()
