```gdscript
extends Node

const SAVE_FILE = "user://savegame.save"

func save_game(player_position, score):
    var data = {
        "player_position": {
            "x": player_position.x,
            "y": player_position.y
        },
        "score": score
    }
    
    var error = storesave(data, SAVE_FILE)
    if error == OK:
        print("Game saved successfully!")
    else:
        print("Error saving game: " + str(error))

func load_game() -> dict:
    var data = {}
    var error = loadsave(data, SAVE_FILE)
    
    if error == OK:
        print("Game loaded successfully!")
        return data
    else:
        print("Error loading game: " + str(error))
        return {}
```