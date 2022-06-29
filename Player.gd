extends KinematicBody2D

var speed = 1100
var velocity = Vector2()
var paused = false

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 2
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 2
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if not paused:
		get_input()
		move_and_collide(velocity * delta)
