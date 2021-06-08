extends KinematicBody2D

var velocity = Vector2(1000, 0)
const MAX_BOUNCE = 3
var bounce = 0

func _ready():
	rotation =  get_angle(velocity)

func _physics_process(_delta):
	move_bullet()
	

func move_bullet():
	var collision = move_and_collide(velocity * get_physics_process_delta_time())
	#print(collision)

	if collision:
		bounce += 1
		if bounce >= MAX_BOUNCE:
			queue_free()
			return
		velocity = velocity.bounce(collision.normal)
		rotation =  get_angle(velocity)

	return collision

func get_angle(velocity):
	return velocity.angle() + PI/2
