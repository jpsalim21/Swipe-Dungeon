class_name PlayerUnit
extends Unit

#Interns
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

var turnosFora : int = 0

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
	tileAtual = tileAtual + dir
	sprite.play(anim)
	sprite.flip_h = flip_h
	animation.play("Move")

func takeDmg():
	print("Tomei dano no player")
	turnosFora = 2
