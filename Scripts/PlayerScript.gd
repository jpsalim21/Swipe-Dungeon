extends Node2D

#Externs
@onready var tilemap: Gridmap = %tilemap

#Interns
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

#Variables
var tileAtual : Vector2i:
	set(value):
		if tilemap.getOcupado(value):
			return
		tilemap.setOcupado(tileAtual, false)
		tileAtual = value
		tilemap.setOcupado(tileAtual)
		var tween : Tween = create_tween()
		tween.tween_property(self, "global_position", tilemap.map_to_local(value), 0.2)

func _ready() -> void:
	tileAtual = tilemap.local_to_map(global_position)

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
