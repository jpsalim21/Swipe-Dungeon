extends Node2D

var playerUnits : Array[PlayerUnit] = []

var dirMoving : Vector2i = Vector2i.ZERO

func _ready() -> void:
	for c in get_children():
		playerUnits.append(c as PlayerUnit)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Down"):
		move(Vector2i.DOWN, "Down")
	elif event.is_action_pressed("Left"):
		move(Vector2i.LEFT, "Side")
	elif event.is_action_pressed("Right"):
		move(Vector2i.RIGHT, "Side", true)
	elif event.is_action_pressed("Up"):
		move(Vector2i.UP, "Up")

func move(dir : Vector2i, anim : String, flip_h : bool = false):
	dirMoving = dir
	playerUnits.sort_custom(sortCustom)
	for p in playerUnits:
		p.move(dir, anim, flip_h)


func sortCustom(a : PlayerUnit, b : PlayerUnit):
	var diff : Vector2i = a.tileAtual - b.tileAtual
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
