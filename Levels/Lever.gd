extends AnimatedSprite

var over_lever = false

func _ready():
	$f_Key.visible = false
	
		
func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_F and over_lever:
		play("switch")
		freeze_player()
		$AnimationPlayer.play("open_gate")

func _on_Area2D_body_entered(body):
	$f_Key.visible = true
	$fKeyAnimatior.play("button_float")
	over_lever = true


func _on_Area2D_body_exited(body):
	$f_Key.visible = false
	over_lever = false
	
func freeze_player():
	get_tree().call_group("Player", "freeze")
	
func unfreeze_player():
	get_tree().call_group("Player", "unfreeze")
	
func disable_lever():
	$Area2D/CollisionShape2D.disabled = true
