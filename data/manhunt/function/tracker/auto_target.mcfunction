# Auto-selection: the nearest living runner in the hunter's OWN dimension (FR-3.8).
#
# `distance=` is what makes "in my dimension" expressible: it is measured in the
# execution dimension, and resolve_one runs `at @s`, so runners in other dimensions
# simply do not match. A bare @a would reach across all three.

scoreboard players set #auto mh.tmp -1
execute at @s as @a[scores={mh.role=1},distance=..100000000,sort=nearest,limit=1] run scoreboard players operation #auto mh.tmp = @s mh.index

# Nobody here: fall back to any living runner, so the compass still points at their
# last known position in this dimension rather than going blank.
execute if score #auto mh.tmp matches ..-1 as @a[scores={mh.role=1},limit=1] run scoreboard players operation #auto mh.tmp = @s mh.index

scoreboard players operation @s mh.target = #auto mh.tmp
