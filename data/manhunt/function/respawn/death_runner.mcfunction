scoreboard players remove @s mh.lives 1

execute if score @s mh.lives matches 1.. run tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"selector":"@s","color":"green"},{"translate":"manhunt.death.lives","fallback":" died — ","color":"white"},{"score":{"name":"@s","objective":"mh.lives"},"color":"yellow"},{"text":".","color":"white"}]
execute if score @s mh.lives matches ..0 run function manhunt:roles/api/eliminate
