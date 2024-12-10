class_name Paddle
extends CharacterBody2D

var is_other_player: bool
const SPEED = 300.0

		
func _physics_process(delta: float) -> void:
	var direction
	if is_other_player:
		direction = Input.get_axis("ui2_up", "ui2_down")
	else:
		direction = Input.get_axis("ui1_up", "ui1_down")	
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(0, velocity.y, SPEED)
	move_and_slide()
