extends Node2D

@export var elementos : Array[Node2D] = []
@onready var game_controller: GameController = %GameController
@onready var camera_2d: Camera2D = $"../Camera2D"

const euler = 2.71828

func _ready() -> void:
	game_controller.playerEndTurn.connect(recalculate)

func recalculate():
	var media : Vector2 = Vector2.ZERO
	for pos in elementos:
		media += pos.global_position
	global_position = media / elementos.size()
	var diff : Vector2 = global_position - elementos[0].global_position
	var newZoom : float = pow(euler, -diff.length() * 0.2 + 2) + 3
	var tween : Tween = create_tween()
	tween.tween_property(camera_2d, "zoom", Vector2(newZoom, newZoom), 0.6)
