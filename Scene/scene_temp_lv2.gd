extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	circle_move()
	$PlayerLevel1.action_locked = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func _on_area_2d_body_entered(body):
	#if body is square_player == false:
		#return
	#SignalBus.emit_signal("push_level1")
	##play_square_push()
	#$Area2D/CollisionShape2D.set_deferred("disabled", true)
	


#func play_square_push():
#
	#var tween = create_tween()
	#tween.tween_property($Area2D/Triangle, "scale", Vector2(0.75, 0.75), 0.1).from(Vector2(0, 0))
	#tween.tween_property($Area2D/Triangle, "position", Vector2(10, 0), 0.15).from(Vector2(10, -75))
	#tween.tween_property($Area2D/Triangle, "position", Vector2(10, -75), 0.25).from(Vector2(10, 0))
	#tween.tween_property($Area2D/Triangle, "scale", Vector2.ZERO, 0.25).from(Vector2(0.75, 0.75))
	
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
	
	var start_point_down = Vector2(-600, randi_range(250, 600))
	var start_point_up = Vector2(900, randi_range(250, 600))
	
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



@onready var CircleNPC = $CircleNPC

func circle_move():
	var tween = create_tween()
	tween.tween_property(CircleNPC, "position", Vector2(-100, 560), 5).from(Vector2(-300, 560))
	
	tween.tween_property(CircleNPC, "position", Vector2(-100, 560), 0.8).from(Vector2(-100, 560))
	
	tween.tween_property(CircleNPC, "position", Vector2(-85, 590), 3).from(Vector2(-100, 560))
	
	tween.tween_property(CircleNPC, "position", Vector2(-85, 590), 0.5).from(Vector2(-85, 590))
	
	tween.tween_property(CircleNPC, "position", Vector2(-95, 560), 1.25).from(Vector2(-85, 590))
	
	

func _on_end_zone_body_entered(body):
	if body is square_player == false:
		return

	get_tree().change_scene_to_file("res://Scene/scene_temp.tscn")


func _on_action_lock_timer_timeout():
	$PlayerLevel1.action_locked = false
