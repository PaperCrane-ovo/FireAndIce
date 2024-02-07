extends Area2D



func _on_body_entered(body):
	if body.name == "icegirl":
		set_visible(false)
		if !$"../FireDoor".is_visible():
			$"../WinText".show()
			


func _on_body_exited(body):
	if body.name == "icegirl":
		set_visible(true)
