class_name Player
extends Node

@export var player_number: int
@export var is_other_player: bool
var flat_paddle: PackedScene = preload("res://Scenes/player_paddle_rectangle.tscn")
var round_paddle: PackedScene = preload("res://Scenes/player_paddle_sphere.tscn")
var current_paddle: Paddle
var score: int = 0

func _ready() -> void:
	var new_paddle = flat_paddle.instantiate()
	var window: Vector2 = get_window().get_viewport().size
	set_paddle_position(new_paddle, window.y/2, 0.0)
	current_paddle = new_paddle
	self.add_child(current_paddle)
	current_paddle.is_other_player = is_other_player

func _process(delta: float) -> void:
	if is_other_player:
		if Input.is_action_just_pressed("ui2_right"):
			current_paddle.queue_free()
			add_round_paddle()
		if Input.is_action_just_pressed("ui2_left"):
			current_paddle.queue_free()
			add_flat_paddle()
	else:	
		if Input.is_action_just_pressed("ui1_right"):
			current_paddle.queue_free()
			add_round_paddle()
		if Input.is_action_just_pressed("ui1_left"):
			current_paddle.queue_free()
			add_flat_paddle()

func get_paddle() -> Paddle:
	return current_paddle

func set_paddle(new_paddle: Paddle):
	current_paddle.queue_free()
	current_paddle = new_paddle
	self.add_child(current_paddle)
	current_paddle.is_other_player = is_other_player
	
func add_flat_paddle():
	var new_paddle = flat_paddle.instantiate()
	set_paddle_position(new_paddle, current_paddle.position.y, current_paddle.velocity.y)
	set_paddle(new_paddle)

func add_round_paddle():
	var new_paddle = round_paddle.instantiate()
	set_paddle_position(new_paddle, current_paddle.position.y, current_paddle.velocity.y)
	set_paddle(new_paddle)

func set_paddle_position(new_paddle: Paddle, position: float, speed: float):
	var window: Vector2 = get_window().get_viewport().size
	new_paddle.position.y = position
	new_paddle.velocity.y = speed
	
	if is_other_player:
		new_paddle.position.x = window.x - 10
	else:
		new_paddle.position.x = 10
