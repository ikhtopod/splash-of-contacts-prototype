extends Area2D

onready var is_pressed := false


func _on_energy_area_entered(area):
	print("Area Entered: " + str(area))
	is_pressed = true


func _on_energy_area_exited(area):
	print("Area Exited: " + str(area))
	is_pressed = false
