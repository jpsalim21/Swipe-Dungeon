class_name PlayerController
extends Node2D

@onready var game_controller: GameController = %GameController
@onready var timer: Timer = $Timer
@onready var walk_sound: AudioStreamPlayer = $WalkSound

var playerUnits : Array[PlayerUnit] = []

var dirMoving : Vector2i = Vector2i.ZERO

var esperando : bool = false

func _ready() -> void:
	for c in get_children():
		if c is not PlayerUnit:
			continue
		playerUnits.append(c as PlayerUnit)
		c.playerController = self as PlayerController
	game_controller.enemyEndTurn.connect(pararDeEsperar)

func pararDeEsperar():
	esperando = false

func _unhandled_input(event: InputEvent) -> void:
	if esperando:
		return
	if event.is_action_pressed("Down"):
		move(Vector2i.DOWN, "Down")
	elif event.is_action_pressed("Left"):
		move(Vector2i.LEFT, "Side")
	elif event.is_action_pressed("Right"):
		move(Vector2i.RIGHT, "Side", true)
	elif event.is_action_pressed("Up"):
		move(Vector2i.UP, "Up")

func move(dir : Vector2i, anim : String, flip_h : bool = false):
	if not timer.is_stopped():
		return
	
	dirMoving = dir
	playerUnits.sort_custom(sortCustom)
	for p in playerUnits:
		p.move(dir, anim, flip_h)
	
	timer.start(0.3)
	await timer.timeout
	timer.stop()
	walk_sound.play()
	game_controller.playerEndTurn.emit()
	esperando = true

func sortCustom(a : PlayerUnit, b : PlayerUnit):
	var diff : Vector2i = a._tileAtual - b._tileAtual
	if dirMoving.x > 0:
		if diff.x > 0:
			return true
		else:
			return false
	elif dirMoving.x < 0:
		if diff.x < 0:
			return true
		else:
			return false
	elif dirMoving.y < 0:
		if diff.y < 0:
			return true
		else:
			return false
	elif dirMoving.y > 0:
		if diff.y > 0:
			return true
		else:
			return false

func unitMorreu(unit : PlayerUnit):
	SceneController.setPositionFocus(unit.global_position)
	SceneController.reloadCurrentScene()
