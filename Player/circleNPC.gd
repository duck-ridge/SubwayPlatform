extends CharacterBody2D
class_name  circleNPC
var is_followed: bool = false
var can_followed: bool = false
var speed: int = 150
var range

var is_pulsing: bool = false


func pulsing():
	if is_pulsing == false:
		return
	var pulsing_tween = create_tween()
	pulsing_tween.set_loops()
	pulsing_tween.tween_property($Sprite2D, "scale", Vector2(0.4, 0.4), 0.45).from(Vector2(0.5, 0.5))
	pulsing_tween.tween_property($Sprite2D, "scale", Vector2(0.5, 0.5), 0.45).from(Vector2(0.4, 0.4))
	pass

# Called when the node enters the scene tree for the first time.
func _ready():

	pulsing()
	SignalBus.connect("help_NPC", hold_hand)
	SignalBus.connect("stop_breath_audio", stopplay_breath)
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
	if range < 80:
		is_followed = false
	elif range > 500:
		is_followed = false
	else:
		is_followed = true
		
	if is_followed == false:
		return
		
	var direction = (Global.player_pos - position).normalized()
	velocity = direction * speed
	
	move_and_slide()
	pass


func _on_breath_timer_timeout():
	is_pulsing = true
	pulsing()
	$AudioBreath.play()
	print("XXXX")
	
func stopplay_breath():
	is_pulsing = true
	#pulsing_tween.stop()
	$AudioBreath.playing = false
	$AudioGlow.play()
	print("XXX")
