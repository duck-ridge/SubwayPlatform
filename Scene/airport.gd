extends Node2D



func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scene/scene_temp_lv2.tscn")
