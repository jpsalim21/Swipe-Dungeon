extends Control

var phaseScenes : Array[String] = [
	"res://Scenes/Fase1.tscn",
	"res://Scenes/Fase2.tscn",
	"res://Scenes/Fase3.tscn"
]

@export var phaseButtons : Array[Button] = []
@onready var button_sound: AudioStreamPlayer = $ButtonSound

const MAIN_MENU = "res://Scenes/MainMenu.tscn"

func _ready() -> void:
	for b in range(phaseScenes.size()):
		phaseButtons[b].pressed.connect(changeScene.bind(b))

func changeScene(id : int):
	button_sound.play()
	SceneController.changeSceneTo(phaseScenes[id])

func _on_return_pressed() -> void:
	button_sound.play()
	SceneController.changeSceneTo(MAIN_MENU)
