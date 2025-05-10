# res://scenes/mushroom_enemy.gd
extends CharacterBody2D

@export var speed: int = 50
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var cliff_detector: RayCast2D  = $CliffDetector
@onready var wall_detector:  RayCast2D  = $WallDetector

var direction := -1
var edge_cooldown := 0.0

func _physics_process(delta: float) -> void:
	# — patrol cooldown —
	if edge_cooldown > 0:
		edge_cooldown -= delta

	# — update rays —
	cliff_detector.target_position = Vector2(direction * 12, 30)
	wall_detector.target_position  = Vector2(direction * 12,  0)
	cliff_detector.force_raycast_update()
	wall_detector.force_raycast_update()

	# — flip on edge or wall —
	if edge_cooldown <= 0 and (
	   not cliff_detector.is_colliding() or wall_detector.is_colliding()):
		direction *= -1
		edge_cooldown = 0.3

	# — movement & animation —
	velocity.x = direction * speed
	move_and_slide()
	sprite.play("run")
	sprite.flip_h = direction > 0
