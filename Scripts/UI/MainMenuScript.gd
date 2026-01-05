extends VBoxContainer

@onready var play_button: Button = $MarginContainer/VBoxContainer/PlayButton
@onready var config_button: Button = $MarginContainer/VBoxContainer/ConfigButton
@onready var credit_button: Button = $MarginContainer/VBoxContainer/CreditButton
@onready var quit_button: Button = $MarginContainer/VBoxContainer/QuitButton

@onready var options: MarginContainer = $"../Options"
@onready var credits: MarginContainer = $"../Credits"
@onready var button_sound: AudioStreamPlayer = $"../ButtonSound"

const PHASE_MENU = "res://Scenes/PhaseMenu.tscn"

func _ready() -> void:
	play_button.pressed.connect(start)
	config_button.pressed.connect(showOptions)
	credit_button.pressed.connect(showCredits)
	quit_button.pressed.connect(quit)

func start():
	button_sound.play()
	SceneController.changeSceneTo(PHASE_MENU)

func showOptions():
	button_sound.play()
	options.show()

func showCredits():
	button_sound.play()
	credits.show()

func quit():
	get_tree().quit()
