extends CharacterBody2D

var random_position: Vector2
var i: int
var speed
var go_up: bool
@export var stand: bool = false


func _ready():
	if stand == true:
		return
	
	if go_up == true:
		speed = -55
	else:
		speed = 55
	
func random_skin():
	pass
	
	
	
func _physics_process(delta):
	i += 1
	if i % 4 == 1:
		random_position = Vector2(randi_range(-1, 1), randi_range(-1, 1))
		position += random_position
	
	if stand == true:
		return
	velocity.x = speed
	move_and_slide()
	


func _on_destory_timer_timeout():
	queue_free()
