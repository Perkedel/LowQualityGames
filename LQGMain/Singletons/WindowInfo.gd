extends Node

#class_name WindowInfo
enum WindowType{Compact,Medium,Expanded}

@export
var screenWidthInfo:WindowType
var screenHeightInfo:WindowType
var screenWidth:float
var screenHeight:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func rememberWindowInfo(basedOnThisWindowSize:Vector2 = Vector2.ZERO) -> WindowInfo:
	# https://youtu.be/HmXgVBys7BU Philip Lackner window info
	screenWidthInfo = WindowType.Compact if (basedOnThisWindowSize.x < 600) else WindowType.Medium if (basedOnThisWindowSize.x < 840) else WindowType.Expanded
	screenHeightInfo = WindowType.Compact if (basedOnThisWindowSize.y < 480) else WindowType.Medium if (basedOnThisWindowSize.y < 900) else WindowType.Expanded
	screenWidth = basedOnThisWindowSize.x
	screenHeight = basedOnThisWindowSize.y
	return self
	pass
