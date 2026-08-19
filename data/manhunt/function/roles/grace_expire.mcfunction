# The grace ran out. Whoever is missing is out.
#
# The absent player is not named: they are offline, so nothing can resolve their name,
# and inventing a lookup for it would mean storing names — which this pack never does.
#
# Setting the alive counters to the online counts is what makes win/check react on the
# next tick, without this function needing to know anything about win conditions.

scoreboard players set #grace mh.tmp -1

execute if score #r.on mh.tmp < #runners.alive mh.tmp run tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.grace.runner_out","fallback":"A runner did not come back and is out.","color":"white"}]
execute if score #h.on mh.tmp < #hunters.alive mh.tmp run tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.grace.hunter_out","fallback":"A hunter did not come back and is out.","color":"white"}]

scoreboard players operation #runners.alive mh.tmp < #r.on mh.tmp
scoreboard players operation #hunters.alive mh.tmp < #h.on mh.tmp
