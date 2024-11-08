extends NodeState

@export var character: NonPlayableCharacter
@export var animated_sprite_2d: AnimatedSprite2D
@export var idle_time_interval: float = 5.0

@onready var idle_timer: Timer = Timer.new()

var idle_timeout: bool = false
var animation_name: String = "idle"

func _ready() -> void:
	idle_timer.wait_time = idle_time_interval
	idle_timer.timeout.connect(on_idle_timeout)
	add_child(idle_timer)

func _on_process(_delta: float) -> void:
	pass
	
	
func _on_physics_process(_delta: float) -> void:
	pass
	

func _on_next_transitions() -> void:
	if idle_timeout:
		transition.emit("Walk")

func _on_enter() -> void:
	var rand_value = randi() % 10
	animation_name = "idle_alt" if rand_value < 4 else "idle"
	animated_sprite_2d.play(animation_name)
	idle_timeout = false
	idle_timer.start()
	
	
func _on_exit() -> void:
	animated_sprite_2d.stop()
	idle_timer.stop()
	
func on_idle_timeout() -> void:
	idle_timeout = true
