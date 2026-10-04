```gdscript
extends Node2D

export (PackedScene, "res://scenes/player.tscn") :player_scene
export (PackedScene, "res://scenes/enemy.tscn") :enemy_scene

var score = 0
var enemy_spawn_timer = 0.0
const enemy_spawn_interval = 1.5

const max_enemies = 5
var active_enemies = 0

func _ready():
    # Start spawn timer
    enemy_spawn_timer = enemy_spawn_interval
    
    # Start spawn loop
    $Timer.start()

func _on_enemy_spinner_timeout():
    # Spawn a new enemy
    if active_enemies < max_enemies:
        var enemy_scene = $EnemyScene # Would be set in editor
        var enemy = enemy_scene.instantiate()
        add_child(enemy)
        active_enemies += 1
        enemy_spawn_timer = enemy_spawn_interval
        
    if active_enemies >= max_enemies:
        $Timer.stop()

func add_score(amount):
    score += amount
    print("Score: " + str(score))
```

func get_score() -> int:
    return score
```