# tracker/decide — write the item only when something the player can see has changed.
#
# This is FR-4.9, and it is the reason the compass no longer flickers: `item modify`
# and `item replace` both reset the held item's render state, so doing either every
# cycle makes the compass visibly stutter in the hand. In the steady state — a runner
# standing still, or moving less than the threshold — nothing is written at all.

scoreboard players set #write mh.tmp 0

# State change always writes: live/stale/nodata must be visible immediately.
execute unless score #st mh.tmp = @s mh.st run scoreboard players set #write mh.tmp 1

execute if score #st mh.tmp matches 0 run function manhunt:tracker/decide_nodata
execute if score #st mh.tmp matches 1.. run function manhunt:tracker/decide_target
