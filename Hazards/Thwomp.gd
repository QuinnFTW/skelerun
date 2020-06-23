extends Node2D

var time_out = false
var is_slamming = false
var start_position = Vector2(0,0)
var slam_ready = true
var is_resetting = false


const SLAM_SPEED = 10
const RESET_SPEED = 5

func _ready():
	start_position.y = position.y

func _process(delta):
	if $RayCast2D.is_colliding():
		slam()
	if is_slamming:
		position.y += SLAM_SPEED
		manage_collision()
	if is_resetting:
		reset_position()
		
func slam():
	if slam_ready and not time_out:
		$AnimationPlayer.play("rumble")
		yield($AnimationPlayer, "animation_finished")
		is_slamming = true
		slam_ready = false
		

func _on_Timer_timeout():
	slam_ready = true 
	
func manage_collision():
	var collider = $Sprite/SurfaceChecker.get_overlapping_bodies()
	for object in collider:
		if not object.name == "Player":
			is_slamming = false
			is_resetting = true
		
func reset_position():
	if position.y > start_position.y:
		position.y -= RESET_SPEED
	else:
		position.y = start_position.y
		is_resetting = false
		$Timer.start()

