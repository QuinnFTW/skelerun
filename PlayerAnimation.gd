extends AnimatedSprite

func _on_Player_animate(motion, hurt, stun_time_out):
	
	
	if motion.y < 0:
		play("jump")
	elif motion.x < 0:
		set_flip_h(1)
		play("walk")
	elif motion.x > 0:
		set_flip_h(0)
		play("walk")
	elif hurt and stun_time_out:
		play("fall")
	else:
		play("idle")
