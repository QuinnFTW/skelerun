extends Node2D

var lives = 15
var coins = 0
var target_number_of_coins = 10
var time_limit = 500


func _ready():
	
	add_to_group("Gamestate")
	
	
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()

func hurt():
	lives -= 1
#	$Player.hurt()
	get_tree().call_group("Player", "hurt")
	
	
		
func lives_up():
	lives += 1
		
func coin_up():
	coins += 1
	var multiple_of_coins = coins % target_number_of_coins == 0
	if multiple_of_coins:
		lives_up()
		
func game_end():
	get_tree().change_scene("res://Levels/EndGame.tscn")

func win_game():
#	get_tree().change_scene("res://Levels/Victory.tscn")
	pass

func update_GUI(time):
#	get_tree().call_group("GUI", "update_GUI", lives, coins)
	pass
	

func _on_Timer_timeout():
	game_end()
