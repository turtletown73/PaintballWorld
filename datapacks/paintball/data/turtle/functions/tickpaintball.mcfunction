team empty green
team empty red
execute as @a if score @s team matches 1 run team join green @s
execute as @a if score @s team matches 2 run team join red @s

execute as @a[advancements={adventure/root=true}] run advancement revoke @s only minecraft:adventure/root
execute as @a[advancements={adventure/shoot_arrow=true}] run advancement revoke @s only minecraft:adventure/shoot_arrow

scoreboard players set playerCount teamKills 0
execute as @a[team=!spectator] run scoreboard players add playerCount teamKills 1

scoreboard players set green teamKills 0
scoreboard players set red teamKills 0

execute as @a if score @s levitationTime matches 1.. run scoreboard players remove @s levitationTime 1
execute as @a if score @s levitationTime matches ..0 run effect clear @s levitation

scoreboard players operation green teamKills += @a[team=green] kills
scoreboard players operation red teamKills += @a[team=red] kills

execute as @e run scoreboard players add @s existenceTime 1
execute as @a if score @s shootDelay matches 1.. run scoreboard players remove @s shootDelay 1

execute as @e[tag=bullet] if score @s existenceTime matches 75.. run kill @s

execute at @a[team=green] as @p if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. unless score @s powerup matches 1 if predicate turtle:has_gun run summon arrow ~ ~1.5 ~ {Tags:["bullet"],CustomName:'{"text":"Green Paintball","color": "#88ff88"}',Silent:1b}
execute at @a[team=red] as @p if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. unless score @s powerup matches 1 if predicate turtle:has_gun run summon arrow ~ ~1.5 ~ {Tags:["bullet"],CustomName:'{"text":"Red Paintball","color": "#ff8888"}',Silent:1b}
execute at @a as @p if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. if predicate turtle:has_gun run playsound entity.firework_rocket.large_blast ambient @a ~ ~ ~ 0.5
execute at @a as @p if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. if predicate turtle:has_gun run playsound entity.slime.squish ambient @a ~ ~ ~ 0.7
execute at @a as @p if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. if predicate turtle:has_gun run playsound entity.snowball.throw ambient @a ~ ~ ~

function turtle:power-ups

execute at @a as @p if score @p shootDelay matches ..0 if score @p fungusUses matches 1.. if predicate turtle:has_gun run scoreboard players set @s shootDelay 5

execute as @e[tag=bullet,tag=!motion_added] at @s rotated as @p run function turtle:calculate-motion

execute at @a as @p if score @p fungusUses matches 1.. if predicate turtle:has_gun run scoreboard players set @p fungusUses 0

execute as @e[tag=bullet,tag=green] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 green_concrete replace white_concrete
execute as @e[tag=bullet,tag=green] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 green_concrete replace red_concrete
execute as @e[tag=bullet,tag=green] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 green_stained_glass_pane replace red_stained_glass_pane
execute as @e[tag=bullet,tag=green] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 green_stained_glass_pane replace white_stained_glass_pane
execute as @e[tag=bullet,tag=red] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 red_concrete replace white_concrete
execute as @e[tag=bullet,tag=red] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 red_concrete replace green_concrete
execute as @e[tag=bullet,tag=red] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 red_stained_glass_pane replace green_stained_glass_pane
execute as @e[tag=bullet,tag=red] at @s if predicate turtle:on_ground run fill ~-0.25 ~-0.25 ~-0.25 ~0.25 ~0.25 ~0.25 red_stained_glass_pane replace white_stained_glass_pane

execute as @e[tag=bullet,tag=green] at @s run particle dust 0 1 0 2 ~ ~ ~
execute as @e[tag=bullet,tag=red] at @s run particle dust 1 0 0 2 ~ ~ ~

execute as @e[tag=bullet] if predicate turtle:on_ground run kill @s

execute as @a if score @s reset matches 1.. run function turtle:reset

execute as @a if score @s howtoplay matches 1.. run tellraw @s {"text": "Hey, I noticed you are new! Right click your paintball gun in main hand to shoot, and do /trigger swapTeam to switch team if too little are on the other team.","color": "#ffff00"}    
execute as @a if score @s howtoplay matches 1.. run scoreboard players set @s howtoplay 0

execute as @a run scoreboard players set @s hasSwitchedSpectator 0
execute as @a[team=!red,team=!green] unless score @s inSpectator matches 1 if score @s hasSwitchedSpectator matches 0 if score @s spectator matches 1.. run function turtle:enter-spectator
execute as @a[team=!red,team=!green] if score @s inSpectator matches 1 if score @s hasSwitchedSpectator matches 0 if score @s spectator matches 1.. run function turtle:leave-spectator
execute as @a[team=red] if score @s spectator matches 1.. run tellraw @s {"text": "Cannot enter spectator if in game!","color": "#ff8888"}
execute as @a[team=green] if score @s spectator matches 1.. run tellraw @s {"text": "Cannot enter spectator if in game!","color": "#ff8888"}
execute as @a if score @s spectator matches 1.. run scoreboard players set @s spectator 0

execute as @a[tag=can_reset] run scoreboard players enable @s reset
execute as @a run scoreboard players enable @s howtoplay
execute as @a run scoreboard players enable @s spectator

