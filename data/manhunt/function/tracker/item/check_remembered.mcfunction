# tracker/item/check_remembered — is the tracker still where we last saw it?
#
# Macro. Required key: slot   (from manhunt:tmp wargs, set by item/slot_name)
# Call sites: tracker/item/locate
#
# This one command is the whole steady-state cost of knowing where the tracker is.

$execute if items entity @s $(slot) minecraft:compass[minecraft:custom_data~{mh:1b}] run scoreboard players set #found mh.tmp 1
