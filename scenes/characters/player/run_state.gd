extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var run_speed: int = 100

func _on_process(_delta: float) -> void:
	pass
	
	
func _on_physics_process(_delta: float) -> void:
	var direction: Vector2 = GameInputEvents.movement_inputs()
	
	if direction == Vector2.LEFT:
		animated_sprite_2d.play("run_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("run_right")
	elif direction == Vector2.UP:
		animated_sprite_2d.play("run_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("run_front")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction
		
	player.velocity = direction * run_speed
	player.move_and_slide()
	

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")
		
	if !GameInputEvents.is_running():
		transition.emit("Walk")
	
	if GameInputEvents.use_tool():
		match player.current_tool:
			DataTypes.Tools.Axe:
				transition.emit("Chopping")
			DataTypes.Tools.Hoe:
				transition.emit("Tilling")
			DataTypes.Tools.WateringCan:
				transition.emit("Watering")
	

func _on_enter() -> void:
	pass
	
	
func _on_exit() -> void:
	animated_sprite_2d.stop()
