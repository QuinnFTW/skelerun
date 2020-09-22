extends Node2D

var levels_to_generate = 20
var levels_generated = 0
var levels = ["res://Levels/RoomArray/l_000.tscn","res://Levels/RoomArray/l_001.tscn",
"res://Levels/RoomArray/l_002.tscn","res://Levels/RoomArray/l_003.tscn",
"res://Levels/RoomArray/l_004.tscn","res://Levels/RoomArray/l_005.tscn",
"res://Levels/RoomArray/l_006.tscn","res://Levels/RoomArray/l_007.tscn",
"res://Levels/RoomArray/l_008.tscn","res://Levels/RoomArray/l_009.tscn",
"res://Levels/RoomArray/l_010.tscn","res://Levels/RoomArray/l_011.tscn",
"res://Levels/RoomArray/l_012.tscn","res://Levels/RoomArray/l_013.tscn",
"res://Levels/RoomArray/l_014.tscn","res://Levels/RoomArray/l_015.tscn",
"res://Levels/RoomArray/l_016.tscn","res://Levels/RoomArray/l_017.tscn",
"res://Levels/RoomArray/l_018.tscn","res://Levels/RoomArray/l_019.tscn",
"res://Levels/RoomArray/l_020.tscn","res://Levels/RoomArray/l_021.tscn",
"res://Levels/RoomArray/l_022.tscn","res://Levels/RoomArray/l_023.tscn",
"res://Levels/RoomArray/l_024.tscn","res://Levels/RoomArray/l_025.tscn",
"res://Levels/RoomArray/l_026.tscn","res://Levels/RoomArray/l_027.tscn",
"res://Levels/RoomArray/l_028.tscn","res://Levels/RoomArray/l_029.tscn"]

var end_counter = 0
var exit_scene = "res://Levels/ExitRoom.tscn"
var dock_scene = "res://Levels/EndCinematic.tscn"
var waterfall_scene = "res://Levels/EndCinematicFall.tscn"

var active_level
var index = -1

var time_remaining
var room_score = 100 # the score reward for completing a room
var time_bonus = 15 # number of seconds added to the timer when collecting a time pickup

func _ready():
	add_to_group("Gamestate")
#	For now, pick a room at random and load it. Later we will just load the starting room.
	randomize()
	levels.shuffle()
	load_level()
	unfreeze_player()
	$Timer.start()
	pass
	
func _physics_process(delta):
	time_remaining = $Timer.time_left
	GlobalVars.score -= 0.1
	get_tree().call_group("UI", "update_text", time_remaining)
	
	
func generate():
	levels_generated += 1
	GlobalVars.score += room_score
#	Check if levels_generated == levels_to_generate. If so, load the exit room.
	if (levels_generated >= levels_to_generate):
		$VolumeTween.play("fade_music")
		unload_level()
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()
		get_tree().change_scene("res://Levels/ExitRoom.tscn")
		print("made it to the end")
#	else unload the current active room and load a new one at random, setting it as active
	else:
		scene_transition()
		print("loaded new scene")
	
#	load_level()
	
	
func load_level():
	index += 1
	var scene = load(levels[index])
	active_level = scene.instance()
	add_child(active_level)
	freeze_player()
	
func scene_transition(): #The animation also calls the load_level function
	get_tree().call_group("Animator", "fade_out_in")
	
func load_end_scenes():
	get_tree().call_group("Animator", "fade_cut")
	unload_level()
	var scene = load(exit_scene)
	active_level = scene.instance()
	add_child(active_level)
	get_tree().call_group("DeathWall", "stop_motion")

func end_cinematic():
	get_tree().call_group("Animator", "fade_cut")
	unload_level()
	var scene = load(dock_scene)
	active_level = scene.instance()
	add_child(active_level)
	
func end_fall():
	get_tree().call_group("Animator", "fade_cut")
	unload_level()
	var scene = load(waterfall_scene)
	active_level = scene.instance()
	add_child(active_level)
	
func unload_level():
	remove_child(active_level)
	
func freeze_player():
	get_tree().call_group("Player", "freeze")
	
func unfreeze_player():
	get_tree().call_group("Player", "unfreeze")
	
func time_pickup():
#	$Timer.wait_time += time_bonus
	$Timer.stop()
	$Timer.set_wait_time(time_remaining + time_bonus) 
	$Timer.start()
	
