extends Node2D

var time_out = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if time_out:
		$AnimationPlayer.play("trapdoor_open")
		$Timer.start()
		time_out = false


func _on_Timer_timeout():
	time_out = true
	
