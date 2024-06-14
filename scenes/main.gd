extends Sprite2D

var score := [0, 0]# 0:Player, 1: CPU
const MAX_SCORE : int = 5
const PADDLE_SPEED : int = 500

func _on_ball_timer_timeout():
	$Ball.new_ball()

func _on_score_left_body_entered(body):
	score[1] += 1
	$Hud/CPUScore.text = str(score[1])
	if score[1] >= MAX_SCORE:
		show_victory_screen("Player Vermelho")
	$BallTimer.start()

func _on_score_right_body_entered(body):
	score[0] += 1
	$Hud/PlayerScore.text = str(score[0])
	if score[0] >= MAX_SCORE:
		show_victory_screen("Player Azul")
	$BallTimer.start()

func show_victory_screen(winner: String):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if winner == "Player Vermelho":
		get_tree().change_scene_to_file("res://scenes/VictoryRedScreen.tscn")
	elif winner == "Player Azul":
		get_tree().change_scene_to_file("res://scenes/VictoryBlueScreen.tscn")
	
