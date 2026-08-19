# Runs as the player who died. Latch FIRST, so every early return below still leaves
# the edge consumed and the same death cannot be processed twice.
#
# 40 ticks, not 1: the latch has to outlive the respawn statistic that arrives a tick
# or two later for the SAME death. See check_one for what happens without it.

scoreboard players set @s mh.dead 40
scoreboard players set @s mh.deaths 0

# Deaths outside a running match are not the pack's business (FR-7.8), and a death in
# the lobby or the head start costs nothing (FR-7.7).
execute unless data storage manhunt:state {phase:"running"} run return 0

execute if score @s mh.role matches 1 run function manhunt:respawn/death_runner
execute if score @s mh.role matches 2 run function manhunt:respawn/death_hunter
