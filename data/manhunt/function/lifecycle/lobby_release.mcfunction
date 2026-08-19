# lifecycle/lobby_release — undo the pen on every exit path.
#
# Called from to_prep AND from to_ended, because a match aborted during the lobby must
# not leave anyone in adventure mode with zeroed attributes. A leaked modifier here is
# invisible until someone notices they take no fall damage (R-4), so removal is
# deliberately unconditional and idempotent — removing an absent modifier is harmless.

gamemode survival @a[scores={mh.role=1..2}]
effect clear @a[scores={mh.role=1..2}] minecraft:resistance
effect clear @a[scores={mh.role=1..2}] minecraft:saturation
effect clear @a[scores={mh.role=1..2}] minecraft:fire_resistance

execute as @a run function manhunt:lifecycle/lobby_attrs_clear
