# reset/clear/players — per-player match state.
#
# Roles are NOT cleared here: a rematch with the same teams should be one action
# (FR-10.3). reset/full clears them separately.
#
# Eliminated players are returned from spectator to survival, because the pack put
# them there (FR-10.5). Nobody else's gamemode is touched.

# Put eliminated players back on the side they started on, then out of spectator.
# Restoring the role BEFORE the gamemode keeps the two consistent at every point.
execute as @a[scores={mh.role=3}] if score @s mh.role0 matches 1..2 run scoreboard players operation @s mh.role = @s mh.role0
execute as @a[scores={mh.role=3}] run gamemode survival @s
execute as @a[scores={mh.role=1..2}] run gamemode survival @s
scoreboard players reset @a mh.role0

scoreboard players reset @a mh.lives
scoreboard players reset @a mh.target
scoreboard players reset @a mh.index
scoreboard players reset @a mh.dead
scoreboard players reset @a mh.deaths
scoreboard players reset @a mh.dragon

scoreboard players reset #runners.alive mh.tmp
scoreboard players reset #hunters.alive mh.tmp
