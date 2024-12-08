class_name Ball
extends RigidBody2D

@export var velocity: Vector2 = Vector2(-200, 0)

func _ready() -> void:
	position.x = 427
	position.y = 240
	linear_velocity = velocity

func _on_body_entered(body: Node) -> void:
	print("body entered!!!")
	print(body.name)
	print(str(body.position.x))
	print(str(body.position.y))
