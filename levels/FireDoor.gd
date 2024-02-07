extends Area2D




func _on_body_entered(body):
	if body.name == "fireboy":
		set_visible(false)
		if !$"../WaterDoor".is_visible():
			$"../WinText".show()
		

func _on_body_exited(body):
	if body.name == "fireboy":
		set_visible(true)
