extends Area2D

var capture: Area2D = null


func _input(event):
	if event is InputEventScreenTouch and !event.is_pressed() and capture != null:
		get_tree().quit()

func _on_zone_area_entered(area):
	if capture == null and area.is_in_group("player"):
		capture = area


func _on_zone_area_exited(area):
	if capture == area:
		capture = null
