extends MarginContainer

onready var number = get_node("HBoxContainer/Number")

func _on_Player_health_changed(lives):
	number.text = str(lives)
