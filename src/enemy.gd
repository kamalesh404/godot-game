```gdscript
extends Area2D

export (int, 1..200) = 50 :speed
export (String, "enemy") :group_name

func _ready():
    # Set up collision detection
    $CollisionShape2D.body_entered.connect(_on_body_entered)
    
    # Random initial position
    const screen_size = get_viewport_rect().size
    position = Vector2(
        randrange(0, screen_size.width - rect_size.width),
        randrange(0, screen_size.height - rect_size.height)
    )

func _process(delta):
    # Move enemy downwards
    position.y += :speed * get_process_delta()
    
    # Reset position when off-screen
    const screen_size = get_viewport_rect().size
    if position.y > screen_size.height:
        position = Vector2(
            randrange(0, screen_size.width - rect_size.width),
            -rect_size.height
        )
```

func _on_body_entered(body):
    if body.is_in_group("player"):
        # Emit signal or notify game manager
        print("Enemy hit player!")
        queue_free()
```