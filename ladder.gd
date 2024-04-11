extends CharacterBody2D

##assign our ladder a move speed so we can change it, say if we slide over spilled potion, or with a spell
var ladder_move_speed = 500

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "null", "null")
	velocity = direction * ladder_move_speed * delta
	move_and_slide()
