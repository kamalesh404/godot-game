```gdscript
extends CharacterBody2D

export (int, 1..100) = 100 :speed
export (String, "") = "res://ui/hud.tscn" :hud_scene

var velocity = Vector2()

func _process(delta):
    # Input handling
    var input_dir = Vector2.ZERO
    
    if Input.is_action_pressed("ui_right"):
        input_dir.x += 1
    if Input.is_action_pressed("ui_left"):
        input_dir.x -= 1
    if Input.is_action_pressed("ui_up"):
        input_dir.y -= 1
    if Input.is_action_pressed("ui_down"):
        input_dir.y += 1
    
    # Normalize direction to prevent diagonal speed increase
    if input_dir.length() > 0:
        input_dir = input_dir.normalized()
    
    # Apply movement
    velocity = input_dir * :speed
    position += velocity * get_process_delta()
    
    # Keep player on screen
    const screen_size = get_viewport_rect().size
    position.x = clamp(position.x, 0, screen_size.width - rect_size.width)
    position.y = clamp(position.y, 0, screen_size.height - rect_size.height)
```

func _ready():
    # Connect to health when taking damage
    $CollisionShape2D.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
    if body.is_in_group("enemy"):
        # Take damage
        print("Player hit by enemy!")
```

func die():
    # Emit signal for game over
    $CollisionShape2D.parent.queue_free()
```

func _on_hit():
    # Flash red on hit
    modulate = Color(1, 0, 0, 1)
    wait_time = 0.1
    modulate = Color(1, 1, 1, 1)
```