extends KinematicBody2D

var direction=Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(500*.8,500*.8)

func _physics_process(delta):
	var collision = self.move_and_collide(direction * delta)
	if collision:
		var reflect = collision.remainder.bounce(collision.normal)
		direction = direction.bounce(collision.normal)
		self.move_and_collide(reflect)
		if collision.collider.is_in_group('bricks'):
			collision.collider.hit()


func _on_Ball_body_entered(body):
	if body.is_in_group('bricks'):
		body.hit()
