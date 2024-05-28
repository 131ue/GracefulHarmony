extends Control
const SceneTwo = preload("res://BackGroundStoryB.tscn")

var transitioned_times = 0
func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$FadeAnimation.visible = true
		$FadeAnimation.transition()
func _on_fade_animation_transitioned():
	$CurrentScene.get_child(0).queue_free()
	if transitioned_times == 0:
		$CurrentScene.add_child(SceneTwo.instantiate())
		transitioned_times = transitioned_times + 1
	else:
		print("changed too many times")
	print("Swapped")
	
