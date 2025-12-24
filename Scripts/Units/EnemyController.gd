extends Node2D

@onready var game_controller: GameController = %GameController
@onready var timer: Timer = $Timer

var units : Array[EnemyUnit] = []

func _ready() -> void:
	for c in get_children():
		if c is not EnemyUnit:
			continue
		units.append(c)
	game_controller.playerEndTurn.connect(doTurn)

func doTurn():
	for u in units:
		if u == null:
			continue
		u.doTurn()
	timer.start(0.05)
	await timer.timeout
	game_controller.enemyEndTurn.emit()