function turtle:count-teams

execute as @e[type=player,scores={deaths=1..}] run function turtle:die

execute as @a at @s if block ~ ~-1 ~ light_blue_glazed_terracotta run effect give @s speed 1 3 true
execute as @a at @s if block ~ ~-1 ~ pink_glazed_terracotta run effect give @s jump_boost 1 3 true

execute if score time timeTicks matches 1.. run scoreboard players remove time timeTicks 1

execute if score time timeTicks matches ..0 if score game roundRunning matches 1 run function turtle:end-round

execute if score time timeTicks matches ..0 if score game roundRunning matches 0 if score playerCount teamKills matches 2.. run function turtle:start-round
execute if score time timeTicks matches ..0 if score game roundRunning matches 0 unless score playerCount teamKills matches 2.. run scoreboard players set time timeTicks 200

scoreboard players operation time teamKills = time timeTicks
scoreboard players operation time teamKills /= twenty placeholders

execute if score game roundRunning matches 1 if score red teamCount matches 0 if score time timeTicks matches ..2380 run function turtle:end-round
execute if score game roundRunning matches 1 if score green teamCount matches 0 if score time timeTicks matches ..2380 run function turtle:end-round

execute store result storage turtle:scoreboard red int 1 run scoreboard players get red teamKills
execute store result storage turtle:scoreboard green int 1 run scoreboard players get green teamKills
execute store result storage turtle:scoreboard time int 1 run scoreboard players get time teamKills

function turtle:scoreboard with storage turtle:scoreboard

scoreboard players set game totalScore 0
scoreboard players operation game totalScore += @a kills

execute as @a[team=red] if score game totalScore matches 1.. run scoreboard players operation @s mathMax = cool placeholders
execute as @a[team=green] if score game totalScore matches 1.. run scoreboard players operation @s mathMax = cool placeholders
execute as @a[team=red] if score game totalScore matches 1.. run scoreboard players operation @s mathMax *= big placeholders
execute as @a[team=green] if score game totalScore matches 1.. run scoreboard players operation @s mathMax *= big placeholders
execute as @a[team=red] if score game totalScore matches 1.. run scoreboard players operation @s mathMax /= game totalScore
execute as @a[team=green] if score game totalScore matches 1.. run scoreboard players operation @s mathMax /= game totalScore

execute as @a[team=red] if score game totalScore matches 1.. run scoreboard players operation @s math = red teamKills
execute as @a[team=green] if score game totalScore matches 1.. run scoreboard players operation @s math = green teamKills
execute as @a[team=red] if score game totalScore matches 1.. run scoreboard players operation @s math *= @s mathMax
execute as @a[team=green] if score game totalScore matches 1.. run scoreboard players operation @s math *= @s mathMax
execute as @a[team=red] if score game totalScore matches 1.. run scoreboard players operation @s math /= big placeholders
execute as @a[team=green] if score game totalScore matches 1.. run scoreboard players operation @s math /= big placeholders
execute as @a[team=red] if score game totalScore matches 1.. run scoreboard players operation @s math -= one placeholders
execute as @a[team=green] if score game totalScore matches 1.. run scoreboard players operation @s math -= one placeholders

execute as @a[team=red] if score game totalScore matches 0 run scoreboard players set @s math 0
execute as @a[team=green] if score game totalScore matches 0 run scoreboard players set @s math 0

execute as @a[team=!red,team=!green] run scoreboard players set @s math 0

execute as @a run function turtle:set-xp

execute as @e[type=armor_stand,tag=PowerUpSpawn] at @s if score time timeTicks matches 1200 unless entity @e[type=item_display,tag=PowerUp,distance=..3] run summon item_display ~ ~2 ~ {item:{id:"minecraft:parrot_spawn_egg",Count:1},Tags:["PowerUp"]}
execute if score time timeTicks matches 1200 run tellraw @a {"text": "Powerups Have Respawned!","color": "#888800"}

execute as @a if score @s spawnProtection matches 1.. run scoreboard players remove @s spawnProtection 1
execute as @a if score @s spawnProtection matches ..0 run effect clear @s minecraft:resistance
execute as @a[team=red] if score @s spawnProtection matches 1.. at @s if entity @s[z=51,dz=1] run scoreboard players set @s spawnProtection 0
execute as @a[team=green] if score @s spawnProtection matches 1.. at @s if entity @s[z=92,dz=1] run scoreboard players set @s spawnProtection 0

execute as @a[tag=movee] at @s run ride @s mount @e[tag=movee,type=!player,limit=1,sort=nearest]

execute as @e[type=item_display,tag=PowerUp] at @s run particle dust 0.5 0.5 0.5 2 ~ ~ ~ 0.5 0.5 0.5 1 3 normal @a
execute as @e[type=item_display,tag=PowerUp] at @s unless score @s powerup matches 1..7 store result score @s powerup run random value 1..7

execute as @a[team=red] at @s if entity @e[type=item_display,tag=PowerUp,distance=..2.5,sort=nearest,limit=1] run function turtle:get-power-up
execute as @a[team=green] at @s if entity @e[type=item_display,tag=PowerUp,distance=..2.5,sort=nearest,limit=1] run function turtle:get-power-up

#Triggers
function turtle:list-powerups