extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://startgame.tscn")


func _on__pressed():
	get_tree().change_scene_to_file("res://levels/level1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://levels/level2.tscn")
