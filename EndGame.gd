extends Node2D

var score

func _on_Button_button_down():
	get_tree().change_scene("res://Levels/MainMenu.tscn")
	
func _ready():
	score = int(GlobalVars.score)
	$Label.text = str(score)
