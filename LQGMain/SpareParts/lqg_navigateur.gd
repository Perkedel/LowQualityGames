extends Node

@onready var containsApps = $UISelector/AppList/ScrollContainer/HFlowContainer
@onready var gameInsert = $InsertGameHere/SubViewport
var baseAppButton:PackedScene = load("res://LQGMain/SpareParts/LQG_AppButton.tscn")
# Called when the node enters the scene tree for the first time.

func _init() -> void:
	#clearApps()
	#fillApps(LqgAppLists.appsList)
	#LqgAppLists.connect("appsListChanged",_on_AppList)
	pass

func _ready() -> void:
	clearApps()
	fillApps(LqgAppLists.getAppList())
	LqgAppLists.connect("appsListChanged",_on_AppList)
	pass # Replace with function body.

func clearApps():
	for i in containsApps.get_children():
		containsApps.remove_child(i)
		i.free()
	pass

func fillApps(with:PackedStringArray):
	for i in with:
		print("Appe " + i)
		var nowThing:LQG_AppButton = baseAppButton.instantiate()
		nowThing.label = i
		nowThing.idName = i
		nowThing.connect("launchApp",_on_anAppButton_Launch)
		containsApps.add_child(nowThing)
		pass
	pass

func refreshApps():
	clearApps()
	fillApps(LqgAppLists.appsList)
	pass

func _on_AppList(changed:PackedStringArray):
	print("refresha")
	clearApps()
	fillApps(changed)
	pass

func _on_anAppButton_Launch(idOf:String):
	LqgAppLists.plsLaunchThisGame(idOf)
	pass

func launchApp(with:Node):
	insertGameNow(with)

func insertGameNow(with:Node):
	#lalu masukan Royco
	gameInsert.add_child(with)
	$UISelector.hide()
	$InsertGameHere.show()
	pass

func unplugGameNow():
	for i in gameInsert.get_children():
		gameInsert.remove_child(i)
		i.free()
	$UISelector.show()
	$InsertGameHere.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
