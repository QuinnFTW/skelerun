extends AnimationPlayer

func _ready():
	play("Exit")
	
func load_next(scene_number):
	get_tree().call_group("GameState", "play_end_scenes", scene_number)
	
func end_cinematic():
	get_tree().change_scene("res://Levels/EndCinematic.tscn")
	
func end_fall():
	get_tree().change_scene("res://Levels/EndCinematicFall.tscn")
	
func outro_text():
	get_tree().change_scene("res://Levels/outroText.tscn")
