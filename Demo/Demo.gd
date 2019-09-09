extends Node2D


func ShowTouchManagerStat() -> void:
	for i in range(TouchManager.MultiTouch.MAX_TOUCH):
		var pressed_node = get_node("Control/PanelContainer/HBoxContainer/pressed/" + str(i))
		var position_node = get_node("Control/PanelContainer/HBoxContainer/position/" + str(i))
		pressed_node.text = str(TouchManager.current_touch.At(i).IsPressed())
		position_node.text = str(TouchManager.current_touch.At(i).GetPosition())


""" ### Godot events ### """

func _process(delta):
	ShowTouchManagerStat()


func _on_TouchScreenButton_pressed():
	get_tree().quit()
