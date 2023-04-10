extends RigidBody2D

@export var INITIAL_BALL_SPEED = 200

@export var min_bounce_angle = 30
@export var max_bounce_angle = 150

var ball_speed = INITIAL_BALL_SPEED
var direction = Vector2(1, 0).rotated(randf_range(0, 360)).normalized()


func _physics_process(delta):
	var collision = move_and_collide(direction * ball_speed * delta)
	
	if(collision):
	# change direction
		var normal = collision.get_normal()
		direction = direction.bounce(normal)
		
		# Add some randomness to the bounce angle
		var angle = randf_range(min_bounce_angle, max_bounce_angle)
		
		print(angle)
		direction.x = -direction.x
		direction.y = angle
		
	
