# roles/arm — give @s a usable menu.
#
# `enable` grants exactly one use, so this is only the initial arm; each handler
# re-arms after consuming (core/trigger/*).
scoreboard players enable @s mh.menu
scoreboard players enable @s mh.pick
