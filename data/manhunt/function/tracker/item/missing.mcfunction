# tracker/item/missing — the tracker is not in a hotbar slot. That is not the same as
# it being lost.
#
# It is legitimately absent from the hotbar while the player is DRAGGING it (it sits
# on the cursor, in no slot at all) or while they have stashed it in the main
# inventory. Re-issuing on the first missed cycle made the item impossible to move:
# picking it up caused the pack to hand back a fresh copy half a second later, which
# read as the tracker being welded to its slot. Reported 2026-08-11.
#
# So: anywhere in the inventory or on the cursor counts as held. Only a genuine
# disappearance — dropped, died, destroyed — increments the counter, and a new tracker
# arrives after two seconds of real absence.

execute if items entity @s player.cursor minecraft:compass[minecraft:custom_data~{mh:1b}] run return run scoreboard players set @s mh.miss 0
execute if items entity @s container.* minecraft:compass[minecraft:custom_data~{mh:1b}] run return run scoreboard players set @s mh.miss 0

scoreboard players add @s mh.miss 1
execute if score @s mh.miss matches 4.. run function manhunt:tracker/item/give
