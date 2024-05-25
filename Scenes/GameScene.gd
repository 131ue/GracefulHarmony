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


var rand = 0
var note = load("res://Scenes/Note2.tscn")
var instance

const great_score = 1000
const good_score = 500
const bad_score = 0
var note_type = 0
var score_multiplyer

var spnote = 0
var time : float = 0.0
var mins : int = 0
var secs : int = 0
var msec : int = 0
var secsum : float = 0 
var note_counter:int = 0;
var note_pos:int = 0;
const deviation : float = 0.01
var too_fast_counter = 0
var too_fast_count: = [131,124,115,112,105,102,96,90,88,85,79,77,70,68,63,53,50,10,3]
var problematic_count = 0
var problematic_notes: = [143,141,140,138,136,135,132,129,128,127,122,121,120,118,116,113,108,106,103,99,98,97,93,86,82,73,72,66,65,64,61,60,59,58,57,56,55,51,43,23,20,19,17,15,14,13,12,11,8,7,6]
var note_time: = [88.87,87.29,86.44,85.64,85.11,84.34,83.91,83.07,82.36,82.01,80.88,80.17,79.97,79.44,78.77,77.98,77.27,76.9,76.51,76.36,75.82,75.03,74.29,73.61,73.22,72.56,72.21,71.53,71.3,70.79,70.1,69.9,69.41,67.95,67.59,66.98,66.62,65.92,65.69,65.18,64.45,64.24,63.75,62.54,61.83,61.13,60.45,60.26,59.74,59.38,58.72,58.33,57.03,56.85,56.35,56.14,55.65,54.97,54.78,54.32,53.9,53.25,52.88,51.49,51.31,50.8,50.61,50.07,49.06,48.76,48.11,47.42,46.05,45.83,45.4,45.2,44.73,44.01,43.38,42.75,42.53,42.07,41.22,40.43,39.7,38.99,38.22,37.5,36.84,35.39,35.17,34.67,33.93,33.71,33.18,31.78,31.45,31.08,30.74,29.68,29.08,27.78,27.45,27.17,26.81,25.82,25.42,25.09,23.81,23.51,23.18,22.87,21.88,21.56,21.25,19.92,19.65,19.33,18.97,17.97,17.18,15.73,14.2,13.43,12.62,12.24,11.57,11.2,10.49,9.75,9.03,8.29,7.56,7.38,6.86,6.2,5.49,4.77,4.42,4.05,3.89,3.42,2.85]
func _process(delta):
	time += delta
	@warning_ignore("narrowing_conversion")
	msec = fmod(time,1) * 100
	@warning_ignore("narrowing_conversion")
	secs = fmod(time,60)
	@warning_ignore("narrowing_conversion")
	mins = fmod(time,3600) / 60
	#secsum = float(secs) + float(msec) / 100
	secsum = time
	#print(secsum)
	if (secsum > float(note_time[142 - note_counter]) - deviation and secsum < float(note_time[142 - note_counter]) + deviation):
		if (note_time[142 - note_counter] == 69.41):
			_spawn_three_notes()
		elif (note_time[142 - note_counter] == 61.13):
			_spawn_three_notes()
		elif (note_time[142 - note_counter] == 74.29):
			_spawn_three_notes()
		elif (note_counter + 1 == problematic_notes[49 - problematic_count]):
			if (note_counter <70):
				if (problematic_count % 3 == 0):
					_spawn_two_notes(0,2)
				else:
					if (note_type == 100):
						_spawn_two_notes(1,2)
					elif (note_type == 010):
						_spawn_two_notes(0,2)
					else:
						_spawn_two_notes(0,1)
			else:
				if (note_type == 100):
					_spawn_two_notes(1,2)
				elif (note_type == 010):
					_spawn_two_notes(0,2)
				else:
					_spawn_two_notes(0,1)
			problematic_count += 1
		elif (note_counter + 1 == too_fast_count[18 - too_fast_counter]):
			#await get_tree().create_timer(0.1).timeout
			#_spawn_three_notes()
			#note_counter += 1
			#note_pos += 1
			too_fast_counter += 1
		#elif (note_time[142 - note_counter] == 3.89):
			#_spawn_notes(1)	
		#elif (note_time[142 - note_counter] == 11.2):
			#_spawn_notes(0)		
		else:
			_spawn_notes(spnote)
			if (spnote == 0):
				note_type = 100
			elif (spnote == 1):
				note_type = 010	
			else:
				note_type = 001
			spnote += 1
		if (spnote > 2 ):
			spnote = 0	
		note_counter += 1
		note_pos += 1
		
		#if(note_counter == 40):
			#_endscreen()
		if (note_counter == 143):
			await get_tree().create_timer(6).timeout
			_endscreen()
		#print(note_counter)
		#print(problematic_notes[49 - problematic_count])
		
	

		
func _spawn_three_notes():
	_spawn_notes(0)
	_spawn_notes(1)
	_spawn_notes(2)
func _spawn_two_notes(lane0,lane1):
	_spawn_notes(lane0)
	_spawn_notes(lane1)
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
