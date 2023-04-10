extends CharacterBody2D

@export var INITIAL_BALL_SPEED = 20

@export var speed_multiplier = 1.02

var ball_speed = INITIAL_BALL_SPEED

func _ready():
	randomize()
	velocity.x = [-1, 1][randi() % 2] * INITIAL_BALL_SPEED
	velocity.y = [-.8, .8][randi() % 2] * INITIAL_BALL_SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * ball_speed * delta)
	
	print(velocity.y)
	if(collision):
	# change direction
		velocity =  velocity.bounce(collision.get_normal()) * speed_multiplier
		
		
	
