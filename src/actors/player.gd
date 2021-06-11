extends KinematicBody2D

signal shoot(bullet, velocity, location)
signal health_changed(lives)

export var speed = 100
var velocity = Vector2(0,0)
var direction = Vector2(0,0)
var lives = 3
const Bullet = preload("res://src/actors/Bullet.tscn")

func _physics_process(_delta):
	velocity = move_player()

func _process(_delta):
	# Player faces mouse cursor
	look_at(get_global_mouse_position())
	shoot()

# Moves player in 4 directions
func move_player():
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = speed * direction.normalized()
	return move_and_slide(velocity)

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var bullet = Bullet.instance()
		bullet.velocity = Vector2.UP.rotated(rotation + PI/2) * 1000
		bullet.rotation = bullet.velocity.angle()
		bullet.position = position + bullet.velocity.normalized() * 70

		emit_signal("shoot", bullet)

func get_hurt():
	lives -= 1
	emit_signal("health_changed", lives)
	if lives <= 0:
		queue_free()

func _on_EnemyDetector_body_entered(body):
	get_hurt()
	body.knock_back(position)

func _on_BulletDetector_body_entered(body):
	get_hurt()
	body.queue_free()
	
