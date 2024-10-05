extends CharacterBody2D

var is_followed: bool = false
var speed: int = 140
var range
# Called when the node enters the scene tree for the first time.
func _ready():
	#is_followed = true
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	range = position.distance_to(Global.player_pos)
	print(range)
	if range < 50:
		is_followed = false
	elif range > 100:
		is_followed = false
	else:
		is_followed = true
		
	if is_followed == false:
		return
		
	var direction = (Global.player_pos - position).normalized()
	velocity = direction * speed
	
	move_and_slide()
	pass
