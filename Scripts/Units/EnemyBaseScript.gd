class_name EnemyUnit
extends Unit

static var DIE_PARTICLE = preload("uid://b32176hy2txb4")
@onready var sprite: Sprite2D = $Sprite
@onready var timer: Timer = $Timer
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	super._ready()
	area_2d.area_entered.connect(entrouArea)

func doTurn():
	tileAtual = tilemap.getNextTile(tileAtual)

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

func entrouArea(area : Area2D):
	die()

func die():
	var particula : CPUParticles2D = DIE_PARTICLE.instantiate() as CPUParticles2D
	get_tree().current_scene.add_child(particula)
	particula.global_position = global_position
	particula.emitting = true
	print("Instanciei a particula")
	queue_free()
