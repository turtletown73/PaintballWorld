execute if score red teamKills > green teamKills run title @a title {"text": "Red Wins!","color": "#ff8888"}
execute if score red teamKills > green teamKills run title @a subtitle {"text": "RIP Green Team.","color": "#88ff88"}
execute if score red teamKills > green teamKills run scoreboard players add @a[team=red] wins 1
execute if score red teamKills > green teamKills run scoreboard players add @a[team=red] winStreak 1
execute if score red teamKills > green teamKills run execute as @a[team=green] run scoreboard players set @s winStreak 0

execute if score red teamKills > green teamKills run advancement grant @a[team=red] only turtle:turtle/win
execute if score red teamKills > green teamKills run advancement grant @a[team=red,scores={kills=0}] only turtle:turtle/pacifist
execute if score red teamKills > green teamKills run advancement grant @a[team=red,scores={kills=15..}] only turtle:turtle/genocide
execute if score red teamKills > green teamKills run advancement grant @a[team=red,scores={winStreak=3..}] only turtle:turtle/tryhard

execute if score red teamKills > green teamKills run scoreboard players set @a[team=red] advancementWin 1
execute if score red teamKills > green teamKills run scoreboard players set @a[team=red,scores={kills=0}] advancementPacifist 1
execute if score red teamKills > green teamKills run scoreboard players set @a[team=red,scores={kills=15..}] advancementGenocide 1
execute if score red teamKills > green teamKills run scoreboard players set @a[team=red,scores={winStreak=3..}] advancementTryhard 1

execute if score green teamKills > red teamKills run title @a title {"text": "Green Wins!","color": "#88ff88"}
execute if score green teamKills > red teamKills run title @a subtitle {"text": "RIP Red Team.","color": "#ff8888"}
execute if score green teamKills > red teamKills run execute as @a[team=green] run scoreboard players add @s wins 1
execute if score green teamKills > red teamKills run execute as @a[team=green] run scoreboard players add @s winStreak 1
execute if score green teamKills > red teamKills run execute as @a[team=red] run scoreboard players set @s winStreak 0

execute if score green teamKills > red teamKills run advancement grant @a[team=green] only turtle:turtle/win
execute if score green teamKills > red teamKills run advancement grant @a[team=green,scores={kills=0}] only turtle:turtle/pacifist
execute if score green teamKills > red teamKills run advancement grant @a[team=green,scores={kills=15..}] only turtle:turtle/genocide
execute if score green teamKills > red teamKills run advancement grant @a[team=green,scores={winStreak=3..}] only turtle:turtle/tryhard


execute if score green teamKills > red teamKills run scoreboard players set @a[team=green] advancementWin 1
execute if score green teamKills > red teamKills run scoreboard players set @a[team=green,scores={kills=0}] advancementPacifist 1
execute if score green teamKills > red teamKills run scoreboard players set @a[team=green,scores={kills=15..}] advancementGenocide 1
execute if score green teamKills > red teamKills run scoreboard players set @a[team=green,scores={winStreak=3..}] advancementTryhard 1

execute if score red teamKills = green teamKills run title @a title {"text": "NOBODY WINS!","color": "#ffff88"}
execute if score red teamKills = green teamKills run title @a subtitle {"text": "RIP Your Win Streak!","color": "#ffff88"}

advancement revoke @a[team=!spectator] only turtle:turtle/root
scoreboard players set game roundRunning 0
scoreboard players set time timeTicks 200
scoreboard players set @a kills 0

kill @e[type=item_display,tag=PowerUp]

effect clear @a slowness
effect clear @a speed
effect clear @a blindness
effect clear @a glowing
effect clear @a jump_boost
scoreboard players set @a powerup 0
tag @a remove honeyParticle

scoreboard objectives setdisplay below_name wins
scoreboard objectives setdisplay list wins