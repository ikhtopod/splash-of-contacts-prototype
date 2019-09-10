extends KinematicBody2D

onready var can_moving := false

func all_energies_is_pressed():
	for energy in get_tree().get_nodes_in_group("energy"):
		if !energy.is_pressed:
			return false
	
	return true


func _process(delta):
	can_moving = all_energies_is_pressed()
	get_node("../Control/PanelContainer/HBoxContainer/can_moving_label").text = str(can_moving)
