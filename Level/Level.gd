extends Spatial

var player1_score = 0
var player2_score = 0

export var target_score = 3

func _on_GoalDetector_body_entered(body, goal_id):
	print("Player" + str(goal_id) + " has scored")
	get_tree().call_group("game_pieces", "freeze")
	$Timer.start()
	update_score(goal_id)

func _on_Timer_timeout():
	get_tree().call_group("game_pieces", "reset")

func update_score(player):
	var new_score
	
	match player:
		1:
			player1_score += 1
			new_score = player1_score
		2:
			player2_score += 1
			new_score = player2_score
			
	$GUI.update_score(player, new_score)
	check_game_over(player, new_score)

func check_game_over(player, score):
	if score == target_score:
		$Timer.queue_free()
		$GUI.game_over(player)
