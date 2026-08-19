# reset/soft — end-of-match teardown. The lightest reset tier (TECH §10).
#
# Removes everything the pack was projecting onto players while the match ran, and
# nothing else: the outcome, the roles and the position records all survive, because
# the end screen and a rematch both need them.
#
# Called from lifecycle/to_ended, so it runs on EVERY way a match can finish — a win,
# a timeout or an abort. Anything cleaned up only on the happy path is a leak waiting
# for someone to force-end.

function manhunt:lifecycle/lobby_release
function manhunt:lifecycle/gamerule/give_respawn

# Trackers are pack property, not player property (FR-4.15). Matched by the flag so a
# compass the player crafted is untouched.
clear @a minecraft:compass[minecraft:custom_data~{mh:1b}]
kill @e[type=minecraft:item,limit=64,nbt={Item:{components:{"minecraft:custom_data":{mh:1b}}}}]

# Per-hunter compass bookkeeping. Left behind these would make the next match's first
# cycle think the tracker is still in its old slot showing its old state.
scoreboard players reset @a mh.slot
scoreboard players reset @a mh.st
scoreboard players reset @a mh.px
scoreboard players reset @a mh.pz
scoreboard players reset @a mh.miss

# Back onto the locator bar. Over every player, not just role holders.
execute as @a run function manhunt:roles/waypoint_on

function manhunt:hud/bossbar_hide
