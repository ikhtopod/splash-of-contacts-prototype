extends Node


class TouchEventStat:
	var m_pressed: bool setget SetPressed, IsPressed
	var m_position: Vector2 setget SetPosition, GetPosition
	
	func _init(pressed := false, position := Vector2()) -> void:
		m_pressed = pressed
		m_position = position
	
	func IsPressed() -> bool:
		return m_pressed
	
	func SetPressed(pressed: bool) -> void:
		m_pressed = pressed
	
	func GetPosition() -> Vector2:
		return m_position
	
	func SetPosition(position: Vector2) -> void:
		m_position = position


class MultiTouch:
	var m_touch: Array
	
	func _init() -> void:
		for i in range(5):
			m_touch.append(TouchEventStat.new())
	
	func Size() -> int:
		return m_touch.size()
	
	func At(var index: int) -> TouchEventStat:
		if index < 0 or index >= self.Size():
			return null
		
		return m_touch[index]
	
	func GetOnlyPressed() -> Array:
		var result := []
		
		for touch in m_touch:
			if touch.GetPressed():
				result.append(touch)
		
		return result


onready var current_touch := MultiTouch.new()


""" 
func _process(delta):
	for t in touches:
		print(str(t.GetPosition()) + " [" + str(t.IsPressed()) + "]")
"""

func _input(event):
	if event is InputEventScreenTouch:
		if (event.index < current_touch.Size()):
			if (event.is_pressed()):
				current_touch.At(event.index).SetPressed(true)
				current_touch.At(event.index).SetPosition(event.position)
			else:
				current_touch.At(event.index).SetPressed(false)
	elif event is InputEventScreenDrag:
		if (event.index < current_touch.Size()):
			current_touch.At(event.index).SetPosition(event.position)
