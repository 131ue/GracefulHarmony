extends Node2D


func _ready():
	if (Global.level == 8):
		$Yuae.modulate = Color("34ff49")
		#$Yuae/Yuae_Arrow.modulate = Color("34ff49")
		$Yuae/Yuae_Arrow.visible = true
	elif (Global.level == 7):
		$Chao.modulate = Color("24b233")
		#$Chao/Chao_Arrow.modulate = Color("24b233")
		$Chao/Chao_Arrow.visible = true
	elif (Global.level == 6):
		$Xin.modulate = Color("fb2c86")
		#$Xin/Xin_Arrow.modulate = Color("fb2c86")
		$Xin/Xin_Arrow.visible = true
	elif (Global.level == 5):
		$Chung.modulate = Color("ae1e5d")
		#$Chung/Chung_Arrow.modulate = Color("ae1e5d")
		$Chung/Chung_Arrow.visible = true
	elif (Global.level == 4):
		$Shih.modulate = Color("04dcdc")
		#$Shih/Shih_Arrow.modulate = Color("04dcdc")
		$Shih/Shih_Arrow.visible = true
	elif (Global.level == 3):
		$Ta.modulate = Color("028f8f")
		#$Ta/Ta_Arrow.modulate = Color("028f8f")
		$Ta/Ta_Arrow.visible = true
	elif (Global.level == 2):
		$Ken.modulate = Color("fc9748")
		#$Ken/Ken_Arrow.modulate = Color("fc9748")
		$Ken/Ken_Arrow.visible = true
	else:
		$Chen.modulate = Color("af6932")
		#$Chen/Chen_Arrow.modulate = Color("af6932")
		$Chen/Chen_Arrow.visible = true
	
	$ScoreNumber.text = str(Global.score)
	$ComboNumber.text = str(Global.combo)
	$GreatNumber.text = str(Global.great)
	$GoodNumber.text = str(Global.good)
	$MissedNumber.text = str(Global.missed)
	


func _on_PlayAgain_pressed():
	get_tree().change_scene_to_file("res://Scenes/game_scene_2.tscn") 
func _on_BackToMenu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn") 
