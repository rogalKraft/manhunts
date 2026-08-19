# tracker/api/build — populate manhunt:track runners[] at match start.
#
# The list index IS the runner's identity: mh.index links a player to their slot, and
# every text that needs to show a runner renders {"selector":"@a[scores={mh.index=N}]"}
# rather than a stored name. No player name ever enters storage, a macro or an item
# component, which removes the escaping hazard (R-29) instead of guarding against it.

data modify storage manhunt:track runners set value []
scoreboard players set #idx mh.tmp 0
execute as @a[scores={mh.role=1}] run function manhunt:tracker/build_one

# Hunters start on auto-select (-1 = "nearest, decided each cycle").
scoreboard players set @a[scores={mh.role=2}] mh.target -1
