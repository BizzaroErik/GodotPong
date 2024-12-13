class_name Ball
extends RigidBody2D

var speed: float = 200.0

func _ready() -> void:
	position.x = 854/2
	position.y = 480/2
	

func set_velocity_towards_player(player_position: Vector2):
	var direction = player_position - position
	direction = direction.normalized()
	linear_velocity = direction * speed

func _on_timer_timeout() -> void:
	linear_velocity *= 1.1

func remove():
	self.remove_from_group("ball")
	self.queue_free()
