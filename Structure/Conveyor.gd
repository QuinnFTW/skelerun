extends Node2D

export var reverse = false
var is_pushing = false
var push_direction = 400
var current_direction = 0
var reversal 

# Called when the node enters the scene tree for the first time.
func _ready():
	if not reverse:
		$AnimatedSprite.play("running")
		reversal = 1
	else:
		$AnimatedSprite.play("running_reverse")
		reversal = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	is_pushing = true
	current_direction = push_direction * reversal
	body.start_push(is_pushing, current_direction)
	
	


func _on_Area2D_body_exited(body):
	is_pushing = false
	current_direction = 0
	body.start_push(is_pushing, current_direction)
	
