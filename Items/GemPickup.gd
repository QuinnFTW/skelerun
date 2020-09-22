extends Node2D

var gem_value = 25

func _on_Area2D_body_entered(body):
	GlobalVars.score += gem_value
	queue_free()
