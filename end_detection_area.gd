extends Area2D

signal point_scored

func _on_body_entered(body):
	if body is Ball:
		point_scored.emit()
