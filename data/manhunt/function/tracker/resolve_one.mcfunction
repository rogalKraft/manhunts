# Runs as, and at, one hunter. Per-hunter state only — nothing here touches another
# player, which is the bug that makes the 1.21.1 prototype unusable with two hunters
# (its `clear @a` wipes every other hunter's compass on each update).

function manhunt:tracker/item/locate
execute if score @s mh.slot matches ..-1 run return 0

function manhunt:tracker/select_target

# state: 0 = nodata, 1 = live, 2 = stale
scoreboard players set #st mh.tmp 0
execute if score @s mh.target matches ..-1 run return run function manhunt:tracker/decide

# Which record applies is decided by the HUNTER's dimension, not the runner's — that
# is the whole cross-dimension mechanic (PRD §7.10).
scoreboard players set #dim.known mh.tmp 0
execute if dimension minecraft:overworld run function manhunt:tracker/dim/overworld
execute if dimension minecraft:the_nether run function manhunt:tracker/dim/the_nether
execute if dimension minecraft:the_end run function manhunt:tracker/dim/the_end
execute if score #dim.known mh.tmp matches 0 run return run function manhunt:tracker/decide

execute store result storage manhunt:tmp rargs.idx int 1 run scoreboard players get @s mh.target
function manhunt:tracker/read_record with storage manhunt:tmp rargs

execute unless data storage manhunt:tmp rec{valid:true} run return run function manhunt:tracker/decide

# Freshness from the timestamp, not from a cross-dimension entity lookup. A record
# written within the last few sample intervals is being updated right now, which can
# only be true while the runner is in this dimension. Cheap, and it needs no selector
# that reaches across dimensions.
execute store result score #now mh.tmp run time query gametime
execute store result score #rec.at mh.tmp run data get storage manhunt:tmp rec.at
scoreboard players operation #now mh.tmp -= #rec.at mh.tmp
execute store result score #stale.lim mh.tmp run data get storage manhunt:config sample_interval_ticks 3

scoreboard players set #st mh.tmp 2
execute if score #now mh.tmp <= #stale.lim mh.tmp run scoreboard players set #st mh.tmp 1

function manhunt:tracker/decide
