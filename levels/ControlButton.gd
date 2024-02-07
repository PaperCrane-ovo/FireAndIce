extends Area2D

signal hit
signal unhit
var water_hit:bool
var fire_hit:bool
# Called when the node enters the scene tree for the first time.

func _ready():
	water_hit = false
	fire_hit = false
	set_visible(true)

func _on_body_entered(body):
	set_visible(false)
	if !water_hit && !fire_hit:
		hit.emit()
	if body.name == "fireboy":
		fire_hit = true
	elif body.name == "icegirl":
		water_hit = true
	

func _on_body_exited(body):

	if body.name == "fireboy":
		fire_hit = false
	elif body.name == "icegirl":
		water_hit = false
	if !water_hit && !fire_hit:
		unhit.emit()
		set_visible(true)
	
