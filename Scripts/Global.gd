extends Node2D


var score = 0
var combo = 0
var great = 0
var good = 0
var missed = 0
var grade = "NA"
var level = 0
#誠懇踏實創新超越

func set_score(new):
	score = new
	if score > 450000:
		grade = "越"
		level = 8
	elif score > 350000 + 50000:
		grade = "超"
		level = 7
	elif score > 300000 + 50000:
		grade = "新"
		level = 6
	elif score > 250000 + 50000:
		grade = "創"
		level = 5
	elif score > 270000:
		grade = "實"
		level = 4
	elif score > 140000:
		grade = "踏"
		level = 3
	elif score > 70000:
		grade = "懇"
		level = 2
	else:
		grade = "誠"
		level = 1
	
		
