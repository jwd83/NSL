extends RigidBody2D

var wheels = []
var torque = 400
var max_speed = 140

func _ready():
	wheels = get_tree().get_nodes_in_group('wheel')


func _physics_process(delta):
	var max_v = 0
	
	var direction = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')

	for wheel in wheels:
		if abs(wheel.angular_velocity) > max_v:
			max_v = abs(wheel.angular_velocity)
		if direction:
			if abs(wheel.angular_velocity) < max_speed:
				print('torque time')
				wheel.apply_torque_impulse(torque * direction * delta * 50)
		else:
			print('coasting')
			
	max_v = roundf(max_v)

	$Camera2D/Label.text = str(max_v)
