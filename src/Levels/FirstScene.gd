extends Node2D


func _on_Player_shoot(Bullet, direction, location):
	var bullet = Bullet.instance()
	add_child(bullet)
	bullet.rotation = direction
	bullet.position = location
	bullet.velocity = bullet.velocity.rotated(direction)
