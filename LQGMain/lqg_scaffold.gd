extends Control

@onready var windowInfo:WindowInfo = WindowInfo.rememberWindowInfo(size)
var contentInstance:Node
@export var contenting:PackedScene:
	set(value):
		if(value != null):
			contentInstance = value.instantiate()
			installContent(contentInstance)
		contenting = value
	get:
		return contenting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func installContent(scene:Node):
	$VBoxContainer/Content.add_child(scene)
	pass

func clearContent():
	for thing in $VBoxContainer/Content.get_children():
		$VBoxContainer/Content.remove_child(thing)
		thing.free()
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_RESIZED:
			#Check IsCompact!
			windowInfo = WindowInfo.rememberWindowInfo(size)
			pass
		_:
			pass
	pass
