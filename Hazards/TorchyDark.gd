extends Node2D

var time_out = false
var player_detected
var player
var has_fired = false

func _process(_delta):
	animate()

func animate():
	if not time_out and player_detected:
		$AnimationPlayer.play("fire")
		$Timer.start()
		time_out = true
	elif not player_detected:
		$AnimationPlayer.play("idle")
		
func fire():
	var flame1 = preload("res://Hazards/TorchFireDark.tscn").instance()
	var flame2 = preload("res://Hazards/TorchFireDark.tscn").instance()
	var flame3 = preload("res://Hazards/TorchFireDark.tscn").instance()
	var flame4 = preload("res://Hazards/TorchFireDark.tscn").instance()
	var t = Timer.new()
	t.set_wait_time(0.3)
	t.set_one_shot(true)
	self.add_child(t)
	if(has_fired):
		flame1.init(Vector2.RIGHT, position)
		get_parent().add_child(flame1)
		t.start()
		yield(t, "timeout")
		flame2.init(Vector2.UP, position)
		get_parent().add_child(flame2)
		t.start()
		yield(t, "timeout")
		flame3.init(Vector2.LEFT, position)
		get_parent().add_child(flame3)
		t.start()
		yield(t, "timeout")
		flame4.init(Vector2.DOWN, position)
		get_parent().add_child(flame4)
	else:
		flame1.init(Vector2(1,1), position)
		get_parent().add_child(flame1)
		t.start()
		yield(t, "timeout")
		flame2.init(Vector2(1,-1), position)
		get_parent().add_child(flame2)
		t.start()
		yield(t, "timeout")
		flame3.init(Vector2(-1,-1), position)
		get_parent().add_child(flame3)
		t.start()
		yield(t, "timeout")
		flame4.init(Vector2(-1,1), position)
		get_parent().add_child(flame4)
	has_fired = !has_fired
	t.queue_free()

func _on_Timer_timeout():
	time_out = false 

func _on_DetectionRadius_body_entered(body):
	player_detected = true
	player = body

func _on_DetectionRadius_body_exited(body):
	player_detected = false
