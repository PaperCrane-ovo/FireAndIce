extends StaticBody2D

var trigged1:bool
var trigged2:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	trigged1 = false
	trigged2 = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_button_1_hit():
	trigged1 = true
	set_visible(false)
	set_collision_layer_value(1,false)
	


func _on_control_button_1_unhit():
	trigged1 = false
	if !trigged1 && !trigged2:
		set_visible(true)
		set_collision_layer_value(1,true)

func _on_control_button_2_hit():
	trigged2 = true
	set_visible(false)
	set_collision_layer_value(1,false)

func _on_control_button_2_unhit():
	trigged2 = false
	if !trigged1 && !trigged2:
		set_visible(true)
		set_collision_layer_value(1,true)
