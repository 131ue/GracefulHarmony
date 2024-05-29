extends Control
const SceneB = preload("res://BackGroundStoryC.tscn")
const SceneC = preload("res://BackGroundStoryB.tscn")
const Tutorial = preload("res://Scenes/Tutorial.tscn")
var transitioned_times = 0
func _ready():
	$SceneAsound.play()
	pass

func _process(delta):
	
	if Input.is_action_just_pressed("ui_accept"):
		$FadeAnimation.visible = true
		$FadeAnimation.transition()
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")
func _on_fade_animation_transitioned():
	
	if transitioned_times == 0:
		$AnimationPlayer.play("SoundA_Fadeout")
		$CurrentScene.get_child(0).queue_free()
		$CurrentScene.add_child(SceneB.instantiate())
		transitioned_times = transitioned_times + 1
		print("changed to Scene B")
		await get_tree().create_timer(1).timeout
		$SceneBsound.play()
	
	elif transitioned_times == 1:
		$CurrentScene.get_child(0).queue_free()
		$CurrentScene.add_child(SceneC.instantiate())
		transitioned_times = transitioned_times + 1
		print("changed to Scene C")
			
	elif transitioned_times == 2:
		$CurrentScene.get_child(0).queue_free()
		$CurrentScene.add_child(Tutorial.instantiate())
		transitioned_times = transitioned_times + 1
		print("changed to Tutorial")
		
		
	else:
		get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")
		
	print("Swapped")
