extends Label

@onready var game_controller: GameController = %GameController

func _ready() -> void:
	game_controller.pickedCoin.connect(changeLabel)
	text = "- 0"

func changeLabel(value : int):
	text = "- " + str(value)
