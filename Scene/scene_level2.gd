extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is triangle_player == false:
		return
	SignalBus.emit_signal("push_level1")
	#play_square_push()
	pass # Replace with function body.

#func play_square_push():
	#var tween = create_tween()
	#tween.tween_property($Area2D/Square, "scale", Vector2(0.55, 0.55), 0.1).from(Vector2(0, 0))
	#tween.tween_property($Area2D/Square, "position", Vector2.ZERO, 0.15).from(Vector2(0, -75))
	#tween.tween_property($Area2D/Square, "position", Vector2(0, -75), 0.25).from(Vector2(0, 0))
	#tween.tween_property($Area2D/Square, "scale", Vector2.ZERO, 0.25).from(Vector2(0.65, 0.65))
	#pass

@onready var pasgr = preload("res://Char/passengersquare.tscn")
var i = 1
func generate_passenger():
	var pasgr_instance_1 = pasgr.instantiate()
	#pasgr_instance_1.name = "pasgr_instance_" + str(i)
	#i += 1
	var pasgr_instance_2 = pasgr.instantiate()
	#pasgr_instance_2.name = "pasgr_instance_" + str(i)
	#i += 1
	#print(i)
	
	var start_point_down = Vector2(0, randi_range(0, 500))
	var start_point_up = Vector2(600, randi_range(0, 500))
	
	pasgr_instance_1.position = start_point_up
	pasgr_instance_2.position = start_point_down
	
	pasgr_instance_1.go_up = true
	pasgr_instance_2.go_up = false
	
	$PassengerMovingSys.add_child(pasgr_instance_1)
	$PassengerMovingSys.add_child(pasgr_instance_2)
	#get_node("PassengerMovingSys").add_child(pasgr_instance_2)
	add_child(pasgr_instance_2)
	
	
func _on_generate_timer_timeout():

	generate_passenger()



