# A match is already running. Changes no state.
scoreboard players set #start.ok mh.tmp 0
tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"red"},{"translate":"manhunt.start.busy","fallback":"A match is already in progress. Force-end or reset it first.","color":"white"}]
