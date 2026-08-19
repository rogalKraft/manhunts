execute store result score #grace mh.tmp run data get storage manhunt:config disconnect_grace_seconds
tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.grace.left","fallback":"A player has left. The match continues — they have ","color":"white"},{"score":{"name":"#grace","objective":"mh.tmp"},"color":"yellow"},{"text":"s.","color":"white"}]
