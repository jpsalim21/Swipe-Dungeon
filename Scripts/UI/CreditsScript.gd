extends MarginContainer

@onready var backButton: Button = $Panel2/Button

func _ready() -> void:
	backButton.pressed.connect(backButtonPressed)

func backButtonPressed():
	visible = false
