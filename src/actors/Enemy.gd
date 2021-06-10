extends KinematicBody2D

export var speed = 100
var velocity = Vector2(0,0)
var direction = Vector2(1,0)
var target = null


func _physics_process(delta):
	velocity = move_enemy()

func move_enemy():
	if target != null:
		direction = (target.position - position).normalized()
		velocity = speed * direction
		return move_and_slide(velocity)


