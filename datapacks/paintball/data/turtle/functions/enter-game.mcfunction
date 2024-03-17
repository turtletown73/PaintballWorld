clear @s
gamemode adventure @s

scoreboard players set @s powerup 0

item replace entity @s hotbar.0 with warped_fungus_on_a_stick{display:{Name:'{"text": "Paintball Gun","color": "#ffff00"}'}}

team leave @s
scoreboard players set @s team 0
scoreboard players set @s shootDelay 00
scoreboard players set @s kills 0

function turtle:count-teams

execute store result score @s team if score green teamCount = red teamCount run random value 1..2

execute if score green teamCount > red teamCount run scoreboard players set @s team 2
execute if score red teamCount > green teamCount run scoreboard players set @s team 1

execute if score @s team matches 1 run team join green
execute if score @s team matches 2 run team join red
execute if score @s team matches 1 run tp @s -12 65 96
execute if score @s team matches 2 run tp @s 23 65 47
execute if score @s team matches 1 run tellraw @s {"text": "You are now on team green!","color": "#88ff88"}
execute if score @s team matches 2 run tellraw @s {"text": "You are now on team red!","color": "#ff8888"}

execute unless score @s hasPlayed matches 1 run tellraw @s {"text": "Hey, I noticed you are new! Right click your paintball gun in main hand to shoot, and do /trigger swapTeam to switch team if too little are on the other team.","color": "#ffff00"}
execute unless score @s hasPlayed matches 1 run scoreboard players set @s hasPlayed 1

effect give @s night_vision infinite 0 true
effect give @s saturation infinite 255 true

tag @s remove honeyParticle
tag @s remove movee

attribute @s generic.max_health base set 1
attribute @s generic.attack_damage base set 0

scoreboard objectives setdisplay below_name kills
scoreboard objectives setdisplay list kills