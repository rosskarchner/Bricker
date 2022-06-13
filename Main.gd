extends Node2D

onready var br=preload("res://Brick.tscn")
onready var ball_class= preload("res://Ball.tscn")

var lives_remaining = 3

func set_bricks():
	var numbricks = 0
	for i in range(4):
		for j in range(13):
			var brick=br.instance()
			brick.position=Vector2(100+70 * (j), 70+50*i)
			numbricks += 1
			add_child(brick)
			

func start_ball():
	var new_ball = ball_class.instance()
	new_ball.position = Vector2(212,300)
	var notifier = new_ball.get_node("BallVisibilityNotifier")
	notifier.connect("screen_exited", self, "ball_exited_screen")
	add_child(new_ball)
	new_ball.apply_impulse(Vector2.ZERO, Vector2(500,500))

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_bricks()
	start_ball()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func ball_exited_screen():
	get_tree().call_group("balls","queue_free")
	lives_remaining -= 1
	if lives_remaining == 0:
		var _reload = get_tree().reload_current_scene()
	else:
		start_ball()
