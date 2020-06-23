extends Node2D

const SPEED = 750
var direction
var is_hit = false

func _ready():
	set_as_toplevel(true)
	
	global_position.y = get_parent().global_position.y + 40
	if get_parent().flip_h:
		global_position.x = get_parent().global_position.x - 50
		direction = -1
		$Area2D/AnimatedSprite.set_flip_h(true) 
	elif not get_parent().flip_h:
		global_position.x = get_parent().global_position.x + 50
		direction = 1
	
func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		is_hit = true
		if object.name == "Player":
			get_tree().call_group("Gamestate", "hurt")
		$Area2D/AnimatedSprite.play("impact")
		yield($Area2D/AnimatedSprite, "animation_finished")
		queue_free()
		
	
func _process(delta):
	if not is_hit:
		position.x += (SPEED * direction) * delta
		manage_collision()
	
	

