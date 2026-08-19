# tracker/sample — capture each runner's position.
#
# No marker entities and no forceloading. Position comes off the player, who is loaded
# by definition; a proxy entity in an unloaded chunk is not, and reading one that
# fails makes `store result` write 0, destroying the record rather than skipping it.

execute as @a[scores={mh.role=1}] at @s run function manhunt:tracker/sample_one
