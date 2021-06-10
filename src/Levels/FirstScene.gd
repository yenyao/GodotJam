extends Node2D

func _on_Player_shoot(bullet):
	bullet.velocity *= 0.5
	add_child(bullet)
func _ready():
	var Enemy = get_node("Enemy") 
	var Player = get_node("Player")
	Enemy.target = Player

