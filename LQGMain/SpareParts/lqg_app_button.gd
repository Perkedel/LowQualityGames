extends Button

class_name LQG_AppButton

var idName = ""
signal launchApp(idOf:String)
@export var label:String= "APP" : 
	set(value):
		text = value
		label = value

@export var iconing:Texture2D = preload("res://LQGMain/Assets/img/mavrickle.png"):
	set(value):
		icon = value
		iconing = value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	emit_signal("launchApp",idName)
	pass # Replace with function body.
