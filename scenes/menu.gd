extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
 pass

func _on_Button_button_down():
	print("switch!")
	get_tree().change_scene("res://scenes/test.tscn")
