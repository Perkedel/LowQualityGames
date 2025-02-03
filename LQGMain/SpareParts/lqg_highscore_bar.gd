extends Control

@export var useSpecialBar:bool = false:
	set(value):
		$DefaultBar.visible = not value
		$SpecialBar.visible = value
		useSpecialBar = value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setDefaultText(into:String):
	if into != null:
		$DefaultBar/Contenter/VBoxContainer/Label.text = into
		pass
	pass

func setTitle(into:String):
	setDefaultText(into)

func setTitleSmall(into:String):
	setSubText(into)

func setSubText(into:String):
	if into != null:
		$DefaultBar/Contenter/VBoxContainer/Sublabel.text = into
		pass
	pass

func showSublabel(into:bool):
	$DefaultBar/Contenter/VBoxContainer/Sublabel.visible = into
	pass

func setTitleAlignment(horizontal:HorizontalAlignment = HORIZONTAL_ALIGNMENT_LEFT):
	$DefaultBar/Contenter/VBoxContainer/Label.horizontal_alignment = horizontal
	pass

func setTitleSmallAlignment(horizontal:HorizontalAlignment = HORIZONTAL_ALIGNMENT_LEFT):
	setSubLabelAlignment(horizontal)

func setSubLabelAlignment(horizontal:HorizontalAlignment = HORIZONTAL_ALIGNMENT_LEFT):
	$DefaultBar/Contenter/VBoxContainer/Sublabel.horizontal_alignment = horizontal
	pass

func clearSpecialBar():
	for i in $SpecialBar/SubViewportContainer/SubViewport.get_children():
		$SpecialBar/SubViewportContainer/SubViewport.remove_child(i)
		i.free()
		pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
