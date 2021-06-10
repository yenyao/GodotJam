extends Node2D

func _on_Player_shoot(bullet):
	bullet.velocity *= 0.5
	add_child(bullet)

func _ready():
	var Enemies = get_tree().get_nodes_in_group("Enemies")
	var Player = get_node("Player")
	for Enemy in Enemies:
		Enemy.target = Player
