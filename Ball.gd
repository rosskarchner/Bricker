extends RigidBody2D




func _on_Ball_body_entered(body):
	if body.is_in_group('bricks'):
		body.hit()

func gone():
	queue_free()
