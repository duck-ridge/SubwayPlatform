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
	play_square_push()
	pass # Replace with function body.

func play_square_push():
	var tween = create_tween()
	tween.tween_property($Area2D/Square, "scale", Vector2(0.55, 0.55), 0.1).from(Vector2(0, 0))
	tween.tween_property($Area2D/Square, "position", Vector2.ZERO, 0.15).from(Vector2(-75, 0))
	tween.tween_property($Area2D/Square, "position", Vector2(-75, 0), 0.25).from(Vector2(0, 0))
	tween.tween_property($Area2D/Square, "scale", Vector2.ZERO, 0.25).from(Vector2(0.65, 0.65))
	pass
