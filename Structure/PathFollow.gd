extends Sprite

func _ready():
   set_physics_process(true)

func _physics_process(delta):
   get_parent().set_offset(get_parent().get_offset() + (750*delta))
