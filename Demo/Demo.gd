extends Node2D

onready var Finger := preload("res://Demo/finger.tscn")
onready var fingers := {}

func ShowTouchManagerStat() -> void:
	for i in range(TouchManager.MultiTouch.MAX_TOUCH):
		var index_node = get_node("Control/PanelContainer/HBoxContainer/index/" + str(i))
		var pressed_node = get_node("Control/PanelContainer/HBoxContainer/pressed/" + str(i))
		var position_node = get_node("Control/PanelContainer/HBoxContainer/position/" + str(i))
		index_node.text = str(TouchManager.current_touch.At(i).GetIndex())
		pressed_node.text = str(TouchManager.current_touch.At(i).IsPressed())
		position_node.text = str(TouchManager.current_touch.At(i).GetPosition())


""" ### Godot events ### """

func _process(delta):
	ShowTouchManagerStat()
	
	var curr_indices: Array = []
	
	for touch in TouchManager.current_touch.GetOnlyPressed():
		curr_indices.push_back(touch.GetIndex())
		
		if fingers.has(touch.GetIndex()):
			fingers[touch.GetIndex()].position = touch.GetPosition()
		else:
			fingers[touch.GetIndex()] = Finger.instance()
			fingers[touch.GetIndex()].position = touch.GetPosition()
			$fingers.add_child(fingers[touch.GetIndex()])
	
	for key in fingers.keys():
		if !curr_indices.has(key):
			fingers[key].queue_free()
			fingers.erase(key)


func _on_TouchScreenButton_pressed():
	get_tree().quit()
