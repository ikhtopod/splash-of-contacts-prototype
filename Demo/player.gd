extends KinematicBody2D

onready var dragging = false

func _input(event):
	if (event is InputEventScreenTouch): # need detect collision
		dragging = event.pressed
	elif (event is InputEventScreenDrag) and dragging:
		position = event.position
