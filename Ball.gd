extends RigidBody2D

var last_position = Vector2.ZERO



func _on_Ball_body_entered(body):
	if body.is_in_group('bricks'):
		body.hit()

func _integrate_forces(state):
		# enforce min and max speed
		# based on: https://godotengine.org/qa/44040/how-to-set-a-max-speed-of-a-rigidbody2d?show=44086#c44086
		# no, I don't totally understand the math
		state.linear_velocity=state.linear_velocity.normalized()*clamp(state.linear_velocity.length(), 700, 1000)
		if state.linear_velocity.x < 5 and state.linear_velocity.x > -5:
			pass
		if state.linear_velocity.y < 5 and state.linear_velocity.y> -5:
			pass


func gone():
	queue_free()

func _physics_process(delta):
	#print(last_position.distance_to(self.position))
	#last_position = self.position
	pass
