extends Node

#var appsList:Array = [
	#{
		#"name" : "",
		#"icon" : load("res://LQGMain/Assets/img/mavrickle.png"),
	#},
#]
var appsList:PackedStringArray = [""]:
	set(value):
		appsList = value
		emit_signal("appListChanged", value)

signal appsListChanged(changed:PackedStringArray)
signal plsLaunchThisApp(whichIs:String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func clearAppsList():
	appsList.clear()

func fillAppsList(with:PackedStringArray):
	appsList = with

func getAppList() -> PackedStringArray:
	clearAppsList()
	var folder = DirAccess.open("res://LQGCardtridge")
	if folder:
		folder.list_dir_begin()
		var file = folder.get_next()
		while file != "":
			if folder.current_is_dir():
				print("Found directory: " + file)
				if(file != "__CORE"):
					appsList.append(file)
					pass
			else:
				print("Found file: " + file)
			file = folder.get_next()
		pass
	else:
		printerr("Werror accessing Cardtridge")
	
	print("Games we have: ")
	for i in appsList:
		print(i)
	
	return appsList
	pass

func plsLaunchThisGame(whichIs:String = ""):
	emit_signal("plsLaunchThisApp",whichIs)
	pass

func refresh():
	emit_signal("appListChanged",appsList)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
