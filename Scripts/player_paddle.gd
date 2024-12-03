class_name PlayerPaddle
extends CharacterBody2D

@export var is_player_two: bool
var score: int = 0
const SPEED = 300.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction
	if is_player_two:
		direction = Input.get_axis("ui2_up", "ui2_down")
	else:
		direction = Input.get_axis("ui1_up", "ui1_down")
		
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(0, velocity.y, SPEED)

	move_and_collide(velocity * delta)
