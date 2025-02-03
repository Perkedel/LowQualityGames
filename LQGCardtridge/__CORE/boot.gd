extends Node

class_name LQG_Boot

@export var displayName:String = "A Low Quality Game"
enum States{
	init = 0, # game booted
	started = 1, # game start
	gameover = 2, # game end failed
	finished = 3, # game end success
	cleanup = 4, # reset everything
}
var state:States = States.init:
	get:
		return state
	set(value):
		#if(value == _prevState):
			#return state
		state = value
var _prevState:States = States.init
var score:float = 0.0:
	set(value):
		score = value
		if(state == States.started):
			displayScore = value
		_actScore(value)
		if(value > _prevScore):
			_on_scoreSeemsAdded()
		elif(value < _prevScore):
			_on_scoreSeemsDecreased()
		_prevScore = value
	get:
		return score
var _prevScore:float = 0.0
var displayScore:float = 0.0:
	get:
		return displayScore
var goingToReset:bool = false
var resetTimer:SceneTreeTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setState(to:States = States.init):
	#safety matcher
	if(to == _prevState):
		return
	
	match to:
		States.init:
			goingToReset = false
			#if resetTimer:
				#resetTimer.free()
			displayScore = 0
			setScore(0)
			pass
		States.started:
			if resetTimer:
				#resetTimer.free()
				resetTimer.disconnect("timeout",_on_resetTimer_timeout)
			pass
		States.gameover:
			pass
		States.finished:
			pass
		States.cleanup:
			goingToReset = false
			#if resetTimer:
				#resetTimer.free()
			setScore(0)
			pass
		_:
			pass
	state = to
	_prevState = to
	_actState(to)
	_postState()
	pass

func _postState():
	match state:
		States.cleanup:
			# reset now
			setState(States.init)
			pass
		_:
			pass
	pass

func _actState(currentState:States = 0) -> void:
	#override everything here!
	pass

func _actScore(currentScore:float = 0) -> void:
	#override what happen when score changes. USE SUPER, DO NOT FORGET! THERE ARE REACTIONARY STATES TOO!
	pass

func _on_scoreSeemsAdded():
	#override
	pass

func _on_scoreSeemsDecreased():
	#override
	pass

func setScore(to:float = 0):
	score = to
	# check hi-score! if score > hi-score then set that
	pass

func moveScore(by:float = 1):
	setScore(score+by)
	pass

func timerToReset(inWhat:float = 5.0):
	print("Reset Timer")
	resetTimer = get_tree().create_timer(inWhat)
	resetTimer.connect("timeout",_on_resetTimer_timeout)
	goingToReset = true
	pass

func _on_resetTimer_timeout():
	print("Reset Ring")
	#if resetTimer:
		#resetTimer.free()
	setState(States.cleanup)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
