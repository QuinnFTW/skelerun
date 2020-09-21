extends Node2D

func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Levels/EntryRoom.tscn")


func _on_EndVideoPlayer_finished():
	get_tree().change_scene("res://Levels/EndGame.tscn")
	

func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://Levels/EntryRoom.tscn")
