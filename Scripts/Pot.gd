extends Unit

@onready var area_2d: Area2D = $Area2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer
const POT_PARTICLE = preload("uid://wx2g2e5vxkdo")
const COIN = preload("uid://dug5igcmoath6")
@onready var coins: Node2D = $"../Coins"

func _ready() -> void:
	super._ready()
	area_2d.area_entered.connect(areaEntered)
	sprite.material = sprite.material.duplicate() #Corrige bug visual de shader compartilhando variáveis

func takeDmg():
	var shaderMat : ShaderMaterial = sprite.material
	shaderMat.set_shader_parameter("branco", true)
	timer.start(0.1)
	await timer.timeout
	die()

func areaEntered(area : Area2D):
	var shaderMat : ShaderMaterial = sprite.material
	shaderMat.set_shader_parameter("branco", true)
	timer.start(0.1)
	await timer.timeout
	die()

func die():
	visible = false
	var particula : CPUParticles2D = POT_PARTICLE.instantiate() as CPUParticles2D
	get_tree().current_scene.add_child(particula)
	particula.global_position = global_position
	particula.emitting = true
	var coin : Node2D = COIN.instantiate()
	coins.add_child(coin)
	coin.global_position = global_position
	await particula.finished
	print("Added")
	particula.queue_free()
	queue_free()
