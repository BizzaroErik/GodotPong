extends Control

@onready var play_again_screen: ColorRect = get_node("PlayAgainScreen")

func _ready() -> void:
	play_again_screen.visible = false
	
func game_finished(player: Player) -> void:
	$PlayAgainScreen.show()
	$PlayAgainScreen/PlayAgainLabel.text = "Player " + str(player.player_number) + " Wins!"
	get_tree().paused = true

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
