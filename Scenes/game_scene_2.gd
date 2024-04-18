extends Node2D

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var bpm = 115

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var lane = 0
var rand = 0
var note = load("res://Scenes/Note.tscn")
var instance

const great_score = 1000
const good_score = 500
const bad_score = 0

var score_multiplyer
func _spawn_three_notes():
	_spawn_notes(0)
	_spawn_notes(1)
	_spawn_notes(2)
func _spawn_two_notes(lane0,lane1):
	_spawn_notes(lane0)
	_spawn_notes(lane1)
func _delayed(time_in_seconds):
	await get_tree().create_timer(int(time_in_seconds)).timeout
func _endscreen():
	Global.set_score(score)
	Global.combo = max_combo
	Global.great = great
	Global.good = good
	Global.missed = missed
	if get_tree().change_scene_to_file("res://Scenes/End.tscn") != OK:
		print ("Error changing scene to End")
func _ready():
	$Conductor.play_with_beat_offset(8)
	await get_tree().create_timer(2.9).timeout
	_spawn_notes(0)
	await get_tree().create_timer(0.53).timeout
	_spawn_notes(0)
	await get_tree().create_timer(0.53).timeout
	_spawn_notes(0)
	await get_tree().create_timer(0.6).timeout
	_spawn_notes(0)
	await get_tree().create_timer(0.25).timeout
	_spawn_notes(0)
	await get_tree().create_timer(0.57).timeout
	_spawn_notes(0)
	await get_tree().create_timer(0.57).timeout
	_spawn_notes(0)
	await get_tree().create_timer(0.71).timeout
	_spawn_notes(1)
	await get_tree().create_timer(0.71).timeout
	_spawn_notes(2)

	
func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
			print ("Error changing scene to Menu")

func _spawn_notes(lane):
	instance = note.instantiate()
	instance.initialize(lane)
	add_child(instance)

func increment_score(by):
	if by > 0:
		combo += 1
	else:
		combo = 0
	
	if by == great_score:
		great += 1
	elif by == good_score:
		good += 1
	else:
		missed += 1
	
	if by >= 0:
		score_multiplyer =  combo  / 5.0
		score += by * clamp(score_multiplyer,1,4)
	else:
		score -= by * combo
		
	$Label.text = str(score)
	if combo > 0:
		$Combo.text = str(combo) + " 連擊!"
		if combo > max_combo:
			max_combo = combo
	else:
		$Combo.text = ""


func reset_combo():
	combo = 0
	$Combo.text = ""
