extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_RESIZED:
			#screenWidthInfo = 
			match(WindowInfo.screenWidthInfo):
				0:
					$Landscape.hide()
					$Portrait.show()
					pass
				1:
					pass
				2:
					$Landscape.show()
					$Portrait.hide()
					pass
				_:
					pass
			pass
		_:
			pass
	pass
