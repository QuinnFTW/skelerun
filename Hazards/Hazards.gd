extends Area2D

var do_hurt = false

func _on_Hazard_body_entered(_body):
	do_hurt = true
	
func _on_Hazard_body_exited(_body):
	do_hurt = false
	
func _process(_delta):
	if do_hurt:
		get_tree().call_group("Gamestate", "hurt")
