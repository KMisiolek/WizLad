extends CharacterBody2D

var left_hand

##instantiate our move speed as a variable in case we want 
## to change it dynamically (debuffs, environmental factors, etc)
var move_speed = 500

##start the game holding no potions, but ready to store any of them.
##POTIONS
var blue_potion_stock = ["blue",0]
var green_potion_stock = ["green",0]
var red_potion_stock = ["red",0]
var potion_stock_array = [blue_potion_stock, green_potion_stock, red_potion_stock]

func rummage(potion_color):
	##gain a potion from an area of the storeroom, then add it to the potion stock array.
	
	##1st array: blue, 2nd array: green, 3rd array: red. Increment to its second element per Match.
	match potion_color:
		"blue":
			potion_stock_array[0][1]+=1
		"green":
			potion_stock_array[1][1]+=1
		"red":
			potion_stock_array[2][1]+=1
		

func throw_potion(color):
	const BLUE_POTION = preload("res://blue_potion.tscn")
	const GREEN_POTION = preload("res://green_potion.tscn")
	const RED_POTION = preload("res://red_potion.tscn")
	if(color=="blue"):
		potion_stock_array[0][1]-=1
		var new_blue_pot = BLUE_POTION.instantiate()
		new_blue_pot.position = %ThrowingArm.position
	elif(color == "green"):
		potion_stock_array[1][1]-=1
		var new_green_pot = GREEN_POTION.instantiate()
		new_green_pot.position = %ThrowingArm.position
	elif(color == "red"):
		potion_stock_array[2][1]-=1
		var new_red_pot = RED_POTION.instantiate()
		new_red_pot.position = %ThrowingArm.position

func _physics_process(delta):
	var direction = Input.get_vector('null', 'null', "move_down", "move_up")
	velocity = direction * move_speed * delta
	move_and_slide()
