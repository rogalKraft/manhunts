# Nothing to point at. Written via `item replace` rather than `item modify` because
# there is no loot function that REMOVES a component — only set_components — and the
# lodestone_tracker has to go, or the needle keeps confidently indicating a position
# the pack no longer stands behind (FR-4.12).
#
# The replace only happens on entry into this state, not every cycle, so the reset is
# a single blink at a dimension boundary rather than a permanent stutter.

execute if score #write mh.tmp matches 0 run return 0

function manhunt:tracker/item/slot_name
function manhunt:tracker/write_nodata with storage manhunt:tmp wargs

scoreboard players set @s mh.st 0
