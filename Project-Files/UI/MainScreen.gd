extends Control
var scene_to_load

func _ready():
	$VBoxContainer/Button.grab_focus()
	
func _on_Button_pressed():
	scene_to_load = "res://dialogic/Cutscene.tscn"
	$fade_in.show()
	$fade_in.fade_in()

func _on_fade_in_fade_finished():
	get_tree().change_scene(scene_to_load)


func _on_Quit_pressed():
	get_tree().quit()
