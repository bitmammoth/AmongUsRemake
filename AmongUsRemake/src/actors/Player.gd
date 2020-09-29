class_name Player
extends KinematicBody2D


export var speed: Vector2
var velocity = Vector2(10, 0)


func _physics_process(delta):
	velocity = get_movement_vector()
	velocity = move_and_slide(velocity)
	
	
func get_movement_vector() -> Vector2:
	var move_vector: Vector2
	
	move_vector.x = (
		Input.get_action_strength("right") - Input.get_action_strength("left")
	)
	move_vector.y = (
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if move_vector.x < 0:
		$AnimatedSprite.flip_h = true
	if move_vector.x > 0:
		$AnimatedSprite.flip_h = false
	
	return move_vector * speed
