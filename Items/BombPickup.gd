extends Node2D



func _on_Area2D_body_entered(body):
	get_tree().call_group("Player", "add_bomb")
	queue_free()
