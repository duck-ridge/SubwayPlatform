extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scene/airport.tscn")
