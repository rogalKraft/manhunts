# tracker/item/locate — find where THIS hunter keeps their tracker.
#
# The slot is the player's choice, not the pack's: hotbar, offhand and the whole main
# inventory are all valid homes, and the tracker updates wherever it sits.
#
# Cost is kept to ONE check in the steady state. The remembered slot is tested first,
# and the full 37-slot sweep only runs on the cycle where the item actually moved.
# Sweeping unconditionally would be 37 checks per hunter twice a second to answer a
# question whose answer almost never changes.
#
# mh.slot: -1 nowhere addressable, 0-8 hotbar, 9 offhand, 10-36 inventory 0-26.

scoreboard players set #found mh.tmp 0

execute if score @s mh.slot matches 0.. run function manhunt:tracker/item/slot_name
execute if score @s mh.slot matches 0.. run function manhunt:tracker/item/check_remembered with storage manhunt:tmp wargs

execute if score #found mh.tmp matches 0 run function manhunt:tracker/item/scan

execute if score @s mh.slot matches 0.. run scoreboard players set @s mh.miss 0
execute if score @s mh.slot matches ..-1 run function manhunt:tracker/item/missing
