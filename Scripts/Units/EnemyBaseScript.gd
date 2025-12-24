class_name EnemyUnit
extends Unit

static var DIE_PARTICLE = preload("uid://b32176hy2txb4")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var area_2d: Area2D = $Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var morrendo : bool = false

func _ready() -> void:
	super._ready()
	area_2d.area_entered.connect(entrouArea)
	sprite.material = sprite.material.duplicate()

func doTurn():
	if morrendo:
		return
	setTileAtual(tilemap.getNextTile(_tileAtual))

func setTileAtual(value : Vector2i):
	if value == _tileAtual:
		return
	var dir : Vector2i = value - _tileAtual
	if dir.y != 0:
		if dir.y < 0:
			sprite.play("Up")
		else:
			sprite.play("Down")
	else:
		sprite.play("Side")
		sprite.flip_h = dir.x > 0
	super.setTileAtual(value)
	animation_player.stop()
	animation_player.play("Move")

func estavaOcupado(value : Vector2i):
	var playerUnit : PlayerUnit = tilemap.getUnit(value) as PlayerUnit
	if playerUnit:
		playerUnit.takeDmg()

func takeDmg():
	var shaderMat : ShaderMaterial = sprite.material
	shaderMat.set_shader_parameter("branco", true)
	timer.start(0.1)
	await timer.timeout
	
	die()

func entrouArea(_area : Area2D):
	die()

func die():
	morrendo = true
	visible = false
	var particula : CPUParticles2D = DIE_PARTICLE.instantiate() as CPUParticles2D
	get_tree().current_scene.add_child(particula)
	particula.global_position = global_position
	particula.emitting = true
	await particula.finished
	tilemap.setOcupado(_tileAtual, null)
	particula.queue_free()
	queue_free()
