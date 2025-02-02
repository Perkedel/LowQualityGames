extends LQG_Boot

var reactMo:String = "":
	get:
		return reactMo
	set(value):
		reactMo = value
		compileSay()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	pass # Replace with function body.

func updateSay(to:String):
	$Control/TempOptione/Say.text = to
	pass

func compileSay():
	updateSay(reactMo + " Score: " + String.num(displayScore,2))
	pass

func _actState(currentState:States = 0) -> void:
	super(currentState)
	match (currentState):
		States.cleanup:
			reactMo = "Care to try again?"
			pass
		_:
			pass
	pass

func _postState():
	super()
	match (state):
		States.init:
			#reactMo = "Hello World!"
			pass
		States.started:
			reactMo = "Let's go!"
			pass
		States.gameover:
			reactMo = "You died!"
			timerToReset(5)
			pass
		States.cleanup:
			reactMo = "Care to try again?"
			pass
		_:
			pass
	pass

func _actScore(currentScore:float = 0) -> void:
	super(currentScore)
	pass

func yayReward():
	if(state == States.started):
		moveScore(1)
	pass

func ohNoes():
	if(state == States.started):
		moveScore(-1)
	pass

func _on_scoreSeemsAdded():
	super()
	if(state == States.started):
		reactMo = "Woohoo!"
	pass

func _on_scoreSeemsDecreased():
	super()
	if(state == States.started):
		reactMo = "Argh no!"
	pass

func _on_resetTimer_timeout():
	super()
	#reactMo = "Care to try again?"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	pass


func _on_start_pressed() -> void:
	setState(States.started)
	pass # Replace with function body.


func _on_addscore_pressed() -> void:
	yayReward()
	pass # Replace with function body.


func _on_decscore_pressed() -> void:
	ohNoes()
	pass # Replace with function body.


func _on_die_pressed() -> void:
	setState(States.gameover)
	pass # Replace with function body.
