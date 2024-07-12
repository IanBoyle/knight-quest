extends Area2D

signal player_entered


# Time to restart after death
@onready var timer = $Timer

# Restart the game when you fall off the map.
func _on_body_entered(body):
	print("Died!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
