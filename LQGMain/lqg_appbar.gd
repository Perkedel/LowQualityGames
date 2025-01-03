extends Panel

@onready var contenting:Control = $RowStuffs/Content
@export
var stuffContent:Control:
	get:
		return stuffContent
	set(value):
		# clear everything in contenting
		clearContent()
		installContent(value)
		stuffContent = value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func installContent(node:Control):
	contenting.add_child(node)
	pass

func clearContent():
	# https://godotforums.org/d/22776-how-to-remove-all-children-we-have-added
	# https://www.reddit.com/r/godot/comments/9qmjfj/remove_all_children/
	# https://github.com/godotengine/godot-proposals/issues/764
	for thing in contenting.get_children():
		contenting.remove_child(thing)
		contenting.free()
		pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_nav_back_pressed() -> void:
	pass # Replace with function body.
