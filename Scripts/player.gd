extends CharacterBody2D


@export var speed = 90.0
@export var jump_speed = -200.0
@export var projectile : PackedScene
@export var reload_seconds = 1.0

const Direction = GlobalEnums.Direction
@export var start_heading := Direction.RIGHT
@onready var heading = start_heading
@onready var sprite = $Sprite2D
@onready var teeth = $TeethArea

func get_width():
	return $CollisionShape2D.shape.radius

func _ready():
	$ReloadTimer.wait_time = reload_seconds

var physics_counter : int = 0

func _physics_process(delta):
	physics_counter += 1
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = 0.0
		#velocity.x = move_toward(velocity.x, 0, speed)

	heading = compute_new_heading()
	update_sprite()
	
		
	if Input.is_action_just_pressed("shoot"):
		request_shoot()

	process_collisions()

	move_and_slide()
	
func request_shoot():
	if $ReloadTimer.is_stopped():
		$AnimationPlayer.play("shoot")

func shoot():
	var new_bullet = projectile.instantiate() #todo how to pass concstructor arguments
	new_bullet.heading = GlobalEnums.horizontal(heading)
	var spawn_position = global_position
	spawn_position += GlobalEnums.as_vector2(heading) * .5 * (get_width() + new_bullet.get_width())
	new_bullet.global_position = spawn_position
	%Bubbles.add_child(new_bullet)
	
	$ReloadTimer.start()
	
	show_teeth()

func compute_new_heading() -> Direction:
	var result : Direction
	var old_horizontal_heading = GlobalEnums.horizontal(heading)	
	result = GlobalEnums.from_vector2(velocity)
	if velocity.x == 0.0:
		result |= old_horizontal_heading
	return result
	
func update_sprite():
	sprite.flip_h = heading & Direction.LEFT
	
func process_collisions():
	var collisions_count = get_slide_collision_count()
	for i in range(collisions_count):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider == null:
			continue
		if collider.has_method("pop"):
			#it's a bubble
			var collision_angle = collision.get_angle()
			#from below
			if collision_angle <= PI / 3.0:
				
				print ("from_top")
			#from side
			elif collision_angle <= PI / 3.0 * 2.0:
				print ("from_side")
			else: 
				print ("from_below")
				collider.pop()


func _on_teeth_area_body_entered(body):
	if body.has_method("pop"):
		body.pop()

func show_teeth():
	teeth.process_mode = Node.PROCESS_MODE_INHERIT
	
	var teeth_relative_position = teeth.global_position - global_position
	
	if heading & Direction.LEFT:
		teeth.global_position = global_position + -abs(teeth_relative_position)
	else:
		teeth.global_position = global_position + abs(teeth_relative_position)
	teeth.visible = true

func hide_teeth():
	teeth.visible = false
	teeth.process_mode = Node.PROCESS_MODE_DISABLED


func _on_animation_player_animation_finished(anim_name):	
	if anim_name == "shoot":
		hide_teeth()
