# hud/actionbar_hunter — the line under a hunter's crosshair.
#
# The compass needle gives direction; this gives identity, freshness and rough range.
# Runs off the same resolved state the tracker just produced, so it costs no lookups.

execute as @a[scores={mh.role=2}] at @s run function manhunt:hud/hunter_line
