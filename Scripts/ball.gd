class_name Ball
extends RigidBody2D

var speed: float = 200.0

func _ready() -> void:
	var window: Vector2 = get_window().get_viewport().size
	position.x = window.x/2
	position.y = window.y/2
	

func set_velocity_towards_player(player_position: Vector2):
	var direction = player_position - position
	direction = direction.normalized()
	linear_velocity = direction * speed

func _on_timer_timeout() -> void:
	linear_velocity *= 1.1
