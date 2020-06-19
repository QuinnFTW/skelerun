extends Node2D

var time_out = false

var is_flipped

func _ready():
	if $AnimatedSprite.flip_h:
		is_flipped = true
	elif not $AnimatedSprite.flip_h:
		is_flipped = false

func _process(delta):
	fire()
		
func fire():
	if not time_out:
#		var flame = preload("res://Hazards/GargoyleFlame.tscn").instance()
#		mySprite.init(a, b)
#		getparent().add_child(mySprite)
		$AnimationPlayer.play("fire")
		$AnimatedSprite.add_child(load("res://Hazards/GargoyleFlame.tscn").instance())
		$AnimatedSprite/Timer.start()
		time_out = true

func _on_Timer_timeout():
	time_out = false 
