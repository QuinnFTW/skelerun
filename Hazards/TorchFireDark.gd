extends Node2D

export var speed = 100
export var speed_cap = 1000
export var steer_force = 100.0

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null
var is_hit = false

func start(_transform, _target):
	global_transform = _transform
	rotation += rand_range(-0.09, 0.09)
	velocity = target * speed
	init(_target, _transform)

func _physics_process(delta):
	acceleration += target * speed
	velocity += acceleration * delta
	velocity = velocity.clamped(speed_cap)
	rotation = velocity.angle()
	position += velocity * delta
	
func _process(delta):
	if not is_hit:
		manage_collision()

func init(_target, _transform):
	target = _target
	position = _transform

func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		is_hit = true
		if object.name == "Player":
			get_tree().call_group("Gamestate", "hurt")
		explode()

func explode():
	queue_free()
