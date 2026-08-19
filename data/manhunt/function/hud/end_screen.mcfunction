# hud/end_screen — winner announcement, shown to EVERYONE including spectators and
# unassigned players (FR-6.7).
#
# Do NOT render outcome.winner / outcome.reason through an {"nbt":...} component: a
# string tag renders in its SNBT form, quotes included, so the screen read
#   "none" win - "aborted"
# Caught in-game 2026-08-11; mcvalidate cannot see this class of defect. Branch on the
# value and emit a real sentence instead. These literals move behind translate+fallback
# keys when hud/strings is built (D-13).

execute store result score #dur.s mh.tmp run data get storage manhunt:state outcome.duration
scoreboard players set #c20 mh.tmp 20
scoreboard players operation #dur.s mh.tmp /= #c20 mh.tmp

execute if data storage manhunt:state {outcome:{winner:"runners"}} run function manhunt:hud/end/runners
execute if data storage manhunt:state {outcome:{winner:"hunters"}} run function manhunt:hud/end/hunters
execute if data storage manhunt:state {outcome:{winner:"none"}} run function manhunt:hud/end/aborted
