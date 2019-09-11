extends Area2D

onready var is_pressed := false
var capture: Area2D = null

func _on_energy_area_entered(area):
	if capture == null and area.is_in_group("finger"):
		capture = area
		is_pressed = true


func _on_energy_area_exited(area):
	if capture == area:
		capture = null
		is_pressed = false
