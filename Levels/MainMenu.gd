extends Node2D



func _on_Start_button_down():
	get_tree().change_scene("res://Levels/IntroText.tscn")


func _on_Quit_button_down():
	get_tree().quit()
