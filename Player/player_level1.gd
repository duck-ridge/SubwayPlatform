extends RigidBody2D
class_name triangle_player

@export var move_speed: float = 400.0

func _ready():
	SignalBus.connect("push_level1", push_level1_effect)
	linear_damp = 8.0

func _process(delta: float) -> void:
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
