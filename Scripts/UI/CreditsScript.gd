extends MarginContainer

@onready var backButton: Button = $Panel2/Button
@onready var button_sound: AudioStreamPlayer = $"../ButtonSound"

func _ready() -> void:
	backButton.pressed.connect(backButtonPressed)

func backButtonPressed():
	button_sound.play()
	visible = false
