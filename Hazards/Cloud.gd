extends Node2D

var time_out = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	if not time_out:
		$Sprite/RayCast2D.add_child(load("res://Hazards/Lightning.tscn").instance())
		$Sprite/Timer.start()
		time_out = true

func _on_Timer_timeout():
	time_out = false 
