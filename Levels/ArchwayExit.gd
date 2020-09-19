extends Area2D

func _on_ArchwayExit_body_entered(body):
	$AnimationPlayer.play("fade_out")
	
func load_next():
	get_tree().change_scene("res://GameManager.tscn")
