extends Sprite

# Manually sets the location of this door:
#	0 for up, 1 for right, 2 for down, and 3 for left
export var location = 0	

func _ready():
	print($Raycast2D.is_colliding())
		
func _process(delta):
#	Checks to see if there is an adjacent room. If not, the door self-destructs
	if not $Raycast2D.is_colliding():
		queue_free()
		

