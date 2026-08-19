# tracker/item/place — create the blank tracker.
#
# Macro. Required key: slot   (from manhunt:tmp wargs)
# Call sites: tracker/item/give
#
# `item replace`, because the slot is empty and `item modify` only edits an item that is
# already there. Runs once, when a hunter first receives the tracker or after they lose
# it; every update afterwards is an in-place modify with no flicker.

$item replace entity @s $(slot) with minecraft:compass[minecraft:custom_data={mh:1b},minecraft:item_name=[{"translate":"manhunt.tracker.name","fallback":"Tracker ","color":"gray"},{"translate":"manhunt.tracker.wait","fallback":"…","color":"dark_gray"}]] 1
