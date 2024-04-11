extends CharacterBody2D

const THROW_ANGLE = 'that way'

func _physics_process(delta):
	var direction = THROW_ANGLE
	
	move_and_slide()
	
func collide(surface):
	
	if(surface == "wizard"):
		##check to see if casting or moving ladder, in other circumstances increase score
		if(%wizard.casting_state != "casting"):
			%ScoreLabel.update_score(50)
		else:
			%wizard.hit_by_potion("red")
	else:
		##play breaking sound as potion hits floor or obstacle, penalty at higher difficulties?
		$AudioStreamPlayer.play()
