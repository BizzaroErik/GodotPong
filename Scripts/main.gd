class_name Main
extends Node2D

@export var winning_score: int = 2
@onready var player1: Player = get_node("Player1")
@onready var player2: Player = get_node("Player2")
var ball: PackedScene = preload("res://Scenes/ball.tscn")
@onready var ui: Control = get_node("UI")

func _ready() -> void:
	ball_spawner(player1.get_paddle().position)

func score(is_player_one: bool):
	if is_player_one:
		set_score(player1)
		check_winner(player1)
	else:
		set_score(player2)
		check_winner(player2)
	
	
	#ToDo:: Aim ball towards reciving player before launching
	var receiving_player
	if is_player_one:
		receiving_player = player2
	else:
		receiving_player = player1
	
	ball_spawner(receiving_player.get_paddle().position)

func check_winner(player: Player):
	if player.score >= winning_score:
		$UI.game_finished(player)
		
func ball_spawner(target_position: Vector2):
	var next_ball: Ball = ball.instantiate()
	self.add_child(next_ball)
	next_ball.set_velocity_towards_player(target_position)

func set_score(player: Player) -> void:
	player.score += 1
	get_node("UI/PlayerInfo/Player" + str(player.player_number) + "/PlayerScore").text = str(player.score)
