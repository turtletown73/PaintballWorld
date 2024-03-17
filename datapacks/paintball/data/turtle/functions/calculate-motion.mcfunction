execute store result score @s gunFirstX run data get entity @s Pos[0] 1000
execute store result score @s gunFirstY run data get entity @s Pos[1] 1000
execute store result score @s gunFirstZ run data get entity @s Pos[2] 1000
teleport @s ^ ^ ^0.1
execute store result score @s gunSecondX run data get entity @s Pos[0] 1000
execute store result score @s gunSecondY run data get entity @s Pos[1] 1000
execute store result score @s gunSecondZ run data get entity @s Pos[2] 1000

scoreboard players operation @s gunSecondX -= @s gunFirstX
scoreboard players operation @s gunSecondY -= @s gunFirstY
scoreboard players operation @s gunSecondZ -= @s gunFirstZ

execute as @p if predicate turtle:green_team run tag @e[type=arrow,tag=bullet,tag=!motion_added,sort=nearest,limit=1] add green
execute as @p if predicate turtle:red_team run tag @e[type=arrow,tag=bullet,tag=!motion_added,sort=nearest,limit=1] add red

data modify entity @s Owner set from entity @p UUID

function turtle:apply-motion
tag @s add motion_added