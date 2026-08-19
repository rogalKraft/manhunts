# E-4: the dragon is already dead in this world, so the runners' objective is gone.
# Overridable, because a host may deliberately want a rematch in a completed world.
scoreboard players set #start.ok mh.tmp 0
tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"red"},{"translate":"manhunt.start.dragon_slain","fallback":"The Ender Dragon has already been killed in this world.","color":"white"},{"text":" (allow_dragon_pre_slain)","color":"dark_gray"}]
