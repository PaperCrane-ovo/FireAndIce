extends Area2D




func _on_body_entered(body):
	if body.name == "icegirl":
		body.set_visible(false)
		$"../LoseText".show()
		await get_tree().create_timer(2.0).timeout
		get_tree().reload_current_scene()
