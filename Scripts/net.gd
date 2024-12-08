extends Area2D

@export var is_player_one_scoring_wall := false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		$"../..".score(is_player_one_scoring_wall)
