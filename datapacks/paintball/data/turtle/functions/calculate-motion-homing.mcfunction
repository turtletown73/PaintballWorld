execute store result score @s gunFirstX run data get entity @s Pos[0] 1000
execute store result score @s gunFirstY run data get entity @s Pos[1] 1000
execute store result score @s gunFirstZ run data get entity @s Pos[2] 1000
teleport @s ^ ^ ^0.05
execute store result score @s gunSecondX run data get entity @s Pos[0] 1000
execute store result score @s gunSecondY run data get entity @s Pos[1] 1000
execute store result score @s gunSecondZ run data get entity @s Pos[2] 1000

scoreboard players operation @s gunSecondX -= @s gunFirstX
scoreboard players operation @s gunSecondY -= @s gunFirstY
scoreboard players operation @s gunSecondZ -= @s gunFirstZ

function turtle:apply-motion