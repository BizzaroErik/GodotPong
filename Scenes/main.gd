class_name Main
extends Node2D

@onready var player1: PlayerPaddle = get_node("PlayerPaddle1")
@onready var player2: PlayerPaddle = get_node("PlayerPaddle2")
var ball: PackedScene = preload("res://Scenes/ball.tscn")

func _ready() -> void:
	ball_spawner()

func score(is_player_one: bool):
	if is_player_one:
		player1.score += 1
	else:
		player2.score += 1
	
	print("Player 1 Score: " + str(player1.score))
	print("Player 2 Score: " + str(player2.score))
	
	var receiving_player
	if is_player_one:
		receiving_player = player2
	else:
		receiving_player = player1
	
	ball_spawner()
	
func ball_spawner():
	var next_ball: Ball = ball.instantiate()
	next_ball.linear_velocity = Vector2(-200, 0)
	self.add_child(next_ball)
