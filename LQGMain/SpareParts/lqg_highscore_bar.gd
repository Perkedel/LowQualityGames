extends Control


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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
