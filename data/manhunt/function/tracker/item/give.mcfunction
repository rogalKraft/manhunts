# tracker/item/give — place a tracker the hunter does not currently have.
#
# Goes into the FIRST EMPTY hotbar slot (FR-4.8). Checked from 8 down to 0 so the
# lowest free index is the one that sticks. Nothing the player owns is ever displaced
# or destroyed — if the hotbar is full the tracker simply is not placed and the hunter
# is told why, which is recoverable; silently overwriting a slot is not.
#
# The blank item MUST be created here with `item replace`. Everything afterwards edits
# it in place with `item modify`, which can only modify an item that already exists —
# it does nothing on an empty slot. Picking a slot without also placing something left
# hunters with no compass at all until this was caught in-game 2026-08-11.

clear @s minecraft:compass[minecraft:custom_data~{mh:1b}]
scoreboard players set @s mh.slot -1
scoreboard players set @s mh.miss 0

execute unless items entity @s hotbar.8 * run scoreboard players set @s mh.slot 8
execute unless items entity @s hotbar.7 * run scoreboard players set @s mh.slot 7
execute unless items entity @s hotbar.6 * run scoreboard players set @s mh.slot 6
execute unless items entity @s hotbar.5 * run scoreboard players set @s mh.slot 5
execute unless items entity @s hotbar.4 * run scoreboard players set @s mh.slot 4
execute unless items entity @s hotbar.3 * run scoreboard players set @s mh.slot 3
execute unless items entity @s hotbar.2 * run scoreboard players set @s mh.slot 2
execute unless items entity @s hotbar.1 * run scoreboard players set @s mh.slot 1
execute unless items entity @s hotbar.0 * run scoreboard players set @s mh.slot 0

execute if score @s mh.slot matches ..-1 run return run function manhunt:tracker/item/hotbar_full

function manhunt:tracker/item/slot_name
function manhunt:tracker/item/place with storage manhunt:tmp wargs

# Forget the last written state so the next decide always paints the fresh item.
scoreboard players set @s mh.st -99
