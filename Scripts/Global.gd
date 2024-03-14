extends Node2D


var score = 0
var combo = 0
var great = 0
var good = 0
var missed = 0
var grade = "NA"


func set_score(new):
	score = new
	if score > 1400000:
		grade = "A+"
	elif score > 1000000:
		grade = "A"
	elif score > 800000:
		grade = "A-"
	elif score > 750000:
		grade = "B+"
	elif score > 700000:
		grade = "B"
	elif score > 650000:
		grade = "B-"
	elif score > 550000:
		grade = "C+"
	elif score > 500000:
		grade = "C"
	elif score > 450000:
		grade = "C-"
	elif score > 350000:
		grade = "D+"
	elif score > 300000:
		grade = "D"
	elif score > 200000:
		grade = "D-"
	else:
		grade = "F"
		
