# A real target. Compare against the last written position and only rewrite if it moved
# more than compass_move_threshold on either horizontal axis. Vertical movement is
# ignored on purpose: a compass needle cannot express it, so redrawing for it is churn.

execute store result score #tx mh.tmp run data get storage manhunt:tmp rec.x
execute store result score #tz mh.tmp run data get storage manhunt:tmp rec.z
execute store result score #thr mh.tmp run data get storage manhunt:config compass_move_threshold
scoreboard players set #neg1 mh.tmp -1

scoreboard players operation #dx mh.tmp = #tx mh.tmp
scoreboard players operation #dx mh.tmp -= @s mh.px
execute if score #dx mh.tmp matches ..-1 run scoreboard players operation #dx mh.tmp *= #neg1 mh.tmp
execute if score #dx mh.tmp > #thr mh.tmp run scoreboard players set #write mh.tmp 1

scoreboard players operation #dz mh.tmp = #tz mh.tmp
scoreboard players operation #dz mh.tmp -= @s mh.pz
execute if score #dz mh.tmp matches ..-1 run scoreboard players operation #dz mh.tmp *= #neg1 mh.tmp
execute if score #dz mh.tmp > #thr mh.tmp run scoreboard players set #write mh.tmp 1

execute if score #write mh.tmp matches 0 run return 0

data modify storage manhunt:tmp wargs.x set from storage manhunt:tmp rec.x
data modify storage manhunt:tmp wargs.y set from storage manhunt:tmp rec.y
data modify storage manhunt:tmp wargs.z set from storage manhunt:tmp rec.z
function manhunt:tracker/item/slot_name
execute store result storage manhunt:tmp wargs.tgt int 1 run scoreboard players get @s mh.target

# The state word is passed as a translate KEY plus its English fallback, because a
# macro cannot build a nested component — both halves have to travel as plain strings.
execute if score #st mh.tmp matches 1 run data modify storage manhunt:tmp wargs.st set value "manhunt.tracker.live"
execute if score #st mh.tmp matches 1 run data modify storage manhunt:tmp wargs.fb set value "live"
execute if score #st mh.tmp matches 1 run data modify storage manhunt:tmp wargs.col set value "green"
execute if score #st mh.tmp matches 2 run data modify storage manhunt:tmp wargs.st set value "manhunt.tracker.stale"
execute if score #st mh.tmp matches 2 run data modify storage manhunt:tmp wargs.fb set value "last seen"
execute if score #st mh.tmp matches 2 run data modify storage manhunt:tmp wargs.col set value "gold"

function manhunt:tracker/write_compass with storage manhunt:tmp wargs

scoreboard players operation @s mh.st = #st mh.tmp
scoreboard players operation @s mh.px = #tx mh.tmp
scoreboard players operation @s mh.pz = #tz mh.tmp
