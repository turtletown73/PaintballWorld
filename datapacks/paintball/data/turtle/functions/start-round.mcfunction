execute as @a[team=playing] run function turtle:enter-game
function turtle:reset
scoreboard players set time timeTicks 2400
scoreboard players set game roundRunning 1

execute as @e[type=armor_stand,tag=PowerUpSpawn] at @s run summon item_display ~ ~2 ~ {item:{id:"minecraft:parrot_spawn_egg",Count:1},Tags:["PowerUp"]}

scoreboard objectives setdisplay below_name kills
scoreboard objectives setdisplay list kills