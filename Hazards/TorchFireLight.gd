extends Node2D

export var speed = 1200
export var impulse = 1000
export var steer_force = 10.0

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null
var is_hit = false

func start(_transform, _target, _delta):
	global_transform = _transform
	rotation += rand_range(-0.09, 0.09)
	velocity = transform.x * speed 
	init(_target, _transform)

func seek():
	var steer = Vector2.ZERO
	if target:
		var desired = (target.position - position).normalized() * speed 
		steer = (desired - velocity).normalized() * steer_force
	return steer 

func _physics_process(delta):
	acceleration += seek() * 15
	velocity += acceleration * delta 
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta 
	
func init(_target, _transform):
	target = _target
	position = _transform

func _on_Lifetime_timeout():
	explode()

func _process(delta):
	if not is_hit:
		manage_collision()

func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		$Dissapate.play()
		is_hit = true
		if object.name == "Player":
			get_tree().call_group("Gamestate", "hurt")
		explode()

func explode():
	queue_free()

