extends Node

@onready var points_label: Label = %PointsLabel
@export var hearts : Array[Node]

var points = 0 
var lives = 3
var total_collectibles = 0

func decrease_health():
	lives -= 1
	print(lives)
	for h in 3:
		if (h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
	if (lives == 0):
		get_tree().reload_current_scene()

func add_points():
	points += 1
	print(points)
	points_label.text = "Points: " + str(points)

func set_total_collectibles(amount: int):
	points = 0  # Reset score for each new level!
	total_collectibles = amount
	points_label.text = "Points: 0"
	print("Total collectibles in this level:", total_collectibles)


func all_collected() -> bool:
	return points >= total_collectibles
