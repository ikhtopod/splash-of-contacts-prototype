extends Node2D

func _ready():
	pass

func _process(delta):
	for i in range(TouchManager.MultiTouch.MAX_TOUCH):
		var pressed_node = get_node("Control/PanelContainer/HBoxContainer/pressed/" + str(i))
		var position_node = get_node("Control/PanelContainer/HBoxContainer/position/" + str(i))
		pressed_node.text = str(TouchManager.current_touch.At(i).IsPressed())
		position_node.text = str(TouchManager.current_touch.At(i).GetPosition())
