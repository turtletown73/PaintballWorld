execute store result score @s powerup run scoreboard players get @e[type=item_display,tag=PowerUp,distance=..3,sort=nearest,limit=1] powerup
kill @e[type=item_display,tag=PowerUp,distance=..3,sort=nearest,limit=1]

execute if score @s powerup matches 1 run tellraw @s {"text": "You got the homing arrows powerup!","color": "#888800"}
execute if score @s powerup matches 2 run tellraw @s {"text": "You got the no opponent jump powerup!","color": "#888800"}
execute if score @s powerup matches 3 run tellraw @s {"text": "You got the opponent glowing powerup!","color": "#888800"}
execute if score @s powerup matches 4 run tellraw @s {"text": "You got the hunter powerup!","color": "#888800"}
execute if score @s powerup matches 5 run tellraw @s {"text": "You got the opponent slowness powerup!","color": "#888800"}
execute if score @s powerup matches 6 run tellraw @s {"text": "You got the self destruct powerup! (Crouch to self destruct)","color": "#888800"}
execute if score @s powerup matches 7 run tellraw @s {"text": "You got the double jump powerup! (Crouch to double jump)","color": "#888800"}