extends Node2D

#Externs
@onready var tilemap: TileMapLayer = %tilemap

#Interns
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

#Variables
var tileAtual : Vector2i:
	set(value):
		tileAtual = value
		global_position = tilemap.map_to_local(value)

func _ready() -> void:
	tileAtual = tilemap.local_to_map(global_position)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Down"):
		tileAtual = tileAtual + Vector2i.DOWN
		sprite.play("Down")
		sprite.flip_h = false
	elif event.is_action_pressed("Left"):
		tileAtual = tileAtual + Vector2i.LEFT
		sprite.play("Side")
		sprite.flip_h = false
	elif event.is_action_pressed("Right"):
		tileAtual = tileAtual + Vector2i.RIGHT
		sprite.play("Side")
		sprite.flip_h = true
	elif event.is_action_pressed("Up"):
		tileAtual = tileAtual + Vector2i.UP
		sprite.play("Up")
		sprite.flip_h = false
