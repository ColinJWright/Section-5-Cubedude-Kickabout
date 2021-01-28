extends Spatial



func _on_GoalDetector_body_entered(body, goal_id):
	print("Player" + str(goal_id) + " has scored")
