extends Node2D

var time_out = false
var player_detected
var player

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
	var flame = preload("res://Hazards/TorchFire.tscn").instance()
	flame.init(player, position)
	get_parent().add_child(flame)
#	$AnimatedSprite.add_child(load("res://Hazards/TorchFire.tscn").instance())

func _on_Timer_timeout():
	time_out = false 

func _on_DetectionRadius_body_entered(body):
	player_detected = true
	player = body

func _on_DetectionRadius_body_exited(body):
	player_detected = false
#	player = null
