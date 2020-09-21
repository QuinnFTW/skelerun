extends AnimatedSprite

var motion = Vector2(0,0)
var start_position = position
var in_motion = true

const SPEED = .5

func _ready():
	add_to_group("DeathWall")
	

func _process(delta):
	if (in_motion):
		position.x += SPEED
	
	
func reset_position():
	position = start_position
	
func stop_motion():
	in_motion = false
	
	
#
#func _on_Area2D_body_entered(body):
#	# End game
#	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	get_tree().call_group("Gamestate", "game_end")
