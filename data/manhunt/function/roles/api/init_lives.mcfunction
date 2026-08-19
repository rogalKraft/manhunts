# roles/api/init_lives — called from lifecycle/begin. Lives are fixed at match start,
# so changing the config mid-match cannot retroactively revive anyone (PRD §10.1).
#
# hunter_lives = 0 means infinite; the counter is still set, but respawn/* never
# decrements it (FR-7.3).

# Snapshot the starting role. Elimination overwrites mh.role with spectator, so
# without this a rematch would begin with everyone who died still spectating.
scoreboard players operation @a[scores={mh.role=1..2}] mh.role0 = @a[scores={mh.role=1..2}] mh.role

scoreboard players set @a[scores={mh.role=1..2}] mh.deaths 0
scoreboard players set @a[scores={mh.role=1..2}] mh.dead 0

execute store result score #cfg.rl mh.tmp run data get storage manhunt:config runner_lives
execute store result score #cfg.hl mh.tmp run data get storage manhunt:config hunter_lives

execute as @a[scores={mh.role=1}] store result score @s mh.lives run scoreboard players get #cfg.rl mh.tmp
execute as @a[scores={mh.role=2}] store result score @s mh.lives run scoreboard players get #cfg.hl mh.tmp

# Living-side counters. Win conditions read THESE, never a selector count.
#
# `unless entity @a[scores={mh.role=1}]` would be the obvious test for "no runners
# left", but a selector only matches players who are ONLINE — so the only runner
# disconnecting would instantly hand the match to the hunters. A counter changes only
# when someone is actually eliminated, which is what the disconnect grace period in
# the PRD depends on.
scoreboard players set #runners.alive mh.tmp 0
scoreboard players set #hunters.alive mh.tmp 0
execute as @a[scores={mh.role=1}] run scoreboard players add #runners.alive mh.tmp 1
execute as @a[scores={mh.role=2}] run scoreboard players add #hunters.alive mh.tmp 1

# No countdown pending at match start.
scoreboard players set #grace mh.tmp -1
