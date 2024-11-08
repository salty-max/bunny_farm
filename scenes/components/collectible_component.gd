class_name CollectibleComponent extends Area2D

@export var collectible_name: String
@export var float_amplitude: float = 10.0  # Maximum distance to move up/down
@export var float_speed: float = 2.0  # Speed of the movement

var original_position: Vector2
var time_passed: float = 0.0

func _ready() -> void:
	# Store the original position of the parent node when the component is ready
	original_position = get_parent().position

func _process(delta: float) -> void:
	time_passed += delta * float_speed
	var offset = sin(time_passed) * float_amplitude
	get_parent().position.y = original_position.y + offset

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print(collectible_name + " collected")
		get_parent().queue_free()
