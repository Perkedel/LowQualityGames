extends Panel

@onready var contenting:Control = $RowStuffs/Content
var contentInstance:Node
@export
var stuffContent:PackedScene:
	get:
		return stuffContent
	set(value):
		# clear everything in contenting
		clearContent()
		if(value != null):
			contentInstance = value.instantiate()
			installContent(contentInstance)
		stuffContent = value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	refreshContent()
	pass # Replace with function body.

func installContent(node:Node):
	#if not contenting:
		#contenting = $RowStuffs/Content
	if contenting:
		contenting.add_child(node)
	#contenting.add_child(node)
	#$RowStuffs/Content.add_child(node)
	pass

func clearContent():
	# https://godotforums.org/d/22776-how-to-remove-all-children-we-have-added
	# https://www.reddit.com/r/godot/comments/9qmjfj/remove_all_children/
	# https://github.com/godotengine/godot-proposals/issues/764
	#if not contenting:
		#contenting = $RowStuffs/Content
	if contenting:
		for thing in contenting.get_children():
			contenting.remove_child(thing)
			thing.free()
			pass
	#for thing in contenting.get_children():
		#contenting.remove_child(thing)
		#thing.free()
		#pass
	pass

func setTitle(into:String):
	if contentInstance and contentInstance.has_method("setTitle"):
		contentInstance.call_deferred("setTitle",into)
		pass
	pass

func setTitleSmall(into:String):
	if contentInstance and contentInstance.has_method("setTitleSmall"):
		contentInstance.call_deferred("setTitleSmall",into)
		pass
	pass

func refreshContent():
	clearContent()
	#if contenting:
		#contentInstance = contenting.instantiate()
	contentInstance = stuffContent.instantiate()
	if contentInstance:
		installContent(contentInstance)
	pass

func _repositionPopupMenu():
	var buttonPos:Vector2 = $RowStuffs/NavMenu.position
	var calculatePos:Vector2 = Vector2(buttonPos.x,buttonPos.y + $RowStuffs/NavMenu.size.y)
	$PopupMenu.position = calculatePos
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_RESIZED:
			_repositionPopupMenu()
			pass
		NOTIFICATION_WM_SIZE_CHANGED:
			_repositionPopupMenu()
		_:
			pass
	pass

func _on_nav_back_pressed() -> void:
	#refreshContent()
	pass # Replace with function body.


func _on_nav_menu_pressed() -> void:
	_repositionPopupMenu()
	$PopupMenu.popup()
	pass # Replace with function body.
