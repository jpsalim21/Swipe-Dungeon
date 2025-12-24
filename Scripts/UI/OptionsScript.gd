extends MarginContainer

var resDict : Dictionary[String, Vector2i] = {
	"HD": Vector2i(1280, 720),
	"HD+": Vector2i(1600, 900),
	"FULL HD": Vector2i(1920, 1080),
	"4:3": Vector2i(1024, 768)
}
var windowModes : Array[String] = [
	"Window",
	"Fullscreen"
]

@onready var resOptionButton: OptionButton = $Panel2/MarginContainer/VBoxContainer/OptionButton
@onready var winModeButton: OptionButton = $Panel2/MarginContainer/VBoxContainer/OptionButton2

@onready var sound_slider: HSlider = $Panel2/MarginContainer/VBoxContainer/SoundSlider
@onready var music_slider: HSlider = $Panel2/MarginContainer/VBoxContainer/MusicSlider
@onready var sfx_slider: HSlider = $Panel2/MarginContainer/VBoxContainer/SFXSlider

@onready var backButton: Button = $Panel2/MarginContainer/VBoxContainer/Button

func _ready() -> void:
	sound_slider.value_changed.connect(soundSlider)
	music_slider.value_changed.connect(musicSlider)
	sfx_slider.value_changed.connect(sfxSlider)
	backButton.pressed.connect(hide)
	for key in resDict:
		resOptionButton.add_item(key)
	for key in windowModes:
		winModeButton.add_item(key)
	resOptionButton.item_selected.connect(setResolution)
	winModeButton.item_selected.connect(setWindowMode)

func setResolution(id : int):
	DisplayServer.window_set_size(resDict[resOptionButton.get_item_text(id)])

func setWindowMode(id : int):
	match(id):
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func soundSlider(value : float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func musicSlider(value : float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	pass

func sfxSlider(value : float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		visible = !visible
