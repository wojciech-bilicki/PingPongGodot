extends CharacterBody2D

class_name Ball

@export var INITIAL_BALL_SPEED = 20
@onready var audio_stream_player = $AudioStreamPlayer

@export var speed_multiplier = 1.02

var ball_speed = INITIAL_BALL_SPEED

func _ready():
	start_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity * ball_speed * delta)
	
	if(collision):
	# change direction
		velocity =  velocity.bounce(collision.get_normal()) * speed_multiplier
		
		if collision.get_collider() is Paddle:
			audio_stream_player.play()
	
		
		
func start_ball():
	randomize()
	velocity.x = [-1, 1][randi() % 2] * INITIAL_BALL_SPEED
	velocity.y = [-.8, .8][randi() % 2] * INITIAL_BALL_SPEED
