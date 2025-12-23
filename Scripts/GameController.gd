class_name GameController
extends Node

signal playerEndTurn
signal enemyEndTurn

signal pickedCoin(value : int)

@onready var coinAudio: AudioStreamPlayer = $AudioStreamPlayer

var coins : int = 0:
	set(value):
		coins = value
		pickedCoin.emit(coins)
		coinAudio.pitch_scale = randf_range(0.9, 1.1)
		coinAudio.play()
