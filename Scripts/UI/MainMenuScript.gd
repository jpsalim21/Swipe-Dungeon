extends VBoxContainer

@onready var play_button: Button = $MarginContainer/VBoxContainer/PlayButton
@onready var config_button: Button = $MarginContainer/VBoxContainer/ConfigButton
@onready var credit_button: Button = $MarginContainer/VBoxContainer/CreditButton
@onready var quit_button: Button = $MarginContainer/VBoxContainer/QuitButton

@onready var options: MarginContainer = $"../Options"
@onready var credits: MarginContainer = $"../Credits"

const PHASE_MENU = "res://Scenes/PhaseMenu.tscn"

func _ready() -> void:
	play_button.pressed.connect(start)
	config_button.pressed.connect(options.show)
	credit_button.pressed.connect(credits.show)
	quit_button.pressed.connect(quit)

func start():
	SceneController.changeSceneTo(PHASE_MENU)

func quit():
	get_tree().quit()
