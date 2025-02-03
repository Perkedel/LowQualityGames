extends Node

enum UltraStates{
	init = 0,
	inGame = 1,
}

@export var ultraState:UltraStates = UltraStates.init:
	set = _on_ultraState

var GamesOnIt:PackedStringArray = [""]
var currentGameBoot:PackedScene
var currentGameBootInstance:Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#await get_tree().create_timer(.1).timeout
	#refreshGames()
	LqgAppLists.connect("plsLaunchThisApp",_on_AppList_LaunchThisApp)
	$LQGScaffold.setTitleAlignment(HORIZONTAL_ALIGNMENT_LEFT)
	$LQGScaffold.setTitleSmallAlignment(HORIZONTAL_ALIGNMENT_LEFT)
	$LQGScaffold.setTitle("Low Quality Games")
	$LQGScaffold.setTitleSmall("Select games to launch")
	pass # Replace with function body.

func clearGames():
	GamesOnIt.clear()
	pass

func refreshGames():
	clearGames()
	var folder = DirAccess.open("res://LQGCardtridge")
	if folder:
		folder.list_dir_begin()
		var file = folder.get_next()
		while file != "":
			if folder.current_is_dir():
				print("Found directory: " + file)
				if(file != "__CORE"):
					GamesOnIt.append(file)
					pass
			else:
				print("Found file: " + file)
			file = folder.get_next()
		pass
	else:
		printerr("Werror accessing Cardtridge")
	
	print("Games we have: ")
	for i in GamesOnIt:
		print(i)
	LqgAppLists.appsList = GamesOnIt
	#LqgAppLists.refresh()
	pass

func _on_ultraState(val:UltraStates):
	match(val):
		UltraStates.init:
			pass
		UltraStates.inGame:
			pass
		_:
			pass
	ultraState = val
	pass

func _on_AppList_LaunchThisApp(whichIs:String):
	print("wants to launch " + whichIs)
	currentGameBoot = load("res://LQGCardtridge/"+whichIs+"/boot.tscn")
	if currentGameBoot:
		currentGameBootInstance = currentGameBoot.instantiate()
	$LQGScaffold.setTitleAlignment(HORIZONTAL_ALIGNMENT_CENTER)
	$LQGScaffold.setTitleSmallAlignment(HORIZONTAL_ALIGNMENT_CENTER)
	$LQGScaffold.launchApp(currentGameBootInstance)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _notification(what: int) -> void:
	match what:
		_:
			pass
	pass
