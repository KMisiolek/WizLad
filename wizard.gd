extends CharacterBody2D

var wizard_state = "not_casting"

##update state to "busy" for duration of casting spells or while moving ladder

##%Spell_Timer.connect("timeout", %Spell_Timer, "_on_timer_timeout")

func cast_spell(invocation):
	##When our wizard casts a spell, check the cast time and set a timer to set
	## his state for casting for purposes of locking him out from catching potions.
	%Spell_Timer.time_left = invocation.cast_time
	wizard_state = "casting"
	%Spell_Timer.start()
	##start the timer
	
	##do the magic here once we determine spells
	##SPELLS
	
	
func _on_timer_timeout() -> void:
	wizard_state = "not_casting"
	##Revert the wizard's state to not_casting when the timer linked to their
	## spell is over. Likely a more elegant way to do this.
	
	
func hit_by_potion(color):
	##add a colored effect on the wizard according to potion type thrown
	
	
	##play a sound effect for the bottle breaking
	%BottleBreakAdStrmPlyr2D.play()	
	
	
	
	##decrease health or score in some modes?
	##disable any current spells?
	##lockout spells for some time?
