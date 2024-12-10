class_name Paddle
extends CharacterBody2D

var is_other_player: bool
const SPEED = 300.0

func _ready() -> void:
	var mesh_material: Material = get_node("MeshInstance2D").material

		
func _physics_process(delta: float) -> void:
	var direction
	if is_other_player:
		direction = Input.get_axis("ui2_up", "ui2_down")
	else:
		direction = Input.get_axis("ui1_up", "ui1_down")
	
	if Input.is_action_just_pressed("ui1_right"):
		paddle_shape_state()
		
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(0, velocity.y, SPEED)

	move_and_slide()


func paddle_shape_state() -> void:
	pass
	
