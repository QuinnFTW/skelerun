extends Area2D

var leave_level = false

func _on_Area2D_body_entered(body):
	leave_level = true
	
func _process(_delta):
	if leave_level:
		get_tree().call_group("Gamestate", "generate")
		get_tree().call_group("DeathWall", "reset_position")
