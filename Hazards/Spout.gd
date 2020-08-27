extends Node2D

var time_out = false

var is_flipped
export var fire_delay = 0.3


func _ready():
	$Sprite/Timer.wait_time = fire_delay
	if $Sprite.flip_v:
		is_flipped = true
	elif not $Sprite.flip_v:
		is_flipped = false

func _process(_delta):
	fire()
		
func fire():
	if not time_out:
#		var t = Timer.new()
#		t.set_wait_time(fire_delay)
#		t.set_one_shot(true)
#		self.add_child(t)
#		t.start()
#		yield(t, "timeout")
		$AnimationPlayer.play("fire")
		$Sprite.add_child(load("res://Hazards/SpoutFlame.tscn").instance())
		$Sprite/Timer.start()
		time_out = true
#		t.queue_free()

func _on_Timer_timeout():
	time_out = false 

