extends CharacterBody3D

@export var _mouse_sensitivity   := 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 


func _input(event):
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * _mouse_sensitivity
		
		var current_tilt: float = $Camera3D.rotation_degrees.x     
		current_tilt -= mouse_motion.relative.y * _mouse_sensitivity
		
		$Camera3D.rotation_degrees.x = clamp(current_tilt, -90, 90)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
