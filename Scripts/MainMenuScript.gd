extends VBoxContainer

@onready var play_button: Button = $MarginContainer/VBoxContainer/PlayButton
@onready var config_button: Button = $MarginContainer/VBoxContainer/ConfigButton
@onready var credit_button: Button = $MarginContainer/VBoxContainer/CreditButton
@onready var quit_button: Button = $MarginContainer/VBoxContainer/QuitButton

@onready var options: MarginContainer = $"../Options"
@onready var credits: MarginContainer = $"../Credits"

func _ready() -> void:
	config_button.pressed.connect(options.show)
	credit_button.pressed.connect(credits.show)
	quit_button.pressed.connect(quit)

func quit():
	get_tree().quit()
