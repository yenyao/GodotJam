extends KinematicBody2D

var velocity = Vector2(100,0)

func _physics_process(_delta):
	move_bullet()

func move_bullet():
	velocity = move_and_slide(velocity)

