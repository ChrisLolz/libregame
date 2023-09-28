extends CanvasModulate

@export var gradient:GradientTexture1D
@export var INGAME_SPEED = 1.0
@export var INITIAL_HOUR = 12:
	set(h):
		INITIAL_HOUR = h
		time = INGAME_TO_REAL * INITIAL_HOUR * INITIAL_HOUR

const MINUTES_PER_DAY = 1440
const MINUTES_PER_HOUR = 60
const INGAME_TO_REAL = (2 * PI ) / MINUTES_PER_DAY

signal time_tick(day:int, hour:int, minute:int)

var time:float = 0.0
var past_minute:float = -1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	time = INGAME_TO_REAL * INITIAL_HOUR * MINUTES_PER_HOUR


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	time += delta * INGAME_TO_REAL * INGAME_SPEED
	var value = (sin(time - PI/ 2)+1.0) / 2.0
	self.color = gradient.gradient.sample(value)
	_recalculate_time()

func _recalculate_time():
	var total_minutes = int(time / INGAME_TO_REAL)
	var day = int(total_minutes / MINUTES_PER_DAY)
	var current_day_minutes = total_minutes % MINUTES_PER_DAY
	var hour = int(current_day_minutes / MINUTES_PER_HOUR)
	var minute = int(current_day_minutes % MINUTES_PER_HOUR)
	
	if hour >= 24 or hour < 6:
		time = 0
	
	if past_minute != minute:
		past_minute = minute
		time_tick.emit(day, hour, minute)
