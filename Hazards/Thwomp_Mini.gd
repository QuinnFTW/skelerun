extends Node2D

var time_out = false
var is_slamming = false
var start_position = Vector2(0,0)
var slam_ready = true
var is_resetting = false
var is_selected = false
var direction


const SLAM_SPEED = 10
const RESET_SPEED = 10

func _ready():
	start_position = position

func _process(delta):
	if not is_selected:
		if $RayCast_Down.is_colliding() and not is_slamming and not is_resetting:
			direction = Vector2(0,1)
			slam()
		elif $RayCast_Up.is_colliding() and not is_slamming and not is_resetting:
			direction = Vector2(0,-1)
			slam()
		elif $RayCast_Left.is_colliding() and not is_slamming and not is_resetting:
			direction = Vector2(-1,0)
			slam()
		elif $RayCast_Right.is_colliding() and not is_slamming and not is_resetting:
			direction = Vector2(1,0)
			slam()
	if is_slamming:
		position  += direction * SLAM_SPEED
		manage_collision()
	elif is_resetting:
		reset_position()
		
func slam():
	if slam_ready and not time_out:
		is_selected = true
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
			get_tree().call_group("Camera", "thwomp_shake")
			is_slamming = false
			is_resetting = true
		
func reset_position():
	if position != start_position:
		position = position - (direction * RESET_SPEED)
		if direction.x == 1 and position.x < start_position.x :
			position = start_position
		elif  direction.y == 1 and position.y < start_position.y:
			position = start_position
	else:
		position = start_position
		is_resetting = false
		is_selected = false
		$Timer.start()



func _on_Hazard_body_exited(body):
	pass # Replace with function body.

