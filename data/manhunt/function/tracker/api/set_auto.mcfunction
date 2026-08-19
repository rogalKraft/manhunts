scoreboard players set @s mh.target -1
scoreboard players set @s mh.st -99
tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.target.auto","fallback":"Tracking the nearest runner.","color":"white"}]
