extends RigidBody2D
const SPEED = 30000

@onready var ball 


func _ready():
	# find the ball in the scene
	ball = get_tree().get_first_node_in_group("ball")

func _physics_process(delta):
	# calculate the direction towards the ball
	var direction = (ball.position - position).normalized()
	
	# move the paddle towards the ball
	linear_velocity.y = direction.y * SPEED * delta
	
