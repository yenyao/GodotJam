extends KinematicBody2D

var velocity = Vector2(500,-100)

func _ready():
	rotation =  get_angle(velocity)

func _physics_process(_delta):
	move_bullet()
	

func move_bullet():
	var collision = move_and_collide(velocity * get_physics_process_delta_time())
	#print(collision)

	if collision:
		velocity = velocity.bounce(collision.normal)
		rotation =  get_angle(velocity)

	return collision

func get_angle(velocity):
	return velocity.angle() + PI/2
