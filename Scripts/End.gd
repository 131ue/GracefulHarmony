extends Node2D


func _ready():
	if (Global.level == 8):
		$Yuae.modulate = Color("34ff49")
		$Yuae/Yuae_Arrow.visible = true
		$Yuae/Yuae_Arrow.modulate = Color("34ff49")
	elif (Global.level == 7):
		$Chao.modulate = Color("24b233")
		$Chao/Chao_Arrow.visible = true
		$Chao/Chao_Arrow.modulate = Color("24b233")
	elif (Global.level == 6):
		$Xin.modulate = Color("fb2c86")
		$Xin/Xin_Arrow.visible = true
		$Xin/Xin_Arrow.modulate = Color("fb2c86")
	elif (Global.level == 5):
		$Chung.modulate = Color("ae1e5d")
		$Chung/Chung_Arrow.visible = true
		$Chung/Chung_Arrow.modulate = Color("ae1e5d")
	elif (Global.level == 4):
		$Shih.modulate = Color("04dcdc")
		$Shih/Shih_Arrow.visible = true
		$Shih/Shih_Arrow.modulate = Color("04dcdc")
	elif (Global.level == 3):
		$Ta.modulate = Color("028f8f")
		$Ta/Ta_Arrow.visible = true
		$Ta/Ta_Arrow.modulate = Color("028f8f")
	elif (Global.level == 2):
		$Ken.modulate = Color("fc9748")
		$Ken/Ken_Arrow.visible = true
		$Ken/Ken_Arrow.modulate = Color("fc9748")
	else:
		$Chen.modulate = Color("af6932")
		$Chen/Chen_Arrow.visible = true
		$Chen/Chen_Arrow.modulate = Color("af6932")
	
	$ScoreNumber.text = str(Global.score)
	$ComboNumber.text = str(Global.combo)
	$GreatNumber.text = str(Global.great)
	$GoodNumber.text = str(Global.good)
	$MissedNumber.text = str(Global.missed)
	


func _on_PlayAgain_pressed():
	get_tree().change_scene_to_file("res://Scenes/game_scene_2.tscn") 
func _on_BackToMenu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn") 
