extends Node2D

func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Levels/EntryRoom.tscn")


func _on_EndVideoPlayer_finished():
	get_tree().change_scene("res://Levels/EndGame.tscn")
