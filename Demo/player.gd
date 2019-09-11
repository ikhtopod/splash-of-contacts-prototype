extends Area2D

onready var can_moving := false
var capture: Area2D = null

func all_energies_is_pressed():
	for energy in get_tree().get_nodes_in_group("energy"):
		if !energy.is_pressed:
			return false
	
	return true


func _process(delta):
	can_moving = all_energies_is_pressed()
	get_node("../Control/PanelContainer/HBoxContainer/can_moving_label").text = str(can_moving)
	
	if can_moving and capture != null and capture.is_in_group("finger"):
		position = capture.position


func _on_player_area_entered(area):
	if capture == null and area.is_in_group("finger"):
		capture = area


func _on_player_area_exited(area):
	if capture == area:
		capture = null
	