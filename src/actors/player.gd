extends KinematicBody2D

signal shoot(bullet, velocity, location)

export var speed = 100
var velocity = Vector2(0,0)
var direction = Vector2(0,0)
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
		bullet.position = position

		emit_signal("shoot", bullet)

func _on_Area2D_body_entered(body):
	print(body.name)
