extends AnimatedSprite

var motion = Vector2(0,0)
var start_position = position

const SPEED = 1

func _ready():
	add_to_group("DeathWall")

func _process(delta):
	position.x += SPEED
	
func reset_position():
	position = start_position

func _on_Area2D_body_entered(body):
	# End game
	pass # Replace with function body.
