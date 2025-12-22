@tool
extends Unit

@export var botoes : Array[TileButton] = []
@onready var sprite: Sprite2D = $Sprite2D

var contagem : int = 1

func _ready() -> void:
	super._ready()
	contagem = botoes.size()
	for b in botoes:
		b.pressionado.connect(botaoApertado)

func botaoApertado():
	contagem -= 1
	if contagem <= 0:
		tilemap.map[tileAtual].unit = null
		var tween : Tween = create_tween()
		tween.tween_property(sprite, "scale", Vector2.ZERO, 1.0).set_trans(Tween.TRANS_ELASTIC)
		await tween.finished
		queue_free()

func _draw() -> void:
	if Engine.is_editor_hint():
		for b in botoes:
			draw_line(Vector2.ZERO, (b.global_position - global_position), Color.GREEN, 2.0)
