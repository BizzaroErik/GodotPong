class_name Player
extends Node

@export var player_number: int
@export var is_other_player: bool
var flat_paddle: PackedScene = preload("res://Scenes/player_paddle_rectangle.tscn")
var round_paddle: PackedScene = preload("res://Scenes/player_paddle_sphere.tscn")
var current_paddle: Paddle
var score: int = 0

func _ready() -> void:
	add_flat_paddle()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui1_right"):
		current_paddle.queue_free()
		add_round_paddle()
	if Input.is_action_just_pressed("ui1_left"):
		current_paddle.queue_free()
		add_flat_paddle()

func add_flat_paddle():
	current_paddle = flat_paddle.instantiate()
	self.add_child(current_paddle)
	current_paddle.is_other_player = is_other_player
	set_paddle_position()

func add_round_paddle():
	current_paddle = round_paddle.instantiate()
	self.add_child(current_paddle)
	current_paddle.is_other_player = is_other_player
	set_paddle_position()

func set_paddle_position():
	var window: Vector2 = get_window().get_viewport().size
	current_paddle.position.y = window.y/2
	
	if is_other_player:
		current_paddle.position.x = window.x - 10
	else:
		current_paddle.position.x = 10
