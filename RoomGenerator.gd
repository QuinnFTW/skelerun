extends Node2D

var levels_to_generate
var levels_generated 
var levels = ["res://Levels/RoomArray/TestRoom01(2).tscn","res://Levels/RoomArray/TestRoom01(3).tscn",
"res://Levels/RoomArray/TestRoom01(4).tscn","res://Levels/RoomArray/TestRoom01.tscn", "res://Levels/RoomArray/TestRoomV2.tscn",
"res://Levels/RoomArray/l_000.tscn"]
var active_level
var index = -1

func _ready():
	add_to_group("Gamestate")
#	For now, pick a room at random and load it. Later we will just load the starting room.
	randomize()
	levels.shuffle()
	load_level()
	unfreeze_player()
	pass
	
func generate():
#	levels_generated += 1
#	Check if levels_generated == levels_to_generate. If so, load the exit room.
#	else unload the current active room and load a new one at random, setting it as active
	scene_transition()
	
#	load_level()
	
	
func load_level():
	index += 1
	var scene = load(levels[index])
	active_level = scene.instance()
	add_child(active_level)
	freeze_player()
	
func scene_transition():
	get_tree().call_group("Animator", "fade_out_in")
	
func unload_level():
	remove_child(active_level)
	
func freeze_player():
	get_tree().call_group("Player", "freeze")
	
func unfreeze_player():
	get_tree().call_group("Player", "unfreeze")
