extends KinematicBody2D

export var speed = 100
var velocity = Vector2(0,0)
var direction = Vector2(0,0)


func _physics_process(_delta):
	velocity = move_player()

func _process(_delta):
	# Player faces mouse cursor
	look_at(get_global_mouse_position())


# Moves player in 4 directions
func move_player():
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = speed * direction.normalized()
	return move_and_slide(velocity)
