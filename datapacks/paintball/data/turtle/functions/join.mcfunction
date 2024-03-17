team leave @s
scoreboard players set @s team -1
scoreboard players set @s shootDelay 0
scoreboard players set @s inSpectator 0

attribute @s generic.attack_damage base set 0
attribute @s generic.max_health base set 1

tp @s 5 100 75
gamemode adventure @s

clear @s

execute if score @s advancementGenocide matches 1 run advancement grant @s only turtle:turtle/genocide
execute if score @s advancementPacifist matches 1 run advancement grant @s only turtle:turtle/pacifist
execute if score @s advancementKill matches 1 run advancement grant @s only turtle:turtle/kill
execute if score @s advancementWin matches 1 run advancement grant @s only turtle:turtle/win
execute if score @s advancementTryhard matches 1 run advancement grant @s only turtle:turtle/tryhard