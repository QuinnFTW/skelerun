extends AnimationPlayer

func _on_SpikeTrap_animate():
	self.play("ColliderAnimation")
	Timer.wait_time(1)
	self.play_backwards("ColliderAnimation")
