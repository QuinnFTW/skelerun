extends Node2D

var levels_to_generate
var levels_generated 
var levels = ["res://Levels/RoomArray/l_000.tscn","res://Levels/RoomArray/l_001.tscn",
"res://Levels/RoomArray/l_002.tscn","res://Levels/RoomArray/l_003.tscn",
"res://Levels/RoomArray/l_004.tscn","res://Levels/RoomArray/l_005.tscn",
"res://Levels/RoomArray/l_006.tscn","res://Levels/RoomArray/l_007.tscn",
"res://Levels/RoomArray/l_008.tscn","res://Levels/RoomArray/l_009.tscn",
"res://Levels/RoomArray/l_010.tscn","res://Levels/RoomArray/l_011.tscn",
"res://Levels/RoomArray/l_012.tscn", "res://Levels/RoomArray/l_013.tscn",
"res://Levels/RoomArray/l_014.tscn","res://Levels/RoomArray/l_015.tscn",
"res://Levels/RoomArray/l_016.tscn","res://Levels/RoomArray/l_017.tscn",
"res://Levels/RoomArray/l_018.tscn","res://Levels/RoomArray/l_019.tscn",
"res://Levels/RoomArray/l_020.tscn"]
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
