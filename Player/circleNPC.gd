extends CharacterBody2D
class_name  circleNPC
var is_followed: bool = false
var can_followed: bool = false
var speed: int = 140
var range
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("help_NPC", hold_hand)
	#is_followed = true
	pass
	
func hold_hand():
	can_followed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	range = position.distance_to(Global.player_pos)
	
	if can_followed == false:
		return
	#print(range)
	if range < 60:
		is_followed = false
	elif range > 110:
		is_followed = false
	else:
		is_followed = true
		
	if is_followed == false:
		return
		
	var direction = (Global.player_pos - position).normalized()
	velocity = direction * speed
	
	move_and_slide()
	pass
