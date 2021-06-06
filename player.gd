extends KinematicBody2D

export var speed = 1000
var velocity = Vector2(0,0)
var direction = Vector2(0,0)


func _physics_process(delta):
	velocity = move_player()


func move_player():
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = speed * get_physics_process_delta_time() * direction
	return move_and_slide(velocity)
