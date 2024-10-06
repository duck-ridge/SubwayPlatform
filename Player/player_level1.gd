extends RigidBody2D
class_name square_player

@export var move_speed: float = 160.0
var action_locked: bool = false

func _ready():
	SignalBus.connect("push_level1", push_level1_effect)
	$Hint.scale = Vector2(0, 0)
	$Indicator.hide()
	linear_damp = 8.0

func _process(delta: float) -> void:
	if action_locked == true:
		return
		
	Global.player_pos = position
	
	var direction = Vector2.ZERO

	# 获取输入
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# 正规化方向向量
	direction = direction.normalized()

	# 应用力
	if direction != Vector2.ZERO:
		apply_central_force(direction * move_speed)

func push_level1_effect():
	apply_central_force(Vector2(0, 1) * 120000)
	print("push_level1_effect here")

func show_help_hint():
	var tween = create_tween()
	tween.tween_property($Hint, "scale", Vector2(1, 1), 0.1).from(Vector2.ZERO)

func hide_help_hint():
	var tween = create_tween()
	tween.tween_property($Hint, "scale", Vector2(0, 0), 0.1).from(Vector2.ONE)
	

func _on_help_zone_body_entered(body):
	if body is circleNPC:
		print("x")
		show_help_hint()

func _on_help_zone_body_exited(body):
	if body is circleNPC:
		hide_help_hint()
		
func _input(event):
	if Input.is_action_just_pressed("help"):
		
		SignalBus.emit_signal("help_NPC")
		SignalBus.emit_signal("stop_breath_audio")
		$HelpZone/CollisionShape2D.call_deferred("disabled", true)
		$Hint.hide()

func pulsing():
	var pulsing_tween = create_tween()
	pulsing_tween.set_loops()
	pulsing_tween.tween_property($Square, "scale", Vector2(0.8, 0.8), 0.45).from(Vector2(1.0, 1.0))
	pulsing_tween.tween_property($Square, "scale", Vector2(1.0, 1.0), 0.45).from(Vector2(0.8, 0.8))
