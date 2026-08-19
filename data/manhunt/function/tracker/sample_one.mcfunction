# Runs as, and at, one runner.
#
# The dimension gate is BELOW the capture but ABOVE the write: values are collected
# into scratch storage first, then exactly one of the three branches commits them. A
# runner in a custom dimension matches no branch, so nothing is written at all and the
# previous records stay frozen (FR-5.2) — rather than being overwritten with a
# position from a dimension the pack does not model.

execute store result storage manhunt:tmp args.idx int 1 run scoreboard players get @s mh.index
execute store result storage manhunt:tmp args.x int 1 run data get entity @s Pos[0]
execute store result storage manhunt:tmp args.y int 1 run data get entity @s Pos[1]
execute store result storage manhunt:tmp args.z int 1 run data get entity @s Pos[2]
execute store result storage manhunt:tmp args.at int 1 run time query gametime

execute if dimension minecraft:overworld run function manhunt:tracker/sample/overworld
execute if dimension minecraft:the_nether run function manhunt:tracker/sample/the_nether
execute if dimension minecraft:the_end run function manhunt:tracker/sample/the_end
