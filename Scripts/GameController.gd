class_name GameController
extends Node

signal playerEndTurn
signal enemyEndTurn

signal pickedCoin(value : int)

@onready var coinAudio: AudioStreamPlayer = $CoinAudio
@onready var coinTimer: Timer = $Timer

var coins : int = 0:
	set(value):
		coins = value
		pickedCoin.emit(coins)
		coinTimer.stop()
		coinTimer.start(1.0)
		coinAudio.pitch_scale = min(coinAudio.pitch_scale + 0.1, 1.5)
		coinAudio.play()

func _ready() -> void:
	coinTimer.timeout.connect(resetSound)

func resetSound():
	coinAudio.pitch_scale = 0.9
