# hunter_lives = 0 means infinite: the counter is never touched, so elimination by
# lives cannot happen and win condition 3 can never fire (FR-7.3).
execute if data storage manhunt:config {hunter_lives:0} run return run tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"selector":"@s","color":"red"},{"translate":"manhunt.death.plain","fallback":" died.","color":"white"}]

scoreboard players remove @s mh.lives 1

execute if score @s mh.lives matches 1.. run tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"selector":"@s","color":"red"},{"translate":"manhunt.death.lives","fallback":" died — ","color":"white"},{"score":{"name":"@s","objective":"mh.lives"},"color":"yellow"},{"text":".","color":"white"}]
execute if score @s mh.lives matches ..0 run function manhunt:roles/api/eliminate
