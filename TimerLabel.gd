extends Label
var time_int

func update_text(time):
	time_int = int(time)
	self.text = str(time_int)
