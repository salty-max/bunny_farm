class_name GameInputEvents

static var direction: Vector2

static func movement_inputs() -> Vector2:
	if Input.is_action_pressed("walk_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO
	
	return direction
	
	
static func is_movement_input() -> bool:
	return direction != Vector2.ZERO
	
	
static func is_running() -> bool:
	return direction != Vector2.ZERO && Input.is_action_pressed("run")
	
	
static func use_tool() -> bool:
	return Input.is_action_pressed("use")
