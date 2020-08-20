extends CanvasModulate

func _ready():
	add_to_group("UI")

func fade_out_in():
	set_modulate(lerp(get_modulate(), Color(0,0,0,1), 0.2))
	set_modulate(lerp(get_modulate(), Color(255,255,255,1), 0.2))
