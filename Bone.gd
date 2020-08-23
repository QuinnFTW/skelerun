extends RigidBody2D

var impulse
var relOffset = 0

func ready():
	apply_impulse(Vector2(0,0), Vector2(0, 10))

