class_name EnemyUnit
extends Unit

func doTurn():
	tileAtual = tilemap.getNextTile(tileAtual)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		doTurn()

func estavaOcupado(value : Vector2i):
	var playerUnit : PlayerUnit = tilemap.getUnit(value) as PlayerUnit
	if playerUnit:
		playerUnit.takeDmg()

func takeDmg():
	print("Tomei dano")
	queue_free()
