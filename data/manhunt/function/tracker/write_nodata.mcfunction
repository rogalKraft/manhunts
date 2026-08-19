# tracker/write_nodata — a tracker with nothing to point at.
#
# Macro. Required key: slot   (from manhunt:tmp wargs)
# Call sites: tracker/decide_nodata
#
# `item replace`, not `item modify`, because no loot function REMOVES a component and
# the lodestone_tracker must go — otherwise the needle keeps indicating a position the
# pack no longer stands behind. Only runs on entry into this state.

$item replace entity @s $(slot) with minecraft:compass[minecraft:custom_data={mh:1b},minecraft:item_name=[{"translate":"manhunt.tracker.name","fallback":"Tracker ","color":"gray"},{"translate":"manhunt.tracker.nodata","fallback":"no data","color":"dark_gray","italic":true}]] 1
