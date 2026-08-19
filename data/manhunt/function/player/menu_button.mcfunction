# Runs as one living runner, emitting one clickable line to the hunter who opened the
# menu — who is NOT @s here, so the line is sent to the whole hunter side and filtered
# by the trigger the click sets.
#
# mh.pick carries index+1, never the index itself: a trigger set to 0 is
# indistinguishable from an unused trigger, so runner 0 would be unpickable.

execute store result score #b mh.tmp run scoreboard players get @s mh.index
scoreboard players add #b mh.tmp 1
execute store result storage manhunt:tmp b.pick int 1 run scoreboard players get #b mh.tmp

function manhunt:player/menu_line with storage manhunt:tmp b
