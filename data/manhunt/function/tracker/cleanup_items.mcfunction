# tracker/cleanup_items — a tracker only ever exists inside a hunter's inventory
# (FR-4.6). Dropping it destroys it, and resolve hands the hunter a fresh one on the
# next cycle, so throwing it away is not a way to lose it permanently.
#
# Matched by the custom_data flag on the ITEM ENTITY — never by item type and never by
# proximity to a player. The 1.21.1 prototype runs
#   kill @e[type=item, distance=..10, nbt={Item:{id:"minecraft:compass"}}]
# around every hunter every tick, which destroys compasses players legitimately own.
#
# `nbt=` is the expensive selector filter and is normally avoided, but an item entity
# carries no scoreboard and cannot be tagged before it exists. `type=` and `limit=`
# are both present, which is the hard rule, and this runs twice a second during a
# match rather than twenty times.

kill @e[type=minecraft:item,limit=64,nbt={Item:{components:{"minecraft:custom_data":{mh:1b}}}}]
