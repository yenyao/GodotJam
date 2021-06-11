extends KinematicBody2D

export var speed = 100
export var knockback_speed = 500
export var knockback_period = 1.5
var friction = 0.00000005
var velocity = Vector2(0,0)
var direction = Vector2(1,0)
var target = null

var knockback_time = 0

enum Modes {PURSUIT, KNOCKBACK}
var mode = Modes.PURSUIT

func _physics_process(_delta):
	if mode == Modes.PURSUIT:
		move_enemy_pursuit()
	if mode == Modes.KNOCKBACK:
		move_enemy_knockback()

func move_enemy_pursuit():
	if target and is_instance_valid(target):
		direction = (target.position - position).normalized()
		velocity =  move_and_slide(speed * direction)
	if !is_instance_valid(target):
		target = null 

func move_enemy_knockback():
	knockback_time += get_process_delta_time()
	velocity = velocity.linear_interpolate(Vector2.ZERO, knockback_time/knockback_period)
	var collision = move_and_collide(velocity * get_process_delta_time())
	if collision or velocity.length() < 0.5:
		mode = Modes.PURSUIT

func _on_BulletDetector_body_entered(body):
	queue_free()
	body.queue_free()

func knock_back():
	direction = direction.rotated(PI)
	velocity = direction * knockback_speed
	knockback_time = 0
	mode = Modes.KNOCKBACK
