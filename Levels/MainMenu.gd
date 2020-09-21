extends Node2D



func _on_Start_button_down():
	get_tree().change_scene("res://Levels/EntryRoom.tscn")


func _on_Quit_button_down():
	get_tree().quit()
