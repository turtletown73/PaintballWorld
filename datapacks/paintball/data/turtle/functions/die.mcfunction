execute as @s if predicate turtle:green_team run tp @s -12 65 96
execute as @s if predicate turtle:red_team run tp @s 23 65 47

scoreboard players set @s deaths 0
scoreboard players set @s powerup 0

tag @s remove honeyParticle
tag @s remove movee

effect give @s resistance infinite 4 true
scoreboard players set @s spawnProtection 120
effect give @s night_vision infinite 0 true
effect give @s saturation infinite 255 true

attribute @s generic.max_health base set 1
attribute @s generic.attack_damage base set 0