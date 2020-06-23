extends AnimationPlayer

var time_out = false
var on_trap = false

#func _ready():
#	$Timer.wait_time = 1
	
func _physics_process(_delta):
	if on_trap and time_out:
		$Timer.start()
	elif on_trap and not time_out:
		activate_trap()
	

#func _on_SpikeTrap_animate():
#	self.play("ColliderAnimation")
#	Timer.wait_time(1)
#	self.play_backwards("ColliderAnimation")


func _on_trigger_body_entered(_body):
#	$Timer.wait_time = 1
#	$Timer.start()
	on_trap = true
	activate_trap()
	

func _on_Timer_timeout():
	time_out = true
	
	
func activate_trap():
	self.play("ColliderAnimation")
#	$Timer.start()
#	self.play_backwards("ColliderAnimation")
	time_out = false


func _on_Area2D2_body_exited(_body):
	on_trap = false
	$Timer.start()
