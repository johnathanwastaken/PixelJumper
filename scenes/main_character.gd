extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
const INVINCIBILITY_TIME = 0.5  # half-second of invincibility after getting hit

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var game_manager: Node      = %GameManager

var jump_count = 0
var damage_cooldown = 0.0

func jump():
	AudioManager.play_jump()      # ◀︎ play jump SFX
	velocity.y = JUMP_VELOCITY

func jump_side(x):
	AudioManager.play_jump()      # ◀︎ reuse jump SFX for side‐bounce
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta: float) -> void:
	# — Invincibility cooldown —
	if damage_cooldown > 0:
		damage_cooldown -= delta

	# — Gravity & reset double-jump animations —
	if is_on_floor():
		jump_count = 0
		if velocity.x > 1 or velocity.x < -1:
			sprite_2d.animation = "running"
		else:
			sprite_2d.animation = "default"
	else:
		velocity += get_gravity() * delta
		if jump_count == 2:
			sprite_2d.animation = "double_jumping"
		else:
			sprite_2d.animation = "jumping"

	# — Handle jump input (max 2) —
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		AudioManager.play_jump()    # ◀︎ also play jump on input

	# — Horizontal movement & deceleration —
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)

	# — Move & handle ONE enemy collision per frame —
	move_and_slide()
	for i in range(get_slide_collision_count()):
		var coll  = get_slide_collision(i)
		var other = coll.get_collider()
		if other != null and other.is_in_group("enemies") and damage_cooldown <= 0:
			var n = coll.get_normal()
			# Stomp if we land on its top surface (normal points up)
			if n.y < -0.7:
				AudioManager.play_stomp()   # ◀︎ stomp SFX
				other.queue_free()
				jump()
			else:
				AudioManager.play_hurt()    # ◀︎ hurt SFX
				AudioManager.play_hit()     # ◀︎ **play the hit sound here**
				# Side/bottom hit → take one damage and start cooldown
				game_manager.decrease_health()
				damage_cooldown = INVINCIBILITY_TIME
				var from_right = global_position.x < other.global_position.x
				var kb = -500 if from_right else 500
				jump_side(kb)
			break  # only process the first enemy collision

	# — Flip sprite —
	sprite_2d.flip_h = velocity.x < 0
